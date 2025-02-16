#include <Array.au3>
#include <File.au3>

If Not $CmdLine[0] Then Exit

; PARAMETERS
$Roms = $CmdLine[1]

$IniFile = @ScriptDir & "\urs.ini"

; DEFINE SUB FOLDER FILE COUNT
$FileCount = IniRead($IniFile, "Settings", "FileCount", 384)

; DEFINE PATHS
$Usa = $Roms & "\" & IniRead($IniFile, "Folders", "USA", "1 USA")
$World = $Roms & "\" & IniRead($IniFile, "Folders", "World", "1 World")
$Europe = $Roms & "\" & IniRead($IniFile, "Folders", "Europe", "2 Europe")
$Japan = $Roms & "\" & IniRead($IniFile, "Folders", "Japan", "2 Japan")
$Other = $Roms & "\" & IniRead($IniFile, "Folders", "OtherRegions", "2 Other Regions")
$Revision = $Roms & "\" & IniRead($IniFile, "Folders", "Revisions", "2 Revisions")
$Variation = $Roms & "\" & IniRead($IniFile, "Folders", "Variations", "2 Variations")
$GameCollection = $Roms & "\" & IniRead($IniFile, "Folders", "GameCollections", "3 Collections\Game Series")
$PublisherCollection = $Roms & "\" & IniRead($IniFile, "Folders", "PublisherCollections", "3 Collections\Publishers")
$SystemCollection = $Roms & "\" & IniRead($IniFile, "Folders", "SystemCollections", "3 Collections\Systems")
$VariousCollection = $Roms & "\" & IniRead($IniFile, "Folders", "VariousCollections", "3 Collections\Various")
$SegaCd32x = $Roms & "\" & IniRead($IniFile, "Folders", "SegaCD32X", "3 Sega CD 32X")
$Beta = $Roms & "\" & IniRead($IniFile, "Folders", "Betas", "4 Betas & Protos\Betas")
$Proto = $Roms & "\" & IniRead($IniFile, "Folders", "Protos", "4 Betas & Protos\Protos")
$Demo = $Roms & "\" & IniRead($IniFile, "Folders", "Demos", "4 Demos & Samples\Demos")
$Sample = $Roms & "\" & IniRead($IniFile, "Folders", "Samples", "4 Demos & Samples\Samples")
$Pirate = $Roms & "\" & IniRead($IniFile, "Folders", "Pirate", "4 Pirate")
$Program = $Roms & "\" & IniRead($IniFile, "Folders", "Programs", "4 Programs")
$Aftermarket = $Roms & "\" & IniRead($IniFile, "Folders", "Aftermarket", "4 Unlicensed\Aftermarket")
$Unlicensed = $Roms & "\" & IniRead($IniFile, "Folders", "Unlicensed", "4 Unlicensed\Unlicensed")
$Hack = $Roms & "\" & IniRead($IniFile, "Folders", "Hacks", "5 Hacks")
$Translation = $Roms & "\" & IniRead($IniFile, "Folders", "Translations", "5 Translations")
$Bios = $Roms & "\" & IniRead($IniFile, "Folders", "BIOS", "6 BIOS")

; DEFINE ARRAYS
Global $aBios[2] = ["[BIOS]", "(Enhancement Chip)"]
Global $aBeta[6] = ["(Beta)", "(Beta 1)", "(Beta 2)", "(Beta 3)", "(Debug)", "(Debug Version)"]
Global $aProto[5] = ["(Proto)", "(Proto 1)", "(Proto 2)", "(Proto 3)", "(Possible Proto)"]
Global $aDemo[12] = ["(Auto Demo)", "(Demo)", "(Demo 1)", "(Demo 2)", "(Demo 3)", "(Kiosk)", "(Taikenban)", "(Tech Demo)", "(Tech Demo, Game)", "(Tech Demo, Soaker)", "(Tech Demo, Viewer)", "(Cheheompan)"]
Global $aSample[5] = ["(Sample)", "(Taikenban Sample ROM)", "(Promo)", "(Doritos Promo)", "(Caravan You Taikenban)"]
Global $aProgram[5] = ["(Program)", "(Test Program)", "(SDK Build)", "(Menu Cart)", "Wide-Boy64"]
Global $aAftermarket[2] = ["(Aftermarket)", "(Kickstarter)"]
Global $aUnlicensed[2] = ["(Unl)", "(Homebrew)"]
Global $aRevision[14] = ["(Rev 1)", "(Rev 2)", "(Rev 3)", "(Rev 4)", "(Rev 5)", "(Rev 6)", "(Rev A)", "(Rev B)", "(Rev C)", "(Rev D)", "(Alt)", "(Alt 1)", "(Alt 2)", "(Alt 3)"]
Global $aHack[9] = ["[h]", "(Hack)", "Color hack", "FastROM hack", "SlowROM hack", "HiROM hack", "SA1 hack" , "SuperFX hack", "SuperFX2 hack"]

