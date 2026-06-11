Get-Location
Get-ChildItem
#zobraz aktualni umisteni v adresari a obsah aktualniho adresare
New-Item -Name "test.txt" -ItemType File
Remove-Item "test.txt"
#vytvori soubor test.txt v aktualnim adresari a pak ho smaze
#########################################################
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 | Format-Table ProcessName, CPU -AutoSize | Out-File -FilePath ".\processes.txt"
#zobraz informace o aktualne spustenych procesech, seradi je podle pouziti CPU sestupne, zobrazi pouze prvnich 10 procesu, zobrazi pouze jmeno a pouziti CPU a ulozi do souboru processes.txt v aktualnim adresari
Get-Content ".\processes.txt"
#zobraz obsah souboru processes.txt, ktery jsme vytvorili v predchozim prikazu
$psobj = new-object psobject
$seznamProcesu = Get-Process | Select-Object id, processname, CPU |Sort-Object ID | Select-Object -First 15
#vytvori novy objekt typu PSObject, ziska seznam aktualne spustenych procesu a ulozi ho do promenne $seznamProcesu
$psobj | Add-Member -MemberType NoteProperty -Name "BeziciProcesy" -Value $seznamProcesu
$psobj.BeziciProcesy   | Format-Table -AutoSize 
#volam primo konkretni vlastnost objektu $psobj.BeziciProcesy, ktera obsahuje seznam procesu, a zobrazuji tento seznam ve formatu tabulky s automatickou velikosti sloupcu
#pridá tento seznam jako vlastnost "Bezici procesy" do objektu $psobj a zobrazi obsah objektu ve formatu tabulky
"Vypis objektu PSObject pomoci pipe-line"
$psobj | Select-Object -ExpandProperty BeziciProcesy
#zobraz obsah vlastnosti "BeziciProcesy" objektu $psobj pomoci pipe-line, ktera obsahuje seznam procesu
#parametr -Property vraci puvodni objekt s jednou vlastnosti. V konzoli bude zobrazen jen jeden radek se slozenymi zavorkami
#parametr -ExpandProperty zahodi hlavni objekt a zobrazi pouze obsah vlastnosti "BeziciProcesy", ktery je seznamem procesu, a zobrazi tento seznam jako tabulku