#include <Array.au3>
#include <File.au3>

If Not $CmdLine[0] Then Exit

;~ PARAMETERS
$RomsFolder = $CmdLine[1]
$IniFile = @ScriptDir & "\urs.ini"

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
$ApplicationFolderName = IniRead($IniFile, "Folders", "Applications", "4 Applications")
$BetaFolderName = IniRead($IniFile, "Folders", "Betas", "4 Betas & Protos")
$DemoFolderName = IniRead($IniFile, "Folders", "Demos", "4 Demos & Samples")
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
$ApplicationFolder = $RomsFolder & "\" & $ApplicationFolderName
$BetaFolder = $RomsFolder & "\" & $BetaFolderName
$DemoFolder = $RomsFolder & "\" & $DemoFolderName
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
;~ BETAS & PROTOS
	Call(FileSortRegEx, "\((Beta|Debug).*\)", $BetaFolder & "\Betas", $Files[$f]) ; R1
	Call(FileSortRegEx, "\(([^)]*Proto[^)]*)\)", $BetaFolder & "\Protos", $Files[$f]) ; R1a
;~ DEMOS & SAMPLES
	Call(FileSortRegEx, "\((Demo|Kiosk|Taikenban).*\)", $DemoFolder & "\Demos", $Files[$f]) ; R1
	Call(FileSortRegEx, "(Demo Disc|Demo CD|Euro Demo)(?=[^(]*\()", $DemoFolder & "\Demos", $Files[$f]) ; R3
	Call(FileSortRegEx, "\((Sample|Promo).*\)", $DemoFolder & "\Samples", $Files[$f]) ; R1
	Call(FileSortRegEx, "(Interactive CD Sampler|Interactive Sampler CD|Official PlayStation Magazine|PlayStation Sampler|Sampler Disc)(?=[^(]*\()", $DemoFolder & "\Sampler Discs", $Files[$f]) ; R3
;~ VIDEOS
	Call(FileSortRegEx, "(Game Boy Advance Video)(?=[^(]*\()", $VideoFolder, $Files[$f]) ; R3
;~ PROGRAMS
	Call(FileSortRegEx, "\(Program.*\)", $ProgramFolder, $Files[$f]) ; R1
	Call(FileSortRegEx, "(Aprilia|Jaguar Mishin Sashi Senyou Soft|Peugeot - Orbital Diagnostic System|Raku x Raku|Sewing Machine Operation Software|Test Cartridge)(?=[^(]*\()", $ProgramFolder, $Files[$f]) ; R3
	Call(FileSortRegEx, "(Minolta)(?=[^(]*\()", $ProgramFolder & "\Minolta", $Files[$f]) ; R3
;~ APPLICATIONS
	Call(FileSortRegEx, "(Action Replay|CodeBreaker|GameBooster 64|Game Genie|Game Saver|GameShark|Super 8|Super Game Boy|Tri-Star|X-Terminator|Xploder|Xplorer 64|XBAND)(?=[^(]*\()", $ApplicationFolder, $Files[$f]) ; R3
	Call(FileSortRegEx, "(Advanced Music Player|GB-A TV Tuner|GBA AV Adapter|GBA Jukebox|GBA Movie Player|GBA Personal Organizer)(?=[^(]*\()", $ApplicationFolder, $Files[$f]) ; R3
	Call(FileSortRegEx, "(Doctor GB Card|Game Boy Aging Cartridge|Game Boy Camera|Game Boy Controller Kensa Cartridge|Game Boy Datenlogger|Game Boy Digital Sampling Oscilloscope|InfoGenius|SmartCom)(?=[^(]*\()", $ApplicationFolder, $Files[$f]) ; R3
