$folders = Get-ChildItem -Directory -Recurse 'C:\Users\CW2_Rosado\Documents\Repos\OEWIO2021\Content\OEWIO_PDFs' -FullName >> 'C:\Users\CW2_Rosado\OneDrive\Documents\2021_UMGC_\Repos\Directory_To_Datatables_Search\PowerShell Scripts\Items_output.txt'

$fileBaseNames = (Get-ChildItem $folder\*.mp3).BaseName