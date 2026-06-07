#prikaz ma dve casti sloveso a podstatne jmeno oddelene pomlckou
#Get-Help Set-Content -Full #zobraz vsechny informace o prikazu Set-Content
Get-Item "C:\Users\moudr\Documents\Windows PowerShell\WindowsPS_zaklady\lekce1.ps1"
#Get-Item vraci informace o souboru, ktery je zadany jako parametr
Get-Item "C:\Users\moudr\Documents\Windows PowerShell\WindowsPS_zaklady\lekce1.ps1" | Select-Object *
#Select-Object * zobrazi vsechny informace o souboru, ktery je zadany jako parametr
"C:\Users\moudr\Documents\Windows PowerShell\WindowsPS_zaklady\lekce1.ps1","C:\Users\moudr\Documents\Windows PowerShell\WindowsPS_zaklady\test.ps1" | Get-Item| Select-Object FullName, Length, LastAccessTime, LastWriteTime |Sort-Object Length -Descending| Format-List
#zobraz informace o souboru lekce1.ps1 a test.ps1, zobrazi pouze jmeno, velikost, datum posledniho pristupu a datum posledni zmeny, seradi podle velikosti sestupne a zobrazi jako seznam
"C:\Users\moudr\Documents\Windows PowerShell\WindowsPS_zaklady\lekce1.ps1","C:\Users\moudr\Documents\Windows PowerShell\WindowsPS_zaklady\test.ps1" | Get-Item| Select-Object FullName, Length, LastAccessTime, LastWriteTime |Sort-Object Length | Format-Table
#zobraz informace o souboru lekce1.ps1 a test.ps1, zobrazi pouze jmeno, velikost, datum posledniho pristupu a datum posledni zmeny, seradi podle velikosti vzestupne a zobrazi jako tabulka 
Get-Help Sort-Object -Full
#zobraz vsechny informace o prikazu Sort-Object
Get-Help Get-Service -Full
#zobraz vsechny informace o prikazu Get-Service¨
Get-Help gsv -Full
#zobraz vsechny informace o prikazu Get-Service, ktery lze zkracovat jako gsv