;~ COLLECTIONS
	Call(CollectionSort, "\(([^),]*Collection[^),]*)\)", $CollectionFolder, $Files[$f]) ; R4
	Call(CollectionSort, "\(([^),]*Classics[^),]*)\)", $CollectionFolder, $Files[$f]) ; R4
	Call(FileSortRegEx, "\((Mega Drive Mini|Genesis Mini).*\)", $CollectionFolder & "\Mega Drive Mini", $Files[$f]) ; R1
	Call(FileSortRegEx, "\(Competition Cart.*\)", $CollectionFolder & "\Competition Cart", $Files[$f]) ; R1
	Call(FileSortRegEx, "\(Game no Kanzume.*\)", $CollectionFolder & "\Game no Kanzume", $Files[$f]) ; R1
	Call(FileSortRegEx, "\(Sega Smash Pack.*\)", $CollectionFolder & "\Sega Smash Pack", $Files[$f]) ; R1
	Call(FileSortRegEx, "\(.*?(Namco Museum Archives|Namco Anthology).*?\)", $CollectionFolder & "\Namcot Collection", $Files[$f]) ; R2
	Call(FileSortRegEx, "(Arcade Legends)(?=[^(]*\()", $CollectionFolder & "\Arcade Legends", $Files[$f]) ; R3
	Call(FileSort, "Virtual Console", $CollectionFolder & "\Virtual Console", $Files[$f])
	Call(FileSort, "Switch Online", $CollectionFolder & "\Switch Online", $Files[$f])
	Call(FileSort, "Translation, Switch", $CollectionFolder & "\Switch", $Files[$f])
	Call(FileSort, "(Switch)", $CollectionFolder & "\Switch", $Files[$f])
	Call(FileSort, "(GameCube Edition)", $CollectionFolder & "\GameCube Edition", $Files[$f])
	Call(FileSort, "(GameCube)", $CollectionFolder & "\GameCube", $Files[$f])
	Call(FileSort, "(Wii)", $CollectionFolder & "\Wii", $Files[$f])
	Call(FileSort, "(Limited Run Games)", $CollectionFolder & "\Limited Run Games", $Files[$f])
	Call(FileSort, "(Retro-Bit Generations)", $CollectionFolder & "\Retro-Bit Generations", $Files[$f])
	Call(FileSort, "(Capcom Town)", $CollectionFolder & "\Capcom Town", $Files[$f])
	Call(FileSort, "(iam8bit)", $CollectionFolder & "\iam8bit", $Files[$f])
	Call(FileSort, "(NP)", $CollectionFolder & "\Nintendo Power", $Files[$f])
	Call(FileSort, "(Sega Ages)", $CollectionFolder & "\Sega Ages", $Files[$f])
	Call(FileSort, "(Sega Channel)", $CollectionFolder & "\Sega Channel", $Files[$f])
	Call(FileSort, "(Sega Gopher)", $CollectionFolder & "\Sega Gopher", $Files[$f])
	Call(FileSort, "(SegaNet)", $CollectionFolder & "\SegaNet", $Files[$f])
	Call(FileSort, "(PC Engine Mini)", $CollectionFolder & "\PC Engine Mini", $Files[$f])
	Call(FileSort, "(LodgeNet)", $CollectionFolder & "\LodgeNet", $Files[$f])
	Call(FileSort, "(Lock-on Combination)", $CollectionFolder & "\Lock-on Combination", $Files[$f])
	Call(FileSort, "(Disney Classic Games)", $CollectionFolder & "\Disney Classic Games", $Files[$f])
	Call(FileSort, "(e-Reader Edition)", $CollectionFolder & "\e-Reader Edition", $Files[$f])
	Call(FileSort, "(USA) (Arcade)", $CollectionFolder & "\Arcade", $Files[$f])
	Call(FileSort, "(Japan) (En) (Arcade)", $CollectionFolder & "\Arcade", $Files[$f])
;~ PIRATE
	Call(FileSort, "(Pirate)", $PirateFolder, $Files[$f])
;~ UNLICENSED
	Call(FileSortRegEx, "\((Unl|Homebrew).*\)", $UnlicensedFolder, $Files[$f]) ; R1
