#include <Array.au3>
#include <File.au3>

;If Not $CmdLine[0] Then Exit

; PARAMETERS
;$Roms = $CmdLine[1]
$Roms = "C:\Users\Dennis\Desktop\roms\Sega - Game Gear"

$IniFile = @ScriptDir & "\urs.ini"

; DEFINE PATHS
$Usa = $Roms & "\" & IniRead($IniFile, "Folders", "USA", "1 USA")
$World = $Roms & "\" & IniRead($IniFile, "Folders", "World", "1 World")
$Europe = $Roms & "\" & IniRead($IniFile, "Folders", "Europe", "2 Europe")
$Japan = $Roms & "\" & IniRead($IniFile, "Folders", "Japan", "2 Japan")
$Other = $Roms & "\" & IniRead($IniFile, "Folders", "OtherRegions", "2 Other Regions")
$Revision = $Roms & "\" & IniRead($IniFile, "Folders", "Revisions", "2 Revisions")
$Collection = $Roms & "\" & IniRead($IniFile, "Folders", "Collections", "3 Collections")
$SegaCd32x = $Roms & "\" & IniRead($IniFile, "Folders", "SegaCD32X", "3 Sega CD 32X")
$EnhancedSoundtrack = $Roms & "\" & IniRead($IniFile, "Folders", "EnhancedSoundtrack", "3 Enhanced Soundtrack")
$Beta = $Roms & "\" & IniRead($IniFile, "Folders", "Betas", "4 Betas & Protos\Betas")
$Debug = $Roms & "\" & IniRead($IniFile, "Folders", "Debug", "4 Betas & Protos\Debug")
$Proto = $Roms & "\" & IniRead($IniFile, "Folders", "Protos", "4 Betas & Protos\Protos")
$Demo = $Roms & "\" & IniRead($IniFile, "Folders", "Demos", "4 Demos & Samples\Demos")
$Kiosk = $Roms & "\" & IniRead($IniFile, "Folders", "Kiosk", "4 Demos & Samples\Kiosk")
$Promo = $Roms & "\" & IniRead($IniFile, "Folders", "Promos", "4 Demos & Samples\Promos")
$Sample = $Roms & "\" & IniRead($IniFile, "Folders", "Samples", "4 Demos & Samples\Samples")
$Taikenban = $Roms & "\" & IniRead($IniFile, "Folders", "Taikenban", "4 Demos & Samples\Taikenban")
$TechDemo = $Roms & "\" & IniRead($IniFile, "Folders", "TechDemo", "4 Demos & Samples\Tech Demos")
$Program = $Roms & "\" & IniRead($IniFile, "Folders", "Programs", "4 Programs")
$Aftermarket = $Roms & "\" & IniRead($IniFile, "Folders", "Aftermarket", "4 Unlicensed\Aftermarket")
$Pirate = $Roms & "\" & IniRead($IniFile, "Folders", "Pirate", "4 Unlicensed\Pirate")
$Unlicensed = $Roms & "\" & IniRead($IniFile, "Folders", "Unlicensed", "4 Unlicensed\Unlicensed")
$Bios = $Roms & "\" & IniRead($IniFile, "Folders", "BIOS", "6 BIOS")

; SORT MAIN FOLDER
; GET FILES
$Files = _FileListToArrayRec($Roms, "*", 1, 0, 1, 2)
If IsArray($Files) Then
   For $f = 1 To $Files[0]
; BIOS
	Call(FileSort, "[BIOS]", $Bios, $Files[$f])
	Call(FileSort, "(Enhancement Chip)", $Bios, $Files[$f])
; BETAS & PROTOS
	Call(FileSort, "(Beta)", $Beta, $Files[$f])
	Call(FileSort, "(Beta 1)", $Beta, $Files[$f])
	Call(FileSort, "(Beta 2)", $Beta, $Files[$f])
	Call(FileSort, "(Beta 3)", $Beta, $Files[$f])
	Call(FileSort, "(Debug)", $Debug, $Files[$f])
	Call(FileSort, "(Debug Version)", $Debug, $Files[$f])
	Call(FileSort, "(Proto)", $Proto, $Files[$f])
	Call(FileSort, "(Proto 1)", $Proto, $Files[$f])
	Call(FileSort, "(Proto 2)", $Proto, $Files[$f])
	Call(FileSort, "(Proto 3)", $Proto, $Files[$f])
	Call(FileSort, "(Possible Proto)", $Proto, $Files[$f])
