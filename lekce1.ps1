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
#Get-Help Sort-Object -Full
#zobraz vsechny informace o prikazu Sort-Object
#Get-Help Get-Service -Full
#zobraz vsechny informace o prikazu Get-Service¨
#Get-Help gsv -Full
#zobraz vsechny informace o prikazu Get-Service, ktery lze zkracovat jako gsv
$VarString="PowerShell je super"
$VarString | Get-Member
#zobraz informace o promene VarString, ktery obsahuje text "PowerShell je super", zobrazi informace o typu promenne, metodach a vlastnostech
$test='toto je test'
$test.Replace('toto','tohle')
#vytvori promennou test, ktera obsahuje text "toto je test", a nahradi v ni slovo "toto" slovem "tohle"

#vytvoreni PSCustomObjektu
(Get-Service 'GameInput Service' | Select-Object name).GetType()
#vytvori objekt, ktery obsahuje informace o sluzbe GameInput Service, zobrazi pouze jmeno sluzby a zjisti typ objektu, ktery vznikl

$obj=New-Object psobject
$obj.GetType()
#vytvori prazdny objekt a zjisti jeho typ

$obj=[PSCustomObject]::new()
#vytvori prazdny objekt typu PSCustomObject a zjisti jeho typ

$obj | Add-Member -MemberType NoteProperty -Name 'Jmeno' -Value 'Jirka'
#do objektu $obj pridame vlastnost Jmeno, ktera bude obsahovat text "Jirka"
$obj | Add-Member -MemberType ScriptMethod -Name 'NameToUpper' -Value {$this.'Jmeno'.ToUpper()}
#do objektu $obj pridame metodu NameToUpper, ktera bude vracet obsah vlastnosti Jmeno prevedeny na velka pismena
$obj.NameToUpper()
$obj |Add-Member -MemberType NoteProperty -Name 'Jmeno' -Value 'Pepa' -Force
#do objektu $obj zmenime obsah vlastnosti Jmeno na text "Pepa"
"Nove jmeno je: $($obj.Jmeno)"
#zobraz text "Nove jmeno je: " a obsah vlastnosti Jmeno, ktery je "Pepa", pouzijeme $() pro vlozeni hodnoty vlastnosti do textu

Get-Service | Get-Member
#zobraz informace o objektech, ktere vzniknou pri pouziti prikazu
Get-Date | Get-Member
#zobraz informace o objektu, ktery vznikne pri pouziti prikazu Get-Date