; DEFINE REGION ARRAYS
Global $aUsa[14] = ["(USA)", "(USA, Europe)", "(USA, Europe, Asia)", "(USA, Europe, Brazil)","(USA, Europe, Korea)","(USA, Asia)","(USA, Australia)","(USA, Brazil)", "(USA, Canada)","(USA, Japan)", "(USA, Korea)","(Japan, USA)","(Japan, USA, Brazil)","(Japan, USA, Korea)"]
Global $aEurope[11] = ["(Europe)", "(Europe, Asia)","(Europe, Australia)","(Europe, Brazil)","(Europe, Hong Kong)","(Europe, Korea)","(Japan, Europe)","(Japan, Europe, Australia)","(Japan, Europe, Brazil)","(Japan, Europe, Korea)", "(Japan, Europe, Australia, New Zealand)"]
Global $aJapan[8] = ["(Japan)", "(Japan, Australia)", "(Japan, Brazil)", "(Japan, Korea)", "(Japan, Hong Kong)", "(Japan, New Zealand)", "(Japan, Australia, New Zealand)", "(Japan, Asia)"]

; DEFINE COLLECTION ARRAYS
Global $aGameNoKanzume[3] = ["(Game no Kanzume Vol. 1)", "(Game no Kanzume Vol. 2)", "(Game no Kanzume Otokuyou)"]
Global $aNamcot[3] = ["(Namcot Collection)", "(Namcot Collection, Namco Museum Archives Vol 1)", "(Namcot Collection, Namco Museum Archives Vol 2)"]
Global $aEvercade[4] = ["(Evercade)", "(Evercade, GOG)", "(Evercade, Steam)", "(Kickstarter, Evercade)"]
Global $aMegaDriveMini[5] = ["(Mega Drive Mini)", "(Genesis Mini)", "(Genesis Mini, Mega Drive Mini)", "(Mega Drive Mini 2)", "(Mega Drive Mini 2, Genesis Mini 2)"]
Global $aVirtualConsole[10] = ["(Virtual Console)", "(Virtual Console, Switch Online)", "(Virtual Console, Classic Mini, Switch Online)", "(3DS Virtual Console)", "(Wii Virtual Console)", "(Wii U Virtual Console)", "(Wii and Wii U Virtual Console)", "(USA Wii Virtual Console, Wii U Virtual Console)", "(GameCube, Wii and Wii U Virtual Console)", "(Wii)"]

; SORT MAIN FOLDER
; GET FILES
$Files = _FileListToArrayRec($Roms, "*", 1, $FLTAR_RECUR, 1, 2)
;_ArrayDisplay($Files, "Files List")
If IsArray($Files) Then
   For $f = 1 To $Files[0]
; HACKS AND TRANSLATIONS
	If Call(FileSort, "T-En", $Translation, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "[n]", $Translation, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aHack, $Hack, $Files[$f]) = 1 Then ContinueLoop
; EXCEPTIONS
	If Call(FileSort, "(Japan) (Disc 1) (Arcade)", $Japan, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Japan, Asia) (Disc 1) (Arcade)", $Japan, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Demo) (Switch) (Aftermarket)", $Demo, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Retro-Bit Generations) (Aftermarket)", $Aftermarket, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Switch) (Aftermarket)", $Aftermarket, $Files[$f]) = 1 Then ContinueLoop
; BIOS
	If Call(FileSort2, $aBios, $Bios, $Files[$f]) = 1 Then ContinueLoop