; DEMOS & SAMPLES
	Call(FileSort, "(Demo)", $Demo, $Files[$f])
	Call(FileSort, "(Demo 1)", $Demo, $Files[$f])
	Call(FileSort, "(Demo 2)", $Demo, $Files[$f])
	Call(FileSort, "(Demo 3)", $Demo, $Files[$f])
	Call(FileSort, "(Tech Demo)", $TechDemo, $Files[$f])
	Call(FileSort, "(Tech Demo, Game)", $TechDemo, $Files[$f])
	Call(FileSort, "(Tech Demo, Soaker)", $TechDemo, $Files[$f])
	Call(FileSort, "(Tech Demo, Viewer)", $TechDemo, $Files[$f])
	Call(FileSort, "(Kiosk)", $Kiosk, $Files[$f])
	Call(FileSort, "(Promo)", $Promo, $Files[$f])
	Call(FileSort, "(Doritos Promo)", $Promo, $Files[$f])
	Call(FileSort, "(Sample)", $Sample, $Files[$f])
	Call(FileSort, "(Taikenban)", $Taikenban, $Files[$f])
	Call(FileSort, "(Taikenban Sample ROM)", $Taikenban, $Files[$f])
	Call(FileSort, "(Caravan You Taikenban)", $Taikenban, $Files[$f])
; PROGRAMS
	Call(FileSort, "(Program)", $Program, $Files[$f])
	Call(FileSort, "(Test Program)", $Program, $Files[$f])
