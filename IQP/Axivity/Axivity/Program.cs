using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Numerics;
using System.Text;

namespace Axivity
{
	class MainClass
	{
		const double GRAVITY = 9.80665;
		const string STUDY_DATA = "/Users/kylesmith/Downloads/Study Data/";

        const string BASE = @"C:\Users\Kyle\Downloads\";

		const string TEST_CWA = "/Users/kylesmith/Desktop/data.cwa-bak";
		const string TEST_AXIVITY = "/Users/kylesmith/Desktop/6/";
		const string OUTPUT_FILE = BASE + "axivity_results.csv";

		public static void Main(string[] args)
		{
			/*
			if (!BitConverter.IsLittleEndian)
			{
				throw new NotSupportedException("This program cannot be run on a big endian system.");
			}
			var bytes = File.ReadAllBytes(TEST_CWA);
			CWAHeader header = new CWAHeader(bytes);
			Console.WriteLine(header.ToString());

			var block = new List<byte>();
			for(var i = 1024; i < 1536; i++)
			{
				block.Add(bytes[i]); 
			}
			var cwaBlock = new CWABlock(block.ToArray());
			Console.WriteLine(cwaBlock.ToString());
			Console.ReadLine();
			*/

			var sw = new Stopwatch();
			sw.Start();

			var sb = new StringBuilder();
			var files = Directory.GetFiles(BASE, "*_axivity.csv", SearchOption.AllDirectories);
			foreach (var file in files)
			{
				var participantNumber = file.Substring(file.LastIndexOf('/') + 1, file.IndexOf('_') - file.LastIndexOf('/') - 1).ToUpper();
				var axivity = File.ReadAllLines(file);
				var sum = 0.0;
				foreach (var l in axivity)
				{
					var line = l.Split(',');
					var x = Convert.ToDouble(line[1]);
					var y = Convert.ToDouble(line[2]);
					var z = Convert.ToDouble(line[3]);

					var v = new Vector3((float)x, (float)y, (float)z);
					var mag = v.Length();
					sum += mag;
				}
				sb.AppendLine(string.Format("{0},{1},{2}", participantNumber, sum, sum / axivity.Length));
			}
			File.WriteAllText(OUTPUT_FILE, sb.ToString());
			sw.Stop();
			Console.WriteLine("Done in {0} ms {1} sec", sw.ElapsedMilliseconds, sw.ElapsedMilliseconds / 1000.0);
			Console.ReadLine();

		}

		public class CWAHeader
		{
			/*
			 typedef struct
				{
					uint16_t packetHeader;                      ///< @ 0  +2   ASCII "MD", little-endian (0x444D)
					uint16_t packetLength;                      ///< @ 2  +2   Packet length (1020 bytes, with header (4) = 1024 bytes total)
					uint8_t  hardwareType;                      ///< @ 4  +1   Hardware type (0x00/0xff/0x17 = AX3, 0x64 = AX6)
					uint16_t deviceId;                          ///< @ 5  +2   Device identifier
					uint32_t sessionId;                         ///< @ 7  +4   Unique session identifier
					uint16_t upperDeviceId;                     ///< @11  +2   Upper word of device id (if 0xffff is read, treat as 0x0000)
					cwa_timestamp_t loggingStartTime;           ///< @13  +4   Start time for delayed logging
					cwa_timestamp_t loggingEndTime;             ///< @17  +4   Stop time for delayed logging
					uint32_t loggingCapacity;                   ///< @21  +4   (Deprecated: preset maximum number of samples to collect, should be 0 = unlimited)
					uint8_t  reserved1[1];                      ///< @25  +1   (1 byte reserved)
					uint8_t  flashLed;                          ///< @26  +1   Flash LED during recording
					uint8_t  reserved2[8];                      ///< @27  +8   (8 bytes reserved)
					uint8_t  sensorConfig;                      ///< @35  +1   Fixed rate sensor configuration, 0x00 or 0xff means accel only, otherwise bottom nibble is gyro range (8000/2^n dps): 2=2000, 3=1000, 4=500, 5=250, 6=125, top nibble non-zero is magnetometer enabled.
					uint8_t  samplingRate;                      ///< @36  +1   Sampling rate code, frequency (3200/(1<<(15-(rate & 0x0f)))) Hz, range (+/-g) (16 >> (rate >> 6)).
					cwa_timestamp_t lastChangeTime;             ///< @37  +4   Last change meta-data time
					uint8_t  firmwareRevision;                  ///< @41  +1   Firmware revision number
					int16_t  timeZone;                          ///< @42  +2   (Unused: originally reserved for a "Time Zone offset from UTC in minutes", 0xffff = -1 = unknown)
					uint8_t  reserved3[20];                     ///< @44  +20  (20 bytes reserved)
					uint8_t  annotation[OM_METADATA_SIZE];      ///< @64  +448 Scratch buffer / meta-data (448 characters, ignore trailing 0x20/0x00/0xff bytes, url-encoded UTF-8 name-value pairs)
					uint8_t  reserved[512];                     ///< @512 +512 (Reserved for device-specific meta-data in the same format as the user meta-data) (512 bytes)
				} cwa_header_t;
			*/

