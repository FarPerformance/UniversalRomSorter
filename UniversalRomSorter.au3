#include <Array.au3>
#include <File.au3>

If Not $CmdLine[0] Then Exit

;~ PARAMETERS
$RomsFolder = $CmdLine[1]
$IniFile = @ScriptDir & "\urs.ini"

;~ MODE
$Mode = IniRead($IniFile, "General", "1G1R", "0")

;~ SETTINGS
$MainFolderFileCount = IniRead($IniFile, "Settings", "MainFolderFileCount", "192")

;~ DEFINE FOLDERS
$UsaFolderName = IniRead($IniFile, "Folders", "USA", "1 USA")
$WorldFolderName = IniRead($IniFile, "Folders", "World", "1 World")
$EuropeFolderName = IniRead($IniFile, "Folders", "Europe", "2 Europe")
$JapanFolderName = IniRead($IniFile, "Folders", "Japan", "2 Japan")
$OtherFolderName = IniRead($IniFile, "Folders", "OtherRegions", "2 Other Regions")
$RevisionFolderName = IniRead($IniFile, "Folders", "Revisions", "2 Revisions")
$CollectionFolderName = IniRead($IniFile, "Folders", "Collections", "3 Collections")
$SegaCd32xFolderName = IniRead($IniFile, "Folders", "SegaCD32X", "3 Sega CD 32X")
$EnhancedSoundtrackFolderName = IniRead($IniFile, "Folders", "EnhancedSoundtrack", "3 Enhanced Soundtrack")
$BetaFolderName = IniRead($IniFile, "Folders", "Betas", "4 Betas & Protos")
$DemoFolderName = IniRead($IniFile, "Folders", "Demos", "4 Demos & Samples")
$HomebrewFolderName = IniRead($IniFile, "Folders", "Homebrew", "4 Homebrew")
$PirateFolderName = IniRead($IniFile, "Folders", "Pirate", "4 Pirate")
$ProgramFolderName = IniRead($IniFile, "Folders", "Programs", "4 Programs")
$UnlicensedFolderName = IniRead($IniFile, "Folders", "Unlicensed", "4 Unlicensed")
$VideoFolderName = IniRead($IniFile, "Folders", "Videos", "4 Videos")
$BiosFolderName = IniRead($IniFile, "Folders", "BIOS", "6 BIOS")

;~ DEFINE PATHS
$UsaFolder = $RomsFolder & "\" & $UsaFolderName
$WorldFolder = $RomsFolder & "\" & $WorldFolderName
$EuropeFolder = $RomsFolder & "\" & $EuropeFolderName
$JapanFolder = $RomsFolder & "\" & $JapanFolderName
$OtherFolder = $RomsFolder & "\" & $OtherFolderName
$RevisionFolder = $RomsFolder & "\" & $RevisionFolderName
$CollectionFolder = $RomsFolder & "\" & $CollectionFolderName
$SegaCd32xFolder = $RomsFolder & "\" & $SegaCd32xFolderName
$EnhancedSoundtrackFolder = $RomsFolder & "\" & $EnhancedSoundtrackFolderName
$BetaFolder = $RomsFolder & "\" & $BetaFolderName
$DemoFolder = $RomsFolder & "\" & $DemoFolderName
$HomebrewFolder = $RomsFolder & "\" & $HomebrewFolderName
$PirateFolder = $RomsFolder & "\" & $PirateFolderName
$ProgramFolder = $RomsFolder & "\" & $ProgramFolderName
$UnlicensedFolder = $RomsFolder & "\" & $UnlicensedFolderName
$VideoFolder = $RomsFolder & "\" & $VideoFolderName
$BiosFolder = $RomsFolder & "\" & $BiosFolderName

;~ SORT MAIN FOLDER
;~ GET FILES
$Files = _FileListToArrayRec($RomsFolder, "*", 1, 0, 1, 2)
If IsArray($Files) Then
   For $f = 1 To $Files[0]
;~ BIOS
	  Call(FileSort, "[BIOS]", $BiosFolder, $Files[$f])
	  Call(FileSort, "(Enhancement Chip)", $BiosFolder & "\Enhancement Chips", $Files[$f])
	  Call(FileSort, "(Channel)", $BiosFolder & "\Channel", $Files[$f])
	  Call(FileSort, "(System)", $BiosFolder & "\System", $Files[$f])