; COLLECTIONS
	Call(FileSort, "(Aleste Collection)", $Collection & "\Aleste Collection", $Files[$f])
	Call(FileSort, "(Bomberman Collection)", $Collection & "\Bomberman Collection", $Files[$f])
	Call(FileSort, "(Capcom Classics Mini Mix)", $Collection & "\Capcom Classics Mini Mix", $Files[$f])
	Call(FileSort, "(Capcom Town)", $Collection & "\Capcom Town", $Files[$f])
	Call(FileSort, "(Castlevania Advance Collection)", $Collection & "\Castlevania Advance Collection", $Files[$f])
	Call(FileSort, "(Castlevania Anniversary Collection)", $Collection & "\Castlevania Anniversary Collection", $Files[$f])
	Call(FileSort, "(Collection of Mana)", $Collection & "\Collection of Mana", $Files[$f])
	Call(FileSort, "(Collection of SaGa)", $Collection & "\Collection of SaGa", $Files[$f])
	Call(FileSort, "(Contra Anniversary Collection)", $Collection & "\Contra Anniversary Collection", $Files[$f])
	Call(FileSort, "(Darius Cozmic Collection)", $Collection & "\Darius Cozmic Collection", $Files[$f])
	Call(FileSort, "(Disney Classic Games)", $Collection & "\Disney Classic Games", $Files[$f])
	Call(FileSort, "(Game no Kanzume Vol. 1)", $Collection & "\Game no Kanzume", $Files[$f])
	Call(FileSort, "(Game no Kanzume Vol. 2)", $Collection & "\Game no Kanzume", $Files[$f])
	Call(FileSort, "(Game no Kanzume Otokuyou)", $Collection & "\Game no Kanzume", $Files[$f])
	Call(FileSort, "(iam8bit)", $Collection & "\iam8bit", $Files[$f])
	Call(FileSort, "(Limited Run Games)", $Collection & "\Limited Run Games", $Files[$f])
	Call(FileSort, "(Mega Man Legacy Collection)", $Collection & "\Mega Man Legacy Collection", $Files[$f])
	Call(FileSort, "(Mega Man X Legacy Collection)", $Collection & "\Mega Man X Legacy Collection", $Files[$f])
	Call(FileSort, "(Metal Gear Solid Collection)", $Collection & "\Metal Gear Solid Collection", $Files[$f])
	Call(FileSort, "(Ninja JaJaMaru Retro Collection)", $Collection & "\Ninja JaJaMaru Retro Collection", $Files[$f])
	Call(FileSort, "(Namco Anthology 1)", $Collection & "\Namco Anthology", $Files[$f])
	Call(FileSort, "(Namco Museum Archives Vol 1)", $Collection & "\Namco Museum Archives", $Files[$f])
	Call(FileSort, "(Namco Museum Archives Vol 2)", $Collection & "\Namco Museum Archives", $Files[$f])
	Call(FileSort, "(Namcot Collection, Namco Museum Archives Vol 1)", $Collection & "\Namco Museum Archives", $Files[$f])
	Call(FileSort, "(Namcot Collection, Namco Museum Archives Vol 2)", $Collection & "\Namco Museum Archives", $Files[$f])
	Call(FileSort, "(Namcot Collection)", $Collection & "\Namco Museum Archives", $Files[$f])
	Call(FileSort, "(QUByte Classics)", $Collection & "\QUByte Classics", $Files[$f])
	Call(FileSort, "(Retro-Bit Generations)", $Collection & "\Retro-Bit Generations", $Files[$f])
	Call(FileSort, "(Seiken Densetsu Collection)", $Collection & "\Seiken Densetsu Collection", $Files[$f])
	Call(FileSort, "(SNK 40th Anniversary Collection)", $Collection & "\SNK 40th Anniversary Collection", $Files[$f])
	Call(FileSort, "(Sonic Classic Collection)", $Collection & "\Sonic Classic Collection", $Files[$f])
	Call(FileSort, "(Sonic Mega Collection)", $Collection & "\Sonic Mega Collection", $Files[$f])
	Call(FileSort, "(The Cowabunga Collection)", $Collection & "\The Cowabunga Collection", $Files[$f])
	Call(FileSort, "(Cowabunga Collection, The)", $Collection & "\The Cowabunga Collection", $Files[$f])
	Call(FileSort, "(The Disney Afternoon Collection)", $Collection & "\The Disney Afternoon Collection", $Files[$f])
	Call(FileSort, "(Virtual Console)", $Collection & "\Virtual Console", $Files[$f])
	Call(FileSort, "(Virtual Console, Switch Online)", $Collection & "\Virtual Console", $Files[$f])
	Call(FileSort, "(Virtual Console, Classic Mini, Switch Online)", $Collection & "\Virtual Console", $Files[$f])
	Call(FileSort, "(3DS Virtual Console)", $Collection & "\Virtual Console", $Files[$f])
	Call(FileSort, "(Wii Virtual Console)", $Collection & "\Virtual Console", $Files[$f])
	Call(FileSort, "(Wii U Virtual Console)", $Collection & "\Virtual Console", $Files[$f])
	Call(FileSort, "(Wii and Wii U Virtual Console)", $Collection & "\Virtual Console", $Files[$f])
	Call(FileSort, "(Wii)", $Collection & "\Wii", $Files[$f])
	Call(FileSort, "(GameCube)", $Collection & "\GameCube", $Files[$f])
	Call(FileSort, "(GameCube, Zelda Collection)", $Collection & "\GameCube", $Files[$f])
	Call(FileSort, "(GameCube Edition)", $Collection & "\GameCube Edition", $Files[$f])
	Call(FileSort, "(GameCube, Wii and Wii U Virtual Console)", $Collection & "\GameCube", $Files[$f])
	Call(FileSort, "(PC Engine Mini)", $Collection & "\PC Engine Mini", $Files[$f])
	Call(FileSort, "(Mega Drive 4)", $Collection & "\Mega Drive 4", $Files[$f])
	Call(FileSort, "(Mega Drive Mini)", $Collection & "\Mega Drive Mini", $Files[$f])
	Call(FileSort, "(Mega Drive Mini 2)", $Collection & "\Mega Drive Mini", $Files[$f])
	Call(FileSort, "(Mega Drive Mini 2, Genesis Mini 2)", $Collection & "\Mega Drive Mini", $Files[$f])
	Call(FileSort, "(Genesis Mini)", $Collection & "\Mega Drive Mini", $Files[$f])
	Call(FileSort, "(Sega 3D Classics)", $Collection & "\Sega 3D Classics", $Files[$f])
	Call(FileSort, "(Sega 3D Classics Collection)", $Collection & "\Sega 3D Classics Collection", $Files[$f])
	Call(FileSort, "(Sega 3D Fukkoku Akaibusu)", $Collection & "\Sega 3D Fukkoku Akaibusu", $Files[$f])
	Call(FileSort, "(Sega Ages)", $Collection & "\Sega Ages", $Files[$f])
	Call(FileSort, "(Sega Channel)", $Collection & "\Sega Channel", $Files[$f])
	Call(FileSort, "(SEGA Classic Collection)", $Collection & "\SEGA Classic Collection", $Files[$f])
	Call(FileSort, "(Sega Gopher)", $Collection & "\Sega Gopher", $Files[$f])
	Call(FileSort, "(SegaNet)", $Collection & "\SegaNet", $Files[$f])
	Call(FileSort, "(Sega Smash Pack)", $Collection & "\Sega Smash Pack", $Files[$f])
	Call(FileSort, "(Sega Smash Pack 2)", $Collection & "\Sega Smash Pack", $Files[$f])
	Call(FileSort, "(Switch Online)", $Collection & "\Switch Online", $Files[$f])
	Call(FileSort, "(Switch)", $Collection & "\Switch", $Files[$f])
	Call(FileSort, "(Original Translation, Switch)", $Collection & "\Switch", $Files[$f])
	Call(FileSort, "(RCG Translation, Switch)", $Collection & "\Switch", $Files[$f])
	Call(FileSort, "(Classic Mini, Switch Online)", $Collection & "\Classic Mini", $Files[$f])
	Call(FileSort, "(Lock-on Combination)", $Collection & "\Lock-on Combination", $Files[$f])
	Call(FileSort, "(LodgeNet)", $Collection & "\LodgeNet", $Files[$f])
	Call(FileSort, "(Competition Cart)", $Collection & "\Competition Cart", $Files[$f])
	Call(FileSort, "(Competition Cart, Nintendo Power mail-order)", $Collection & "\Competition Cart", $Files[$f])
	Call(FileSort, "(e-Reader Edition)", $Collection & "\e-Reader Edition", $Files[$f])
	Call(FileSort, "(NP)", $Collection & "\Nintendo Power", $Files[$f])
	Call(FileSort, "(Channel)", $Collection & "\Channel", $Files[$f])
	Call(FileSort, "(System)", $Collection & "\System", $Files[$f])
