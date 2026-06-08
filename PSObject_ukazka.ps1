# načtení WMI dat z třídy win32_OperatingSystem
$OperatingSystem = Get-WmiObject win32_OperatingSystem
# načtení WMI dat z třídy win32_ComputerSystem
$ComputerSystem = Get-WmiObject win32_ComputerSystem
$ComputerInfo = New-Object psobject
#vytvoreni prazdneho objektu, do ktereho budeme pridavat informace o pocitaci
$ComputerInfo | Add-Member -MemberType NoteProperty -Name ComputerName -Value $ComputerSystem.Name
#do objektu $ComputerInfo pridame vlastnost ComputerName, ktera bude obsahovat jmeno pocitace, ktere zjistime z objektu $ComputerSystem
$ComputerInfo | Add-Member -MemberType NoteProperty -Name MemoryGB -Value ($ComputerSystem.TotalPhysicalMemory/1GB -as [int])
#do objektu $ComputerInfo pridame vlastnost MemoryGB, ktera bude obsahovat velikost RAM v GB, kterou zjistime z objektu $ComputerSystem, delime ji 1GB a prevedeme na cele cislo
$ComputerInfo | Add-Member -MemberType NoteProperty -Name CpuCount -Value $ComputerSystem.NumberOfProcessors
#do objektu $ComputerInfo pridame vlastnost CpuCount, ktera bude obsahovat pocet procesoru, ktery zjistime z objektu $ComputerSystem
$ComputerInfo | Add-Member -MemberType NoteProperty -Name OperatingSystem -Value $OperatingSystem.Caption
#do objektu $ComputerInfo pridame vlastnost OperatingSystem, ktera bude obsahovat nazev operačního systému, ktery zjistime z objektu $OperatingSystem
$ComputerInfo | Add-Member -MemberType NoteProperty -Name OperatingSystemInstallDate -Value ($OperatingSystem.ConvertToDateTime($OperatingSystem.InstallDate))
#do objektu $ComputerInfo pridame vlastnost OperatingSystemInstallDate, ktera bude obsahovat datum instalace operačního systému, ktery zjistime z objektu $OperatingSystem, prevedeme ho na datum pomocí metody ConvertToDateTime
$ComputerInfo | Add-Member -MemberType NoteProperty -Name LastBootupTime -Value ($OperatingSystem.ConvertToDateTime($OperatingSystem.LastBootUpTime))
#do objektu $ComputerInfo pridame vlastnost LastBootupTime, ktera bude obsahovat datum a cas posledniho spusteni pocitace, ktery zjistime z objektu $OperatingSystem, prevedeme ho na datum pomocí metody ConvertToDateTime
$ComputerInfo | Add-Member -MemberType ScriptMethod -Name GetUptime -Value {(Get-Date) - $OperatingSystem.ConvertToDateTime($OperatingSystem.LastBootUpTime)}
#do objektu $ComputerInfo pridame metodu GetUptime, ktera bude vracet cas, ktery uplynul od posledniho spusteni pocitace, vypocitame ho jako rozdil mezi aktualnim datem a datumem posledniho spusteni, ktery zjistime z objektu $OperatingSystem a prevedeme ho na datum pomocí metody ConvertToDateTime
$ComputerInfo
$ComputerInfo.GetUptime()
#zobraz obsah objektu $ComputerInfo, zobrazi vsechny vlastnosti a jejich hodnoty, a zavolame metodu GetUptime, ktera nam vrati cas, ktery uplynul od posledniho spusteni pocitace
