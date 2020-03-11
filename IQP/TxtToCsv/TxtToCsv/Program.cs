using System;
using System.IO;
using System.Text;

namespace TxtToCsv
{
	class MainClass
	{
		public static void Main(string[] args)
		{
			Console.Write("Directory path? ");
			string dir = Console.ReadLine();
			Console.WriteLine();
			string[] files = Directory.GetFiles(dir, "*.txt", SearchOption.AllDirectories);
			for (int i = 0; i < files.Length; i++)
			{
				StringBuilder sb = new StringBuilder();
				/*if (files[i].Split('.')[files[i].Length - 1] != "txt")
				{
					LogWarn("Skipping non-text file " + files[i]);
					continue;
				}*/
				string[] lines;
				Console.WriteLine("Reading file " + files[i]);
				try
				{
					lines = File.ReadAllLines(files[i]);
				}
				catch (Exception e)
				{
					LogError(e.Message + ": " + e.StackTrace);
					return;
				}
				if (lines.Length <= 0)
				{
					LogError("Error! File is empty.");
					return;
				}
				int columns = lines[0].Split(' ').Length;
				for (int j = 0; j < lines.Length; j++)
				{
					string line = lines[j];
					string[] l = line.Split(' ');
					string format = "";
					for (int k = 0; k < columns; k++)
					{
						if (k == columns - 1)
						{
							format += l[k];
						}
						else
						{
							format += l[k] + ",";
						}
					}
					sb.Append(format);
					sb.AppendLine();
				}
				string csv = sb.ToString();
				File.WriteAllText(files[i].Replace(".txt", ".csv"), csv);
				File.Delete(files[i]);
				LogSuccess("Successfully converted " + files[i] + " to csv format. Deleted original.");
			}
			return;
		}

		private static void LogError(string e)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine(e);
			Console.ForegroundColor = ConsoleColor.White;
		}

		private static void LogSuccess(string m)
		{
			Console.ForegroundColor = ConsoleColor.Green;
			Console.WriteLine(m);
			Console.ForegroundColor = ConsoleColor.White;
		}

		private static void LogWarn(string w)
		{
			Console.ForegroundColor = ConsoleColor.Yellow;
			Console.WriteLine(w);
			Console.ForegroundColor = ConsoleColor.White;
		}
	}
}