; UNLICENSED
	Call(FileSort, "(Pirate)", $Pirate, $Files[$f])
	Call(FileSort, "(Aftermarket)", $Aftermarket, $Files[$f])
	Call(FileSort, "(Unl)", $Unlicensed, $Files[$f])
	Call(FileSort, "(Homebrew)", $Unlicensed, $Files[$f])
; SEGA CD SPECIFIC
	Call(FileSort, "(Sega CD 32X)", $SegaCd32x, $Files[$f])
	Call(FileSort, "(Mega-CD 32X)", $SegaCd32x, $Files[$f])
; REVISIONS
	Call(FileSort, "(Rev 1)", $Revision, $Files[$f])
	Call(FileSort, "(Rev 2)", $Revision, $Files[$f])
	Call(FileSort, "(Rev 3)", $Revision, $Files[$f])
	Call(FileSort, "(Rev 4)", $Revision, $Files[$f])
	Call(FileSort, "(Rev 5)", $Revision, $Files[$f])
	Call(FileSort, "(Rev 6)", $Revision, $Files[$f])
	Call(FileSort, "(Rev A)", $Revision, $Files[$f])
	Call(FileSort, "(Rev B)", $Revision, $Files[$f])
	Call(FileSort, "(Rev C)", $Revision, $Files[$f])
	Call(FileSort, "(Rev D)", $Revision, $Files[$f])
	Call(FileSort, "(Alt)", $Revision, $Files[$f])
	Call(FileSort, "(Alt 2)", $Revision, $Files[$f])
	Call(FileSort, "(Alt 3)", $Revision, $Files[$f])