; GAME COLLECTIONS
	If Call(FileSort, "(Aleste Collection)", $GameCollection & "\Aleste Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Bomberman Collection)", $GameCollection & "\Bomberman Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Castlevania Advance Collection)", $GameCollection & "\Castlevania Advance Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Castlevania Anniversary Collection)", $GameCollection & "\Castlevania Anniversary Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Collection of Mana)", $GameCollection & "\Collection of Mana", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Seiken Densetsu Collection)", $GameCollection & "\Collection of Mana", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Collection of SaGa)", $GameCollection & "\Collection of SaGa", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Contra Anniversary Collection)", $GameCollection & "\Contra Anniversary Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Darius Cozmic Collection)", $GameCollection & "\Darius Cozmic Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Disney Classic Games)", $GameCollection & "\Disney Classic Games", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Konami Collector's Series)", $GameCollection & "\Konami Collector's Series", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Mega Man Battle Network Legacy Collection)", $GameCollection & "\Mega Man Battle Network Legacy Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Mega Man Legacy Collection)", $GameCollection & "\Mega Man Legacy Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Mega Man X Legacy Collection)", $GameCollection & "\Mega Man X Legacy Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Metal Gear Solid Collection)", $GameCollection & "\Metal Gear Solid Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Ninja JaJaMaru Retro Collection)", $GameCollection & "\Ninja JaJaMaru Retro Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(SEGA Classic Collection)", $GameCollection & "\SEGA Classic Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sonic Classic Collection)", $GameCollection & "\Sonic Classic Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sonic Mega Collection)", $GameCollection & "\Sonic Mega Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(The Cowabunga Collection)", $GameCollection & "\The Cowabunga Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Cowabunga Collection, The)", $GameCollection & "\The Cowabunga Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(The Disney Afternoon Collection)", $GameCollection & "\The Disney Afternoon Collection", $Files[$f]) = 1 Then ContinueLoop
; PUBLISHER COLLECTIONS
	If Call(FileSort, "(iam8bit)", $PublisherCollection & "\iam8bit", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Columbus Circle)", $PublisherCollection & "\Columbus Circle", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Limited Run Games)", $PublisherCollection & "\Limited Run Games", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Piko Interactive)", $PublisherCollection & "\Piko Interactive", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Pixel Heart)", $PublisherCollection & "\Pixel Heart", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(QUByte Classics)", $PublisherCollection & "\QUByte Classics", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Red Art Games)", $PublisherCollection & "\Red Art Games", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Retro-Bit)", $PublisherCollection & "\Retro-Bit", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Strictly Limited Games)", $PublisherCollection & "\Strictly Limited Games", $Files[$f]) = 1 Then ContinueLoop
; SYSTEM COLLECTIONS
	If Call(FileSort2, $aEvercade, $SystemCollection & "\Evercade", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aMegaDriveMini, $SystemCollection & "\Mega Drive Mini", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aVirtualConsole, $SystemCollection & "\Virtual Console", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Arcade)", $SystemCollection & "\Arcade", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Classic Mini, Switch Online)", $SystemCollection & "\Classic Mini", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(GameCube)", $SystemCollection & "\GameCube", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(GameCube, Zelda Collection)", $SystemCollection & "\GameCube", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(GameCube Edition)", $SystemCollection & "\GameCube Edition", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(GOG)", $SystemCollection & "\Personal Computer", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(e-Reader Edition)", $SystemCollection & "\e-Reader Edition", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Famicom 3D System)", $SystemCollection & "\Famicom 3D System", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(FamicomBox)", $SystemCollection & "\FamicomBox", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(HeartBeat Catalyst)", $SystemCollection & "\HeartBeat Catalyst", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(LodgeNet)", $SystemCollection & "\LodgeNet", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Mega Drive 4)", $SystemCollection & "\Mega Drive 4", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(NP)", $SystemCollection & "\Nintendo Power", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(PC Engine Mini)", $SystemCollection & "\PC Engine Mini", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sega Channel)", $SystemCollection & "\Sega Channel", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sega Game Toshokan)", $SystemCollection & "\Sega Game Toshokan", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sega Gopher)", $SystemCollection & "\Sega Gopher", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Steam)", $SystemCollection & "\Personal Computer", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Switch)", $SystemCollection & "\Switch", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Original Translation, Switch)", $SystemCollection & "\Switch", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(RCG Translation, Switch)", $SystemCollection & "\Switch", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Switch Online)", $SystemCollection & "\Switch Online", $Files[$f]) = 1 Then ContinueLoop