;~ SEGA CD SPECIFIC
	Call(FileSort, "(Brazil) (Sega CD 32X)", $SegaCd32xFolder & "\" & $OtherFolderName & "\Brazil", $Files[$f])
	Call(FileSort, "(Sega CD 32X)", $SegaCd32xFolder & "\" & $UsaFolderName, $Files[$f])
	Call(FileSort, "(Mega-CD 32X)", $SegaCd32xFolder & "\" & $EuropeFolderName, $Files[$f])
	Call(FileSort, "Enhanced Soundtrack Disc", $EnhancedSoundtrackFolder, $Files[$f])
;~ REVISIONS
	Call(FileSortRegEx, "\((Rev|Alt).*\)", $RevisionFolder, $Files[$f]) ; R1
;~ MAIN REGIONS
	Call(FileSortRegEx, "\(USA.*\)", $UsaFolder, $Files[$f]) ; R1
	Call(FileSortRegEx, "\(World.*\)", $WorldFolder, $Files[$f]) ; R1
	Call(FileSortRegEx, "\(Europe.*\)", $EuropeFolder, $Files[$f]) ; R1
	Call(FileSortRegEx, "\(Japan.*\)", $JapanFolder, $Files[$f]) ; R1
;~ REMAINING FILES
	Call(FileSort, " ", $OtherFolder, $Files[$f])
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

;~ FILESORTREGEX
Func FileSortRegEx($Filter, $Folder, $FullName)
   If FileExists($FullName) And StringRegExp($FullName, $Filter) Then
	  If Not FileExists($Folder) Then
		 DirCreate($Folder)
	  Endif
	  FileMove($FullName, $Folder)
   EndIf
EndFunc

;~ FOLDERSORT
Func FolderSort($RomsFolder)
$FileList = _FileListToArrayRec($RomsFolder, "0*;1*;2*;3*;4*;5*;6*;7*;8*;9*;'*;[*", 1, 0, 1, 2)
   If IsArray($FileList) Then
	  $Folder = $RomsFolder & "\#"
	  DirCreate($Folder)
		 For $f = 1 To $FileList[0]
			FileMove($FileList[$f], $Folder)
		 Next
	  EndIf
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
		Call(FileSortRegEx, "\(USA.*\)", $Folder & "\USA", $Files[$f]) ; R1
		Call(FileSortRegEx, "\(World.*\)", $Folder & "\World", $Files[$f]) ; R1
		Call(FileSortRegEx, "\(Europe.*\)", $Folder & "\Europe", $Files[$f]) ; R1
		Call(FileSortRegEx, "\(Japan.*\)", $Folder & "\Japan", $Files[$f]) ; R1
		Call(FileSortRegEx, "\((United Kingdom|UK).*\)", $Folder & "\United Kingdom", $Files[$f]) ; R1
		Call(FileSortRegEx, "\(Australia.*\)", $Folder & "\Australia", $Files[$f]) ; R1
		Call(FileSortRegEx, "\(Brazil.*\)", $Folder & "\Brazil", $Files[$f]) ; R1
		Call(FileSortRegEx, "\(Asia.*\)", $Folder & "\Asia", $Files[$f]) ; R1
		Call(FileSort, "(Germany)", $Folder & "\Germany", $Files[$f])
		Call(FileSort, "(Italy)", $Folder & "\Italy", $Files[$f])
		Call(FileSort, "(Spain)", $Folder & "\Spain", $Files[$f])
		Call(FileSort, "(France)", $Folder & "\France", $Files[$f])
		Call(FileSort, "(China)", $Folder & "\China", $Files[$f])
		Call(FileSort, "(Korea)", $Folder & "\Korea", $Files[$f])
		Call(FileSort, "(Netherlands)", $Folder & "\Netherlands", $Files[$f])
		Call(FileSort, "(Denmark)", $Folder & "\Denmark", $Files[$f])
		Call(FileSort, "(Sweden)", $Folder & "\Sweden", $Files[$f])
		Call(FileSort, "(Hong Kong)", $Folder & "\Hong Kong", $Files[$f])
		Call(FileSort, "(Taiwan)", $Folder & "\Taiwan", $Files[$f])
		Call(FileSort, "(Canada)", $Folder & "\Canada", $Files[$f])
		Call(FileSort, "(New Zealand)", $Folder & "\New Zealand", $Files[$f])
		Call(FileSort, "(Finland)", $Folder & "\Finland", $Files[$f])
		Call(FileSort, "(Greece)", $Folder & "\Greece", $Files[$f])
		Call(FileSort, "(Mexico)", $Folder & "\Mexico", $Files[$f])
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

;~ COLLECTIONSORT
Func CollectionSort($Filter, $Folder, $FullName)
   $Collection = StringRegExp($FullName, $Filter, 3)
   If FileExists($FullName) and IsArray($Collection) Then
	  If Not FileExists($Folder & "\" & $Collection[0]) Then
		 DirCreate($Folder & "\" & $Collection[0])
	  Endif
	  FileMove($FullName, $Folder & "\" & $Collection[0])
   EndIf
EndFunc