; MAIN REGIONS
	Call(FileSort, "(World)", $World, $Files[$f])
	Call(FileSort, "(USA)", $Usa, $Files[$f])
	Call(FileSort, "(USA, Europe)", $Usa, $Files[$f])
	Call(FileSort, "(USA, Europe, Brazil)", $Usa, $Files[$f])
	Call(FileSort, "(USA, Australia)", $Usa, $Files[$f])
	Call(FileSort, "(USA, Brazil)", $Usa, $Files[$f])
	Call(FileSort, "(USA, Korea)", $Usa, $Files[$f])
	Call(FileSort, "(Europe)", $Europe, $Files[$f])
	Call(FileSort, "(Europe, Australia)", $Europe, $Files[$f])
	Call(FileSort, "(Europe, Brazil)", $Europe, $Files[$f])
	Call(FileSort, "(Japan)", $Japan, $Files[$f])
	Call(FileSort, "(Japan, USA)", $Usa, $Files[$f])
	Call(FileSort, "(Japan, USA, Brazil)", $Usa, $Files[$f])
	Call(FileSort, "(Japan, Europe)", $Europe, $Files[$f])
	Call(FileSort, "(Japan, Europe, Australia)", $Europe, $Files[$f])
	Call(FileSort, "(Japan, Europe, Brazil)", $Europe, $Files[$f])
	Call(FileSort, "(Japan, Europe, Korea)", $Europe, $Files[$f])
	Call(FileSort, "(Japan, Australia)", $Japan, $Files[$f])
	Call(FileSort, "(Japan, Brazil)", $Japan, $Files[$f])
	Call(FileSort, "(Japan, Korea)", $Japan, $Files[$f])
	Call(FileSort, "(Japan, Hong Kong)", $Japan, $Files[$f])
	Call(FileSort, "(Japan, New Zealand)", $Japan, $Files[$f])
	Call(FileSort, "(Japan, Australia, New Zealand)", $Japan, $Files[$f])
	Call(FileSort, "(Japan, Europe, Australia, New Zealand)", $Europe, $Files[$f])

; REMAINING FILES
	Call(FileSort, " ", $Other, $Files[$f])
	Next
EndIf

; SORT FOLDERS BY REGION
Call(RegionSort,$Other)
Call(RegionSort,$Revision)


