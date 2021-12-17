using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Data;
using CsvHelper;
using System.Globalization;
using CsvHelper.Configuration;
using CsvHelper.Configuration.Attributes;
using System.Text;
using Newtonsoft.Json;
using System.Text.Json;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            // Name and LastAccessTime

            // Example exutes the powershell script
            var ps1File = @"C:\Users\CW2_Rosado\OneDrive\Documents\2021_UMGC_\Repos\Directory_To_Datatables_Search\ConsoleApp1\PsScripts\ReadFolder.ps1";

            // execute powershell script 
            var startInfo = new ProcessStartInfo()
            {
                FileName = "powershell.exe",
                Arguments = $"-NoProfile -ExecutionPolicy unrestricted \"{ps1File}",
                UseShellExecute = false
            };
            Process.Start(startInfo);

            //// This should be resolved using a task scheduler - 5-10 minutes
            //Console.WriteLine("Ready to read from file.");
            //Console.ReadKey();

            // create a list to store the files contents
            var config = new CsvConfiguration(CultureInfo.InvariantCulture)
            {
                Delimiter = ","
            };

            string filePath = @"C:\Users\CW2_Rosado\OneDrive\Documents\2021_UMGC_\Repos\Directory_To_Datatables_Search\ConsoleApp1\data\psdata\Items_output.csv";
            using (var streamReader = new StreamReader(filePath))
            using (var csvReader = new CsvReader(streamReader, CultureInfo.InvariantCulture))
            {
                csvReader.Read();
                csvReader.ReadHeader();
                var records = csvReader.GetRecords<FileItems>().ToList();
                // Console.WriteLine(records);
                var options = new JsonSerializerOptions { WriteIndented = true };
                string jsonString = System.Text.Json.JsonSerializer.Serialize(records, options);
                File.WriteAllText(@"C:\Users\CW2_Rosado\OneDrive\Documents\2021_UMGC_\Repos\Directory_To_Datatables_Search\ConsoleApp1\data\item_output.json", jsonString);

                // Works below without json formatting
                //string strResultJson = JsonConvert.SerializeObject(records);
                //File.WriteAllText(@"C:\Users\CW2_Rosado\OneDrive\Documents\2021_UMGC_\Repos\Directory_To_Datatables_Search\ConsoleApp1\data\item_output.json", strResultJson);

            }


            // Console.ReadKey();
        }
        public class FileItems
        {
            [Name("LastAccessTime")]
            public DateTime FileTime { get; set; }
            [Name("Name")]
            public string FileName { get; set; }
            // public string FolderDir { get; set; }


        }
    }
}