			private byte[] bytes;
			public char[] PacketHeader { get; set; }
			public ushort PacketLength { get; set; }
			public byte HardwareType { get; set; }
			public ushort DeviceID { get; set; }
			public uint SessionID { get; set; }
			public ushort UpperDeviceID { get; set; }
			public uint LoggingStartTime { get; set; }
			public uint LoggingEndTime { get; set; }
			public uint LoggingCapacity { get; set; }
			public byte Reserved1 { get; set; }
			public byte FlashLED { get; set; }
			public byte[] Reserved2 { get; set; }
			public byte SensorConfig { get; set; }
			public byte SamplingRate { get; set; }
			public uint LastChangeTime { get; set; }
			public byte FirmwareRevision { get; set; }
			public short TimeZone { get; set; }
			public byte[] Reserved3 { get; set; }
			public byte[] Annotation { get; set; }
			public byte[] Reserved4 { get; set; }

			public CWAHeader(byte[] bytes)
			{
				this.bytes = bytes;
				var md1 = (char)bytes[0];
				var md2 = (char)bytes[1];
				var len = readN(2, 2) + 4;
				var hw = bytes[4];
				var deviceID = readN(5, 2);
				var sessionID = readN(7, 4);
				var upperDeviceID = readN(11, 2);
				upperDeviceID = upperDeviceID == 0xffff ? 0x0 : upperDeviceID;
				var loggingStartTime = readN(13, 4);
				var loggingEndTime = readN(17, 4);
				var capacity = readN(21, 4);
				var reserved1 = readN(25, 1);
				var flashLED = readN(26, 1);
				var reserved2 = readN(27, 8);
				var sensorConfig = readN(35, 1);
				var samplingRate = readN(36, 1);
				var lastChangeTime = readN(37, 4);
				var fwRevision = readN(41, 1);
				var timeZone = readN(42, 2);
				var reserved3 = readN(44, 20);
				var annotation = readN(64, 448);
				var reserved4 = readN(512, 512);

				PacketHeader = new char[2];
				PacketHeader[0] = md1;
				PacketHeader[1] = md2;
				PacketLength = (ushort)len;
				HardwareType = hw;
				DeviceID = (ushort)deviceID;
				SessionID = (uint)sessionID;
				UpperDeviceID = (ushort)upperDeviceID;
				LoggingStartTime = (uint)loggingStartTime;
				LoggingEndTime = (uint)loggingEndTime;
				LoggingCapacity = (uint)capacity;
				Reserved1 = (byte)reserved1;
				FlashLED = (byte)flashLED;
				Reserved2 = BitConverter.GetBytes(reserved2);
				SensorConfig = (byte)sensorConfig;
				SamplingRate = (byte)samplingRate;
				LastChangeTime = (uint)lastChangeTime;
				FirmwareRevision = (byte)fwRevision;
				TimeZone = (short)timeZone;
				Reserved3 = BitConverter.GetBytes(reserved3);
				Annotation = BitConverter.GetBytes(annotation);
				Reserved4 = BitConverter.GetBytes(reserved4);
			}