; FUNCTIONS
Func FileSort($Filter, $Folder, $FullName)
    ; Check if the file exists
    If FileExists($FullName) Then
        ; Split the path into an array using the backslash as a delimiter
        Local $PathParts = StringSplit($FullName, "\")

        ; Extract the last element of the array, which is the file name
        Local $FileName = $PathParts[$PathParts[0]]

        ; Check if the file name contains the specified filter substring
        If StringInStr($FileName, $Filter) Then
            ; Check if the destination folder exists; create if not
            If Not FileExists($Folder) Then DirCreate($Folder)
            
            ; Move the file to the destination folder
            FileMove($FullName, $Folder & "\" & $FileName)
        EndIf
    EndIf
EndFunc


Func RegionSort($Folder)
    ; Get an array of files in the specified folder and its subfolders
    $Files = _FileListToArrayRec($Folder, "*", 1, 0, 1, 2)
    
    ; Check if the array is valid
    If IsArray($Files) Then
        ; Iterate through each file in the array
        For $f = 1 To $Files[0]
            ; Call FileSort function for specific strings matching
			Call(FileSort, "(World)", $Folder & "\World", $Files[$f])
			Call(FileSort, "(USA)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(Japan, USA)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(USA, Europe)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(USA, Europe, Korea)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(USA, Asia)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(USA, Australia)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(USA, Brazil)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(USA, Korea)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(USA, Europe, Brazil)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(Europe)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Europe, Asia)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Europe, Australia)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Europe, Brazil)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Europe, Hong Kong)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Europe, Korea)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Japan)", $Folder & "\Japan", $Files[$f])
			Call(FileSort, "(Japan, Korea)", $Folder & "\Japan", $Files[$f])
			Call(FileSort, "(Japan, USA, Korea)", $Folder & "\USA", $Files[$f])
			Call(FileSort, "(Japan, Europe)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Japan, Europe, Brazil)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Japan, Europe, Korea)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Japan, Brazil)", $Folder & "\Japan", $Files[$f])
			Call(FileSort, "(Japan, Europe, Australia, New Zealand)", $Folder & "\Europe", $Files[$f])
			Call(FileSort, "(Argentina)", $Folder & "\Argentina", $Files[$f])
			Call(FileSort, "(Asia)", $Folder & "\Asia", $Files[$f])
			Call(FileSort, "(Australia)", $Folder & "\Australia", $Files[$f])
			Call(FileSort, "(Australia, Greece)", $Folder & "\Australia", $Files[$f])
			Call(FileSort, "(Austria)", $Folder & "\Austria", $Files[$f])
			Call(FileSort, "(Belgium", $Folder & "\Belgium", $Files[$f])
			Call(FileSort, "(Brazil)", $Folder & "\Brazil", $Files[$f])
			Call(FileSort, "(Brazil, Portugal)", $Folder & "\Brazil", $Files[$f])
			Call(FileSort, "(Canada)", $Folder & "\Canada", $Files[$f])
			Call(FileSort, "(China)", $Folder & "\China", $Files[$f])
			Call(FileSort, "(Denmark)", $Folder & "\Denmark", $Files[$f])
			Call(FileSort, "(Export)", $Folder & "\Export", $Files[$f])
			Call(FileSort, "(Finland)", $Folder & "\Finland", $Files[$f])
			Call(FileSort, "(France)", $Folder & "\France", $Files[$f])
			Call(FileSort, "(Germany)", $Folder & "\Germany", $Files[$f])
			Call(FileSort, "(Greece)", $Folder & "\Greece", $Files[$f])
			Call(FileSort, "(Hong Kong)", $Folder & "\Hong Kong", $Files[$f])
			Call(FileSort, "(Ireland)", $Folder & "\Ireland", $Files[$f])
			Call(FileSort, "(Israel)", $Folder & "\Israel", $Files[$f])
			Call(FileSort, "(Italy)", $Folder & "\Italy", $Files[$f])
			Call(FileSort, "(Korea)", $Folder & "\Korea", $Files[$f])
			Call(FileSort, "(Latin America)", $Folder & "\Latin America", $Files[$f])
			Call(FileSort, "(Mexico)", $Folder & "\Mexico", $Files[$f])
			Call(FileSort, "(Netherlands)", $Folder & "\Netherlands", $Files[$f])
			Call(FileSort, "(New Zealand)", $Folder & "\New Zealand", $Files[$f])
			Call(FileSort, "(Norway)", $Folder & "\Norway", $Files[$f])
			Call(FileSort, "(Poland)", $Folder & "\Poland", $Files[$f])
			Call(FileSort, "(Portugal)", $Folder & "\Portugal", $Files[$f])
			Call(FileSort, "(Russia)", $Folder & "\Russia", $Files[$f])
			Call(FileSort, "(Scandinavia)", $Folder & "\Scandinavia", $Files[$f])
			Call(FileSort, "(Spain)", $Folder & "\Spain", $Files[$f])
			Call(FileSort, "(Sweden)", $Folder & "\Sweden", $Files[$f])
			Call(FileSort, "(Taiwan)", $Folder & "\Taiwan", $Files[$f])
			Call(FileSort, "(United Kingdom)", $Folder & "\United Kingdom", $Files[$f])
			Call(FileSort, "(United Kingdom, Sweden)", $Folder & "\United Kingdom", $Files[$f])
			Call(FileSort, "(UK)", $Folder & "\United Kingdom", $Files[$f])
			Call(FileSort, "(Unknown)", $Folder & "\Unknown", $Files[$f])
        Next
    EndIf
EndFunc