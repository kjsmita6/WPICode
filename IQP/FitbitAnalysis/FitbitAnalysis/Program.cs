using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;

namespace FitbitAnalysis
{
	class MainClass
	{
        // This will change depending on the computer.
        const string DOWNLOADS = @"C:\Users\Kyle\OneDrive\";

		const string SURVEY_EXERCISE = DOWNLOADS + "survey_exercise.csv";
		const string SURVEY_CONTROL = DOWNLOADS + "survey_control.csv";
		const string STUDY_DATA = DOWNLOADS + @"\Study Data\";
		const string OUTPUT_FILE = STUDY_DATA + "fitbit_results.csv";

		public static void Main(string[] args)
		{
			var csv = new StringBuilder();
			var files = Directory.GetFiles(STUDY_DATA, "*_fitbit.csv", SearchOption.AllDirectories);
			var exerciseSurvey = File.ReadAllLines(SURVEY_EXERCISE);
			var controlSurvey = File.ReadAllLines(SURVEY_CONTROL);
			Stopwatch sw = new Stopwatch();
			sw.Start();
			foreach (var file in files)
			{
				var participantNumber = file.Substring(file.LastIndexOf('\\') + 1, file.IndexOf('_') - file.LastIndexOf('\\') - 1).ToUpper();
				var ageStr = (from line in participantNumber[0].ToString() == "C" ? controlSurvey : exerciseSurvey where line.Split(',')[0].ToUpper() == participantNumber select line).ElementAt(0).Split(',')[1];
				var age = Convert.ToInt32(ageStr);
				var fitbit = File.ReadAllLines(file);
                var hrs = new List<int>();
				var sum = 0.0;
                var over70 = 0.0;

                foreach (var line in fitbit)
				{
					var hr = Convert.ToInt32(line.Split(',')[1]);
					sum += hr;
                    if(percentHR(age, hr) > 70)
                    {
                        over70++;
                    }
                    hrs.Add(hr);
				}
				var mean = sum / fitbit.Length;

                hrs.Sort();

                var median = hrs[hrs.Count / 2];
				var vari = variance(fitbit, mean);
                var stdev = Math.Sqrt(vari);
                var percentOver70 = over70 / fitbit.Length;

                // Participant num, mean, median, standard deviation, variance, % of time over 70%
                csv.AppendLine(string.Format("{0},{1},{2},{3},{4},{5}", participantNumber, mean, median, stdev, vari, percentOver70 * 100));

			}
			File.WriteAllText(OUTPUT_FILE, csv.ToString());
			sw.Stop();
			Console.WriteLine("Done in {0} ms.", sw.ElapsedMilliseconds);
			Console.ReadLine();
		}

		private static double percentHR(int age, int highest)
		{
			// max * percent = highest
			// percent = highest / max
			var max = 220.0 - age;
			return (highest / max) * 100;
		}

		private static double variance(string[] lines, double mean)
		{
			var sum = 0.0;
			foreach (var line in lines)
			{
				var hr = Convert.ToInt32(line.Split(',')[1]);
				sum += Math.Pow(hr - mean, 2);
			}
			return sum / (lines.Length - 1);
		}
	}
}