			public override string ToString()
			{
				var sb = new StringBuilder();
				sb.AppendLine("Packet Header: " + string.Join("", PacketHeader));
				sb.AppendLine("Packet Length: " + PacketLength);
				sb.AppendLine("Hardware Type: " + HardwareType);
				sb.AppendLine("DeviceID: " + DeviceID);
				sb.AppendLine("SessionID: " + SessionID);
				sb.AppendLine("Upper Device ID: " + UpperDeviceID);
				sb.AppendLine("Start time: " + LoggingStartTime);
				sb.AppendLine("End time: " + LoggingEndTime);
				sb.AppendLine("Flash LED: " + FlashLED);
				sb.AppendLine("Sensor config: " + SensorConfig);
				sb.AppendLine("Sampling rate: " + (3200 / (1 << (15 - (SamplingRate & 0x0f)))));
				sb.AppendLine("Last change time: " + LastChangeTime);
				sb.AppendLine("Firmware revision number: " + FirmwareRevision);
				sb.AppendLine("\nSee https://github.com/digitalinteraction/openmovement/blob/master/Docs/ax3/ax3-technical.md for explanations of these values.");
				return sb.ToString();
			}

			private int readN(int start, int length)
			{
				var result = 0;
				for (var i = 0; i < length; i++)
				{
					if (i == 0)
					{
						result += bytes[start];
					}
					else
					{
						result += bytes[start + i] << ((2 + (i - 1)) * 4);
					}
				}
				return result;
			}
		}

		public class CWABlock
		{
			/*
			 typedef struct
			{
				uint16_t packetHeader;                      ///< @ 0  +2   ASCII "AX", little-endian (0x5841)	
				uint16_t packetLength;                      ///< @ 2  +2   Packet length (508 bytes, with header (4) = 512 bytes total)
				uint16_t deviceFractional;                  ///< @ 4  +2   Top bit set: 15-bit fraction of a second for the time stamp, the timestampOffset was already adjusted to minimize this assuming ideal sample rate; Top bit clear: 15-bit device identifier, 0 = unknown;
				uint32_t sessionId;                         ///< @ 6  +4   Unique session identifier, 0 = unknown
				uint32_t sequenceId;                        ///< @10  +4   Sequence counter (0-indexed), each packet has a new number (reset if restarted)
				cwa_timestamp_t timestamp;                  ///< @14  +4   Last reported RTC value, 0 = unknown
				uint16_t lightScale;                        ///< @18  +2   AAAGGGLLLLLLLLLL Bottom 10 bits is last recorded light sensor value in raw units, 0 = none; top three bits are unpacked accel scale (1/2^(8+n) g); next three bits are gyro scale (8000/2^n dps)
				uint16_t temperature;                       ///< @20  +2   Last recorded temperature sensor value in raw units (bottom 10-bits), 0 = none; (top 6-bits reserved)
				uint8_t  events;                            ///< @22  +1   Event flags since last packet, b0 = resume logging, b1 = reserved for single-tap event, b2 = reserved for double-tap event, b3 = reserved, b4 = reserved for diagnostic hardware buffer, b5 = reserved for diagnostic software buffer, b6 = reserved for diagnostic internal flag, b7 = reserved)
				uint8_t  battery;                           ///< @23  +1   Last recorded battery level in scaled/cropped raw units (double and add 512 for 10-bit ADC value), 0 = unknown
				uint8_t  sampleRate;                        ///< @24  +1   Sample rate code, frequency (3200/(1<<(15-(rate & 0x0f)))) Hz, range (+/-g) (16 >> (rate >> 6)).
				uint8_t  numAxesBPS;                        ///< @25  +1   0x32 (top nibble: number of axes, 3=Axyz, 6=Gxyz/Axyz, 9=Gxyz/Axyz/Mxyz; bottom nibble: packing format - 2 = 3x 16-bit signed, 0 = 3x 10-bit signed + 2-bit exponent)
				int16_t  timestampOffset;                   ///< @26  +2   Relative sample index from the start of the buffer where the whole-second timestamp is valid
				uint16_t sampleCount;                       ///< @28  +2   Number of sensor samples (if this sector is full -- Axyz: 80 or 120 samples, Gxyz/Axyz: 40 samples)
				uint8_t  rawSampleData[480];                ///< @30  +480 Raw sample data.  Each sample is either 3x/6x/9x 16-bit signed values (x, y, z) or one 32-bit packed value (The bits in bytes [3][2][1][0]: eezzzzzz zzzzyyyy yyyyyyxx xxxxxxxx, e = binary exponent, lsb on right)
				uint16_t checksum;                          ///< @510 +2   Checksum of packet (16-bit word-wise sum of the whole packet should be zero)
			} OM_READER_DATA_PACKET;
			*/
			private byte[] bytes;
			public char[] PacketHeader { get; set; }
			public ushort PacketLength { get; set; }
			public ushort Fractional { get; set; }
			public uint SessionID { get; set; }
			public uint SequenceID { get; set; }
			public DateTime Timestamp { get; set; }
			public ushort LightScale { get; set; }
			public ushort Temperature { get; set; }
			public byte Events { get; set; }
			public byte Battery { get; set; }
			public byte SampleRate { get; set; }
			public byte NumAxes { get; set; }
			public short TimestampOffset { get; set; }
			public ushort SampleCount { get; set; }
			public byte[] SampleData { get; set; }
			public ushort Checksum { get; set; }