;VARIOUS COLLECTIONS
	If Call(FileSort2, $aGameNoKanzume, $VariousCollection & "\Game No Kanzume", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aNamcot, $VariousCollection & "\Namcot Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Atari Anthology)", $VariousCollection & "\Atari Anthology", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Activision Anthology - Remix Edition)", $VariousCollection & "\Activision Anthology", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Capcom Classics Mini Mix)", $VariousCollection & "\Capcom Classics Mini Mix", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Capcom Town)", $VariousCollection & "\Capcom Town", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Namco Anthology 1)", $VariousCollection & "\Namco Anthology", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Namco Museum Archives Vol 1)", $VariousCollection & "\Namco Museum Archives", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Namco Museum Archives Vol 2)", $VariousCollection & "\Namco Museum Archives", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Retro-Bit Generations)", $VariousCollection & "\Retro-Bit Generations", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Retro Collection)", $VariousCollection & "\Retro Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sega 3D Classics)", $VariousCollection & "\Sega 3D Classics", $Files[$f]) = 1 Then ContinueLoop	
	If Call(FileSort, "(Sega 3D Classics Collection)", $VariousCollection & "\Sega 3D Classics Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sega 3D Fukkoku Akaibusu)", $VariousCollection & "\Sega 3D Fukkoku Akaibusu", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sega Ages)", $VariousCollection & "\Sega Ages", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sega Smash Pack)", $VariousCollection & "\Sega Smash Pack", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Sega Smash Pack 2)", $VariousCollection & "\Sega Smash Pack", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(SNK 40th Anniversary Collection)", $VariousCollection & "\SNK 40th Anniversary Collection", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Songbird)", $VariousCollection & "\Songbird", $Files[$f]) = 1 Then ContinueLoop
; BETAS & PROTOS
	If Call(FileSort2, $aBeta, $Beta, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aProto, $Proto, $Files[$f]) = 1 Then ContinueLoop
; DEMOS & SAMPLES
	If Call(FileSort2, $aDemo, $Demo, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aSample, $Sample, $Files[$f]) = 1 Then ContinueLoop
; UNLICENSED
	If Call(FileSort, "(Pirate)", $Pirate, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aAftermarket, $Aftermarket, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aUnlicensed, $Unlicensed, $Files[$f]) = 1 Then ContinueLoop
; PROGRAMS
	If Call(FileSort2, $aProgram, $Program, $Files[$f]) = 1 Then ContinueLoop
; SEGA CD SPECIFIC
	If Call(FileSort, "(Sega CD 32X)", $SegaCd32x, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Mega-CD 32X)", $SegaCd32x, $Files[$f]) = 1 Then ContinueLoop
; VARIATIONS
	If Call(FileSort, "(Competition Cart)", $Variation & "\Competition Carts", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "Competition Cart, Nintendo Power mail-order", $Variation & "\Competition Carts", $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort, "(Lock-on Combination)", $Variation & "\Lock-on Combination", $Files[$f]) = 1 Then ContinueLoop
; REVISIONS
	If Call(FileSort2, $aRevision, $Revision, $Files[$f]) = 1 Then ContinueLoop
; MAIN REGIONS
	If Call(FileSort, "(World)", $World, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aUsa, $Usa, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aEurope, $Europe, $Files[$f]) = 1 Then ContinueLoop
	If Call(FileSort2, $aJapan, $Japan, $Files[$f]) = 1 Then ContinueLoop
; REMAINING FILES
	Call(FileSort, " ", $Other, $Files[$f])
	Next
EndIf

; SORT FOLDERS BY REGION
Call(RegionSort,$Other)
Call(RegionSort,$Revision)

Call(RegionSort,$Aftermarket)
Call(RegionSort,$Pirate)
Call(RegionSort,$Unlicensed)

; SORT FILES INTO ALPHABETICAL FOLDERS
SortFilesInFolder($Roms)

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
			; Delete source folder if empty
			$FilesList = _FileListToArray(StringReplace($FullName, $FileName, ""), "*.*")
				If IsArray($FilesList) = 0 Then
					DirRemove(StringReplace($FullName, $FileName, ""), 1)
				EndIf
			; Return
			Return 1
        EndIf
    EndIf
EndFunc

