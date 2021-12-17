# $folders = (Get-ChildItem -Directory -Recurse E:\).FullName >> Items_output.txt

# $list = Get-ChildItem -Path 'C:\Users\CW2_Rosado\Documents\Repos\OEWIO2021\Content\OEWIO_PDFs' -Recurse

# Get-ChildItem -Path 'C:\Users\CW2_Rosado\Documents\Repos\OEWIO2021\Content\OEWIO_PDFs' -Recurse | 
# Where-Object { $.PSIsContainer -eq $false -and #_.Extension -ne '.txt' }
# 
# Write-Host "`nTotal: "$list.Count "files `n"
# foreach ($n in $list) {
#     $n.Name | Out-File -Append 'Items_output.txt'
# }


# Works
# Get-ChildItem -Path 'C:\Users\CW2_Rosado\Documents\Repos\OEWIO2021\Content\OEWIO_PDFs' -Recurse -Force

# Get-ChildItem -Path 'C:\Users\CW2_Rosado\Documents\Repos\OEWIO2021\Content\OEWIO_PDFs\*' -Include *.pdf > 'C:\Users\CW2_Rosado\OneDrive\Documents\2021_UMGC_\Repos\Directory_To_Datatables_Search\PowerShell Scripts\Items_output.txt' 
Get-ChildItem -Path 'C:\Users\CW2_Rosado\Documents\Repos\OEWIO2021\Content\OEWIO_PDFs\*' -Include *.pdf > 'C:\Users\CW2_Rosado\OneDrive\Documents\2021_UMGC_\Repos\Directory_To_Datatables_Search\ConsoleApp1\data\Items_output.txt' 