;~ BETAS
	  Call(FileSort, "(Beta", $BetaFolder & "\Betas", $Files[$f])
	  Call(FileSort, "(Debug", $BetaFolder & "\Betas", $Files[$f])
	  Call(FileSort, "(Proto", $BetaFolder & "\Protos", $Files[$f])
	  Call(FileSort, "Proto)", $BetaFolder & "\Protos", $Files[$f])
;~ DEMOS
	  Call(FileSort, "(Demo", $DemoFolder & "\Demos", $Files[$f])
	  Call(FileSort, "Demo)", $DemoFolder & "\Demos", $Files[$f])
	  Call(FileSort, "Demo Disc", $DemoFolder & "\Demos", $Files[$f])
	  Call(FileSort, "(Kiosk", $DemoFolder & "\Demos", $Files[$f])
	  Call(FileSort, "(Sample", $DemoFolder & "\Samples", $Files[$f])
	  Call(FileSort, "(Promo", $DemoFolder & "\Samples", $Files[$f])
	  Call(FileSort, "Promo)", $DemoFolder & "\Samples", $Files[$f])
;~ VIDEOS
	  Call(FileSort, "Game Boy Advance Video", $VideoFolder, $Files[$f])
;~ COLLECTIONS
	  If $Mode = "0" Then
		 Call(FileSort, "(Aleste Collection", $CollectionFolder & "\Aleste Collection", $Files[$f])
		 Call(FileSort, "(Castlevania Advance Collection", $CollectionFolder & "\Castlevania Advance Collection", $Files[$f])
		 Call(FileSort, "(Castlevania Anniversary Collection", $CollectionFolder & "\Castlevania Anniversary Collection", $Files[$f])
		 Call(FileSort, "(Collection of Mana", $CollectionFolder & "\Collection of Mana", $Files[$f])
		 Call(FileSort, "(Collection of SaGa", $CollectionFolder & "\Collection of SaGa", $Files[$f])
		 Call(FileSort, "(Seiken Densetsu Collection", $CollectionFolder & "\Collection of Mana", $Files[$f])
		 Call(FileSort, "(Contra Anniversary Collection", $CollectionFolder & "\Contra Anniversary Collection", $Files[$f])
		 Call(FileSort, "(Darius Cozmic Collection", $CollectionFolder & "\Darius Cozmic Collection", $Files[$f])
		 Call(FileSort, "(Mega Man Legacy Collection", $CollectionFolder & "\Mega Man Legacy Collection", $Files[$f])
		 Call(FileSort, "(Mega Man X Legacy Collection", $CollectionFolder & "\Mega Man X Legacy Collection", $Files[$f])
		 Call(FileSort, "(Namcot Collection", $CollectionFolder & "\Namcot Collection", $Files[$f])
		 Call(FileSort, "Namco Museum Archives", $CollectionFolder & "\Namcot Collection", $Files[$f])
		 Call(FileSort, "(SNK 40th Anniversary Collection", $CollectionFolder & "\SNK 40th Anniversary Collection", $Files[$f])
		 Call(FileSort, "(Sonic Classic Collection", $CollectionFolder & "\Sonic Classic Collection", $Files[$f])
		 Call(FileSort, "(The Disney Afternoon Collection", $CollectionFolder & "\The Disney Afternoon Collection", $Files[$f])
		 Call(FileSort, "(The Cowabunga Collection", $CollectionFolder & "\The Cowabunga Collection", $Files[$f])
		 Call(FileSort, "(SEGA Classic Collection", $CollectionFolder & "\SEGA Classic Collection", $Files[$f])
		 Call(FileSort, "(Sonic Mega Collection", $CollectionFolder & "\Sonic Mega Collection", $Files[$f])
		 Call(FileSort, "(Disney Classic Games", $CollectionFolder & "\Disney Classic Games", $Files[$f])
		 Call(FileSort, "(e-Reader Edition", $CollectionFolder & "\e-Reader Edition", $Files[$f])
		 Call(FileSort, "(Capcom Classics Mini Mix", $CollectionFolder & "\Capcom Classics Mini Mix", $Files[$f])
		 Call(FileSort, "(Mega Drive Mini", $CollectionFolder & "\Mega Drive Mini", $Files[$f])
		 Call(FileSort, "(Genesis Mini", $CollectionFolder & "\Genesis Mini", $Files[$f])
		 Call(FileSort, "Virtual Console", $CollectionFolder & "\Virtual Console", $Files[$f])
		 Call(FileSort, "Switch Online", $CollectionFolder & "\Switch Online", $Files[$f])
	  EndIf
