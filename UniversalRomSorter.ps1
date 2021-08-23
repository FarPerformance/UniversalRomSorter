##########################
#                        #
#  UNIVERSAL ROM SORTER  #
#                        #
##########################

### SET PATHS
$SourceFolder = "Z:\ROMS\MiSTer\games\ATARI2600"
$TargetFolder = $SourceFolder
$Size = 190
$FolderSize = 250

### DEFINE FOLDERS
$UsaFolder = "$TargetFolder\1 USA"
$WorldFolder = "$TargetFolder\1 USA"
$EuropeFolder = "$TargetFolder\2 Europe"
$JapanFolder = "$TargetFolder\2 Japan"
$OtherFolder = "$TargetFolder\2 Other Regions"
$UnlicensedFolder = "$TargetFolder\2 Unlicensed"
$NintendoPowerFolder = "$TargetFolder\3 Nintendo Power"
$ArcadeFolder = "$TargetFolder\3 Super System Arcade"
$VcFolder = "$TargetFolder\3 Virtual Console"
$SegaChannelFolder = "$TargetFolder\3 Sega Channel"
$SegaCd32xFolder = "$TargetFolder\3 Sega CD 32X"
$EnhancedSoundtrackFolder = "$TargetFolder\3 Enhanced Soundtrack"
$BetaFolder = "$TargetFolder\4 Betas & Protos"
$DemoFolder = "$TargetFolder\4 Demos & Samples"
$ProgramFolder = "$TargetFolder\4 Programs"
$RevisionFolder = "$TargetFolder\4 Revisions"
$VideoFolder = "$TargetFolder\4 Videos"
$BiosFolder = "$TargetFolder\5 BIOS"

### FUNCTION
$ErrorActionPreference = "SilentlyContinue"
Function Sort-Files {
[cmdletbinding()]
Param (
[string]$Filter,
[string]$Folder,
[string]$Name,
[string]$FullName
)
Process {
If (($Name -like $Filter) -and (Test-Path -LiteralPath $FullName)) {
If(!(Test-Path $Folder)) {
New-Item -ItemType Directory -Force -Path $Folder
}
Move-Item -LiteralPath $FullName $Folder
}}}

### GET FILES
Get-ChildItem $SourceFolder | 
Foreach-Object {

### FILTERS
### BIOS
Sort-Files -Filter "*``[BIOS``]*" -Folder $BiosFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Enhancement Chip)*" -Folder "$BiosFolder\Enhancement Chip" -Name $_.Name -FullName $_.FullName
### REVISIONS
Sort-Files -Filter "*(Rev*" -Folder $RevisionFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Alt*" -Folder $RevisionFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*Alt)*" -Folder $RevisionFolder -Name $_.Name -FullName $_.FullName
### SEGA CD SPECIFIC
Sort-Files -Filter "*(Brazil) (Sega CD 32X)*" -Folder "$SegaCd32xFolder\2 Other Regions\Brazil" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*Sega CD 32X*" -Folder "$SegaCd32xFolder\1 USA" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*Mega-CD 32X*" -Folder "$SegaCd32xFolder\2 Europe" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*Enhanced Soundtrack Disc*" -Folder $EnhancedSoundtrackFolder -Name $_.Name -FullName $_.FullName
### BETAS
Sort-Files -Filter "*(Beta*" -Folder "$BetaFolder\Beta" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Proto*" -Folder "$BetaFolder\Proto" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*Proto)*" -Folder "$BetaFolder\Proto" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Debug*" -Folder "$BetaFolder\Debug" -Name $_.Name -FullName $_.FullName
### UNLICENSED
Sort-Files -Filter "*(Aftermarket)*" -Folder "$UnlicensedFolder\Aftermarket" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Pirate)*" -Folder "$UnlicensedFolder\Pirate" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Unl)*" -Folder $UnlicensedFolder -Name $_.Name -FullName $_.FullName
### PROGRAMS
Sort-Files -Filter "*Program)*" -Folder $ProgramFolder -Name $_.Name -FullName $_.FullName
###DEMOS
Sort-Files -Filter "*(Demo)*" -Folder "$DemoFolder\Demo" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Kiosk)*" -Folder "$DemoFolder\Kiosk" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Sample*" -Folder "$DemoFolder\Sample" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Promo*" -Folder "$DemoFolder\Promo" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*Promo)*" -Folder "$DemoFolder\Promo" -Name $_.Name -FullName $_.FullName
### NINTENDO
Sort-Files -Filter "*Virtual Console*" -Folder $VcFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*Switch Online*" -Folder $VcFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*Game Boy Advance Video*" -Folder $VideoFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Arcade)*" -Folder $ArcadeFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(NP)*" -Folder $NintendoPowerFolder -Name $_.Name -FullName $_.FullName
### SEGA
Sort-Files -Filter "*(Sega Channel)*" -Folder $SegaChannelFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(SegaNet)*" -Folder "$SegaChannelFolder\SegaNet" -Name $_.Name -FullName $_.FullName
### MAIN REGIONS
Sort-Files -Filter "*(USA*" -Folder $UsaFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*, USA*" -Folder $UsaFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(World*" -Folder $WorldFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Europe*" -Folder $EuropeFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*, Europe*" -Folder $EuropeFolder -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Japan*" -Folder $JapanFolder -Name $_.Name -FullName $_.FullName
### OTHER REGIONS
Sort-Files -Filter "*(Germany)*" -Folder "$OtherFolder\Germany" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Italy)*" -Folder "$OtherFolder\Italy" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Spain)*" -Folder "$OtherFolder\Spain" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(France)*" -Folder "$OtherFolder\France" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(China)*" -Folder "$OtherFolder\China" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Korea)*" -Folder "$OtherFolder\Korea" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Australia)*" -Folder "$OtherFolder\Australia" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(United Kingdom*" -Folder "$OtherFolder\United Kingdom" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Netherlands)*" -Folder "$OtherFolder\Netherlands" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Denmark)*" -Folder "$OtherFolder\Denmark" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Sweden)*" -Folder "$OtherFolder\Sweden" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Brazil*" -Folder "$OtherFolder\Brazil" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Mexico)*" -Folder "$OtherFolder\Mexico" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Asia)*" -Folder "$OtherFolder\Asia" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Hong Kong)*" -Folder "$OtherFolder\Hong Kong" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Taiwan)*" -Folder "$OtherFolder\Taiwan" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Canada)*" -Folder "$OtherFolder\Canada" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(New Zealand)*" -Folder "$OtherFolder\New Zealand" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Finland)*" -Folder "$OtherFolder\Finland" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Greece)*" -Folder "$OtherFolder\Greece" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Russia)*" -Folder "$OtherFolder\Russia" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Norway)*" -Folder "$OtherFolder\Norway" -Name $_.Name -FullName $_.FullName
Sort-Files -Filter "*(Unknown)*" -Folder "$OtherFolder\Unknown" -Name $_.Name -FullName $_.FullName
}




