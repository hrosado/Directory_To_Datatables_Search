# Original script provides all file information - too much.
# Get-ChildItem -Path 'C:\Users\CW2_Rosado\Documents\Repos\OEWIO2021\Content\OEWIO_PDFs\*' -Include *.pdf > 'C:\Users\CW2_Rosado\OneDrive\Documents\2021_UMGC_\Repos\Directory_To_Datatables_Search\ConsoleApp1\data\Items_output.txt'

# Modified script returns LastAccessTime and Name
Get-ChildItem -Recurse -Path 'C:\Users\CW2_Rosado\Documents\Repos\OEWIO2021\Content\OEWIO_PDFs\*' -Include *.pdf |
Where-Object -FilterScript {
    $_.LastAccessTime -lt (Get-Date) # (Get-Date -Date "1/1/2009")
} |
Select-Object LastAccessTime, Name |
Export-Csv -NoTypeInformation -Path 'C:\Users\CW2_Rosado\OneDrive\Documents\2021_UMGC_\Repos\Directory_To_Datatables_Search\ConsoleApp1\data\psdata\Items_output.csv'