;~ HOMEBREW
	  Call(FileSort, "(Homebrew)", $HomebrewFolder, $Files[$f])
;~ PIRATE
	  Call(FileSort, "(Pirate)", $PirateFolder, $Files[$f])
;~ UNLICENSED
	  Call(FileSort, "(Unl)", $UnlicensedFolder, $Files[$f])
;~ PROGRAMS
	  Call(FileSort, "Program)", $ProgramFolder, $Files[$f])
;~ SEGA CD SPECIFIC
	  Call(FileSort, "(Brazil) (Sega CD 32X)", $SegaCd32xFolder & "\" & $OtherFolderName & "\Brazil", $Files[$f])
	  Call(FileSort, "Sega CD 32X", $SegaCd32xFolder & "\" & $UsaFolderName, $Files[$f])
	  Call(FileSort, "Mega-CD 32X", $SegaCd32xFolder & "\" & $EuropeFolderName, $Files[$f])
	  Call(FileSort, "Enhanced Soundtrack Disc", $EnhancedSoundtrackFolder, $Files[$f])
;~ REVISIONS
 	  If $Mode = "0" Then
 		 Call(FileSort, "(GameCube", $RevisionFolder, $Files[$f])
 		 Call(FileSort, "(Wii)", $RevisionFolder, $Files[$f])
 		 Call(FileSort, "(Sega Channel", $RevisionFolder, $Files[$f])
		 Call(FileSort, "(Sega Ages", $RevisionFolder, $Files[$f])
 		 Call(FileSort, "(Rev", $RevisionFolder, $Files[$f])
 		 Call(FileSort, "(Alt", $RevisionFolder, $Files[$f])
 		 Call(FileSort, "Alt)", $RevisionFolder, $Files[$f])
 	  EndIf
;~ MAIN REGIONS
	  Call(FileSort, "(USA", $UsaFolder, $Files[$f])
	  Call(FileSort, ", USA", $UsaFolder, $Files[$f])
	  Call(FileSort, "(World", $WorldFolder, $Files[$f])
	  Call(FileSort, "(Europe", $EuropeFolder, $Files[$f])
	  Call(FileSort, ", Europe", $EuropeFolder, $Files[$f])
	  Call(FileSort, "(Japan", $JapanFolder, $Files[$f])
;~ REMAINING FILES
	  Call(FileSort, "(", $OtherFolder, $Files[$f])
	Next
EndIf

;~ CREATE SUBFOLDERS
Call(SubfolderSort,$WorldFolder,$MainFolderFileCount)
Call(SubfolderSort,$UsaFolder,$MainFolderFileCount)
Call(SubfolderSort,$EuropeFolder,$MainFolderFileCount)
Call(SubfolderSort,$JapanFolder,$MainFolderFileCount)

;~ SORT FOLDERS BY REGION
Call(RegionSort,$OtherFolder)
Call(RegionSort,$RevisionFolder)
Call(RegionSort,$HomebrewFolder)
Call(RegionSort,$PirateFolder)
Call(RegionSort,$UnlicensedFolder)

;~ FUNCTIONS
;~ FILESORT
Func FileSort($Filter, $Folder, $FullName)
   If FileExists($FullName) And StringInStr($FullName, $Filter) Then
	  If Not FileExists($Folder) Then
		 DirCreate($Folder)
	  Endif
	  FileMove($FullName, $Folder)
   EndIf
EndFunc

;~ FOLDERSORT
Func FolderSort($RomsFolder)
;~ MOVE NUMBERED FILES
$FileList = _FileListToArrayRec($RomsFolder, "0*;1*;2*;3*;4*;5*;6*;7*;8*;9*;'*;[*", 1, 0, 1, 2)
   If IsArray($FileList) Then
	  $Folder = $RomsFolder & "\#"
	  DirCreate($Folder)
		 For $f = 1 To $FileList[0]
			FileMove($FileList[$f], $Folder)
		 Next
	  EndIf
;~ MOVE FILES
$FileList = _FileListToArrayRec($RomsFolder, "*", 1, 0, 1, 2)
   If IsArray($FileList) Then
		 For $f = 1 To $FileList[0]
			$FileName = StringUpper(StringLeft(StringReplace($FileList[$f],$RomsFolder & "\" ,""),1))
			$Folder = $RomsFolder & "\" & $FileName
			DirCreate($Folder)
			FileMove($FileList[$f], $Folder)
		 Next
   EndIf
EndFunc

;~ SUBFOLDERSORT
Func SubfolderSort($Folder,$FolderFileCount)
	$Count = _FileListToArrayRec($Folder, "*", 1, 0, 1, 2)
	If IsArray($Count) Then
		If $Count[0] > $FolderFileCount Then
			Call(FolderSort, $Folder)
		EndIf
	Endif
EndFunc

;~ REGIONSORT
Func RegionSort($Folder)
$Files = _FileListToArrayRec($Folder, "*", 1, 0, 1, 2)
If IsArray($Files) Then
   For $f = 1 To $Files[0]
		Call(FileSort, "(USA", $Folder & "\USA", $Files[$f])
		Call(FileSort, ", USA", $Folder & "\USA", $Files[$f])
		Call(FileSort, "(World", $Folder & "\World", $Files[$f])
		Call(FileSort, "(Europe", $Folder & "\Europe", $Files[$f])
		Call(FileSort, ", Europe", $Folder & "\Europe", $Files[$f])
		Call(FileSort, "(Japan", $Folder & "\Japan", $Files[$f])
		Call(FileSort, "(Germany)", $Folder & "\Germany", $Files[$f])
		Call(FileSort, "(Italy)", $Folder & "\Italy", $Files[$f])
		Call(FileSort, "(Spain)", $Folder & "\Spain", $Files[$f])
		Call(FileSort, "(France)", $Folder & "\France", $Files[$f])
		Call(FileSort, "(China)", $Folder & "\China", $Files[$f])
		Call(FileSort, "(Korea)", $Folder & "\Korea", $Files[$f])
		Call(FileSort, "(Australia)", $Folder & "\Australia", $Files[$f])
		Call(FileSort, "(United Kingdom", $Folder & "\United Kingdom", $Files[$f])
		Call(FileSort, "(UK)", $Folder & "\United Kingdom", $Files[$f])
		Call(FileSort, "(Netherlands)", $Folder & "\Netherlands", $Files[$f])
		Call(FileSort, "(Denmark)", $Folder & "\Denmark", $Files[$f])
		Call(FileSort, "(Sweden)", $Folder & "\Sweden", $Files[$f])
		Call(FileSort, "(Brazil", $Folder & "\Brazil", $Files[$f])
		Call(FileSort, "(Mexico)", $Folder & "\Mexico", $Files[$f])
		Call(FileSort, "(Asia", $Folder & "\Asia", $Files[$f])
		Call(FileSort, "(Hong Kong)", $Folder & "\Hong Kong", $Files[$f])
		Call(FileSort, "(Taiwan)", $Folder & "\Taiwan", $Files[$f])
		Call(FileSort, "(Canada)", $Folder & "\Canada", $Files[$f])
		Call(FileSort, "(New Zealand)", $Folder & "\New Zealand", $Files[$f])
		Call(FileSort, "(Finland)", $Folder & "\Finland", $Files[$f])
		Call(FileSort, "(Greece)", $Folder & "\Greece", $Files[$f])
		Call(FileSort, "(Russia)", $Folder & "\Russia", $Files[$f])
		Call(FileSort, "(Norway)", $Folder & "\Norway", $Files[$f])
		Call(FileSort, "(Portugal)", $Folder & "\Portugal", $Files[$f])
		Call(FileSort, "(Scandinavia)", $Folder & "\Scandinavia", $Files[$f])
		Call(FileSort, "(Austria)", $Folder & "\Austria", $Files[$f])
		Call(FileSort, "(Ireland)", $Folder & "\Ireland", $Files[$f])
		Call(FileSort, "(Israel)", $Folder & "\Israel", $Files[$f])
		Call(FileSort, "(Belgium", $Folder & "\Belgium", $Files[$f])
		Call(FileSort, "(Poland)", $Folder & "\Poland", $Files[$f])
		Call(FileSort, "(Latin America)", $Folder & "\Latin America", $Files[$f])
		Call(FileSort, "(Export)", $Folder & "\Export", $Files[$f])
		Call(FileSort, "(Argentina)", $Folder & "\Argentina", $Files[$f])
		Call(FileSort, "(Unknown)", $Folder & "\Unknown", $Files[$f])
		Next
	EndIf
EndFunc