### FOLDERSORT
$ErrorActionPreference = "SilentlyContinue"
Function Folder-Sort {
[cmdletbinding()]
Param (
[string]$TargetFolder,
[string]$Name,
[int]$Size
)
Process {
$Folder = "$TargetFolder\$Name - A"
New-Item -ItemType Directory -Force -Path $Folder

### ITERATE THROUGH ALPHABET
for ($Number = 0; $Number -lt 26; $Number++) {
    
### MOVE NUMBERED FILES
If($Number -eq 0) {
$Files = Get-ChildItem "$TargetFolder\[0-9*,']*" -File |
Foreach-Object {
Move-Item -LiteralPath $_.FullName $Folder
}}

$Char = [char](65 + $Number)
### CHECK FILES COUNT
$Files = Get-ChildItem $Folder -File
$FilesCount = $Files.count
    
If($FilesCount -gt $Size) {
### RENAME FOLDER
$Previous = [char](65 + ($Number-1))

### MOVE ONLY IF CHAR IS DIFFERENT
$LastFolder = Split-Path -Path $Folder -Leaf
If($LastFolder.replace("$Name - ","") -ne $Previous) {
Move-Item $Folder "$Folder-$Previous"
}

### CREATE NEW FOLDER
$Folder = "$TargetFolder\$Name - $Char"
New-Item -ItemType Directory -Force -Path $Folder
}

### MOVE FILES INTO FOLDER
Get-ChildItem $TargetFolder -File -Filter $Char*.* | 
Foreach-Object {
Move-Item -LiteralPath $_.FullName $Folder
}

### RENAME LAST FOLDER
If($Number -eq 25) {
If(Test-Path $Folder) {
Move-Item $Folder "$Folder-Z"
}}}}}

### SORT MAIN FOLDERS
$Items = Get-ChildItem "$UsaFolder" -File
$ItemsCount = $Items.count
If($ItemsCount -gt $FolderSize) {
Folder-Sort -TargetFolder $UsaFolder -Name "USA" -Size $Size
}
$Items = Get-ChildItem "$EuropeFolder" -File
$ItemsCount = $Items.count
If($ItemsCount -gt $FolderSize) {
Folder-Sort -TargetFolder $EuropeFolder -Name "Europe" -Size $Size
}
$Items = Get-ChildItem "$JapanFolder" -File
$ItemsCount = $Items.count
If($ItemsCount -gt $FolderSize) {
Folder-Sort -TargetFolder $JapanFolder -Name "Japan" -Size $Size
}
