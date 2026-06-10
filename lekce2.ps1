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