			public CWABlock(byte[] bytes)
			{
				this.bytes = bytes;
				PacketHeader = new char[2];
				PacketHeader[0] = (char)bytes[0];
				PacketHeader[1] = (char)bytes[1];
				PacketLength = (ushort)(readN(2, 2) + 4);
				Fractional = (ushort)readN(4, 2);
				SessionID = (uint)readN(6, 4);
				SequenceID = (uint)readN(10, 4);
				Timestamp = ToDate((int)readN(14, 4));
				LightScale = (ushort)readN(18, 2);
				Temperature = (ushort)readN(20, 2);
				Events = (byte)readN(22, 1);
				Battery = (byte)readN(23, 1);
				SampleRate = (byte)readN(24, 1);
				SampleRate = ((byte)(3200 / (1 << (15 - (SampleRate & 0x0f)))));
				NumAxes = (byte)readN(25, 1);
				TimestampOffset = (short)readN(26, 2);
				SampleCount = (byte)readN(28, 2);
				SampleData = BitConverter.GetBytes(readN(30, 480));
				Checksum = (ushort)readN(510, 2);
			}

			//#define PACKED_VALUE(buffer, i) ((uint32_t)((uint8_t *)buffer)[30 + i * 4] | ((uint32_t)((uint8_t *)buffer)[31 + i * 4] << 8) | ((uint32_t)((uint8_t *)buffer)[32 + i * 4] << 16) | ((uint32_t)((uint8_t *)buffer)[33 + i * 4] << 24))
			// eezzzzzz zzzzyyyy yyyyyyxx xxxxxxxx
			private uint PackedValue()
			{
				return 0;
			}


			public override string ToString()
			{
				var sb = new StringBuilder();
				sb.AppendLine("PacketHeader: " + string.Join("", PacketHeader));
				sb.AppendLine("Length: " + PacketLength);
				sb.AppendLine("Fractional: " + Fractional);
				sb.AppendLine("SessionID: " + SessionID);
				sb.AppendLine("SequenceID: " + SequenceID);
				sb.AppendLine("Timestamp: " + Timestamp.ToShortDateString() + " -- " + Timestamp.ToShortTimeString());
				sb.AppendLine("Light scale: " + LightScale);
				sb.AppendLine("Temperature: " + Temperature);
				sb.AppendLine("Events: " + Events);
				sb.AppendLine("Battery: " + Battery);
				sb.AppendLine("Sample rate: " + SampleRate);
				sb.AppendLine("Number of axes: " + NumAxes);
				sb.AppendLine("Timestamp offset: " + TimestampOffset);
				sb.AppendLine("Sample count: " + SampleCount);
				sb.AppendLine("Raw data: " + string.Join(",", SampleData));
				sb.AppendLine("\nSee https://github.com/digitalinteraction/openmovement/blob/master/Docs/ax3/ax3-technical.md for explanations of these values.");
				return sb.ToString();

			}

			private int readN(int start, int length)
			{
				var result = 0;
				for (var i = 0; i < length; i++)
				{
					if (i == 0)
					{
						result += bytes[start];
					}
					else
					{
						result += bytes[start + i] << ((2 + (i - 1)) * 4);
					}
				}
				return result;
			}

			private DateTime ToDate(int timestamp)
			{
				var year = (int)((timestamp >> 26) & 0x3f) + 2000;
				var month = (int)((timestamp >> 22) & 0x0f);
				var day = (int)((timestamp >> 17) & 0x1f);
				var hours = (int)((timestamp >> 12) & 0x1f);
				var mins = (int)((timestamp >> 6) & 0x3f);
				var secs = (int)((timestamp) & 0x3f);
				return new DateTime(year, month, day, hours, mins, secs);
			}
		}
	}
}