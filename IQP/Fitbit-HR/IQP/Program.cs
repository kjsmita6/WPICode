using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IQP
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] scopes = { "activity", "heartrate" };
            FitBitAnalyzer analyzer = new FitBitAnalyzer("id", "secret", scopes, "https://localhost:8080/callback");
            Console.WriteLine("Press ENTER to start");
            Console.ReadLine();
            analyzer.Initialize();
            HeartRateResponse hr = Task.Run(async () => await analyzer.GetHeartRate()).Result;
            int i = 0;
            if(hr != null)
            {
                StringBuilder csv = new StringBuilder();
                Console.WriteLine("Writing to file. This may take time.");
                for (i = 0; i < hr.activitiesheartintraday.dataset.Length; i++)
                {
                    string first = hr.activitiesheartintraday.dataset[i].time;
                    string second = hr.activitiesheartintraday.dataset[i].value.ToString();
                    csv.AppendLine($"{first},{second}");
                }
                File.WriteAllText("fitbit.csv", csv.ToString());
                Console.WriteLine("Wrote {0} lines to fitbit.csv", i);
            }
            Console.WriteLine("Done. Press ENTER to continue...");
            Console.ReadLine();
        }
    }
}