Func FileSort2($Array, $Folder, $FullName)
    ; Get the length of the array
    Local $iArrayLength = UBound($Array)
    
    ; Iterate through the array
    For $i = 0 To $iArrayLength - 1
        If FileExists($FullName) Then
			; Split the path into an array using the backslash as a delimiter
			Local $PathParts = StringSplit($FullName, "\")

			; Extract the last element of the array, which is the file name
			Local $FileName = $PathParts[$PathParts[0]]

			; Check if the file name contains the specified filter substring
			If StringInStr($FileName, $array[$i]) Then
				; Check if the destination folder exists; create if not
				If Not FileExists($Folder) Then DirCreate($Folder)
            
				; Move the file to the destination folder
				FileMove($FullName, $Folder & "\" & $FileName)
				; Delete source folder if empty
				$FilesList = _FileListToArray(StringReplace($FullName, $FileName, ""), "*.*")
					If IsArray($FilesList) = 0 Then
						DirRemove(StringReplace($FullName, $FileName, ""), 1)
					EndIf
				; Return
				Return 1
			EndIf
		EndIf
	Next
EndFunc

Func RegionSort($Folder)
    ; Get an array of files in the specified folder and its subfolders
    $Files = _FileListToArrayRec($Folder, "*", 1, 0, 1, 2)
    
    ; Check if the array is valid
    If IsArray($Files) Then
        ; Iterate through each file in the array
        For $f = 1 To $Files[0]
            ; Call FileSort function for specific strings matching
			If Call(FileSort, "(World)", $Folder & "\World", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort2, $aUsa, $Folder & "\USA", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort2, $aEurope, $Folder & "\Europe", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort2, $aJapan, $Folder & "\Japan", $Files[$f]) = 1 Then ContinueLoop
			
			If Call(FileSort, "(Argentina)", $Folder & "\Argentina", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Asia)", $Folder & "\Asia", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Australia)", $Folder & "\Australia", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Australia, Greece)", $Folder & "\Australia", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Austria)", $Folder & "\Austria", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Belgium", $Folder & "\Belgium", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Brazil)", $Folder & "\Brazil", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Brazil, Portugal)", $Folder & "\Brazil", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Brazil, Spain)", $Folder & "\Brazil", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Canada)", $Folder & "\Canada", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(China)", $Folder & "\China", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Denmark)", $Folder & "\Denmark", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Export)", $Folder & "\Export", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Finland)", $Folder & "\Finland", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(France)", $Folder & "\France", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(France, Spain)", $Folder & "\France", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Germany)", $Folder & "\Germany", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Greece)", $Folder & "\Greece", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Hong Kong)", $Folder & "\Hong Kong", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(India)", $Folder & "\India", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Ireland)", $Folder & "\Ireland", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Israel)", $Folder & "\Israel", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Italy)", $Folder & "\Italy", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Korea)", $Folder & "\Korea", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Latin America)", $Folder & "\Latin America", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Mexico)", $Folder & "\Mexico", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Netherlands)", $Folder & "\Netherlands", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(New Zealand)", $Folder & "\New Zealand", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Norway)", $Folder & "\Norway", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Poland)", $Folder & "\Poland", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Portugal)", $Folder & "\Portugal", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Russia)", $Folder & "\Russia", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Scandinavia)", $Folder & "\Scandinavia", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Spain)", $Folder & "\Spain", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Sweden)", $Folder & "\Sweden", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Taiwan)", $Folder & "\Taiwan", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(United Kingdom)", $Folder & "\United Kingdom", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(United Kingdom, Sweden)", $Folder & "\United Kingdom", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(UK)", $Folder & "\United Kingdom", $Files[$f]) = 1 Then ContinueLoop
			If Call(FileSort, "(Unknown)", $Folder & "\Unknown", $Files[$f]) = 1 Then ContinueLoop
        Next
    EndIf
EndFunc

Func SortFilesInFolder($sFolder)
    ; Get an array of all items in the folder (files and subfolders)
    Local $aItems = _FileListToArray($sFolder, "*", 2)

    ; Check if there are any items in the folder
    If @error = 1 Then
        Return
    EndIf

    ; Iterate through each item and process accordingly
    For $i = 1 To UBound($aItems) - 1
        Local $sCurrentPath = $sFolder & "\" & $aItems[$i]
        
        ; If the current item is a folder, process it recursively
        If StringInStr(FileGetAttrib($sCurrentPath), "D") Then
            SortFilesInFolder($sCurrentPath)
        EndIf
    Next

    ; Handle files in the current folder
    Local $aFiles = _FileListToArray($sFolder, "*", 1)
    
    ; Check if the folder contains more than n files
    If IsArray($aFiles) And UBound($aFiles) - 1 > $FileCount Then

        ; Process each file in the folder
        For $j = 1 To UBound($aFiles) - 1
            Local $sFile = $sFolder & "\" & $aFiles[$j]
            Local $sFileName = StringTrimLeft($sFile, StringInStr($sFile, "\", 0, -1))
            Local $sFirstChar = StringUpper(StringLeft($sFileName, 1))
            Local $sDestFolder

            ; Determine the destination folder based on the starting character
            If StringRegExp($sFirstChar, "[A-Z]") Then
                $sDestFolder = $sFolder & "\" & $sFirstChar
            Else
                $sDestFolder = $sFolder & "\#"
            EndIf

            ; Create the destination folder if it doesn't exist
            If Not FileExists($sDestFolder) Then
                DirCreate($sDestFolder)
            EndIf

            ; Move the file to the destination folder
            FileMove($sFile, $sDestFolder & "\" & $sFileName)
        Next
    EndIf
EndFunc