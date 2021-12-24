#include <Array.au3>
#include <File.au3>

If Not $CmdLine[0] Then Exit

;~ PARAMETERS
$RomsFolder = $CmdLine[1]
$IniFile = @ScriptDir & "\urs.ini"

;~ MODE
$Mode = IniRead($IniFile, "General", "1G1R", "0")

;~ SETTINGS
$MainFolderFileCount = IniRead($IniFile, "Settings", "MainFolderFileCount", "200")
$SubFolderMinimumFileCount = IniRead($IniFile, "Settings", "SubFolderMinimumFileCount", "150")

;~ DEFINE FOLDERS
$UsaFolderName = IniRead($IniFile, "Folders", "USA", "1 USA")
$WorldFolderName = IniRead($IniFile, "Folders", "World", "1 USA")
$EuropeFolderName = IniRead($IniFile, "Folders", "Europe", "2 Europe")
$JapanFolderName = IniRead($IniFile, "Folders", "Japan", "2 Japan")
$OtherFolderName = IniRead($IniFile, "Folders", "OtherRegions", "2 Other Regions")
$RevisionFolderName = IniRead($IniFile, "Folders", "Revisions", "2 Revisions")
$CollectionFolderName = IniRead($IniFile, "Folders", "Collections", "3 Collections")
$SegaMiniFolderName = IniRead($IniFile, "Folders", "SegaMini", "3 Mega Drive Mini")
$SegaCd32xFolderName = IniRead($IniFile, "Folders", "SegaCD32X", "3 Sega CD 32X")
$VcFolderName = IniRead($IniFile, "Folders", "VirtualConsole", "3 Virtual Console")
$EnhancedSoundtrackFolderName = IniRead($IniFile, "Folders", "EnhancedSoundtrack", "3 Enhanced Soundtrack")
$BetaFolderName = IniRead($IniFile, "Folders", "Betas", "4 Betas & Protos")
$DemoFolderName = IniRead($IniFile, "Folders", "Demos", "4 Demos & Samples")
$ProgramFolderName = IniRead($IniFile, "Folders", "Programs", "4 Programs")
$TranslationFolderName = IniRead($IniFile, "Folders", "Translations", "4 Translations")
$UnlicensedFolderName = IniRead($IniFile, "Folders", "Unlicensed", "4 Unlicensed")
$VideoFolderName = IniRead($IniFile, "Folders", "Videos", "4 Videos")
$BiosFolderName = IniRead($IniFile, "Folders", "BIOS", "5 BIOS")

;~ DEFINE PATHS
$UsaFolder = $RomsFolder & "\" & $UsaFolderName
$WorldFolder = $RomsFolder & "\" & $WorldFolderName
$EuropeFolder = $RomsFolder & "\" & $EuropeFolderName
$JapanFolder = $RomsFolder & "\" & $JapanFolderName
$OtherFolder = $RomsFolder & "\" & $OtherFolderName
$RevisionFolder = $RomsFolder & "\" & $RevisionFolderName
$CollectionFolder = $RomsFolder & "\" & $CollectionFolderName
$SegaMiniFolder = $RomsFolder & "\" & $SegaMiniFolderName
$SegaCd32xFolder = $RomsFolder & "\" & $SegaCd32xFolderName
$VcFolder = $RomsFolder & "\" & $VcFolderName
$EnhancedSoundtrackFolder = $RomsFolder & "\" & $EnhancedSoundtrackFolderName
$BetaFolder = $RomsFolder & "\" & $BetaFolderName
$DemoFolder = $RomsFolder & "\" & $DemoFolderName
$ProgramFolder = $RomsFolder & "\" & $ProgramFolderName
$TranslationFolder = $RomsFolder & "\" & $TranslationFolderName
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
	  Call(FileSort, "(Enhancement Chip)", $BiosFolder & "\Enhancement Chip", $Files[$f])
	  Call(FileSort, "(Channel)", $BiosFolder & "\Channel", $Files[$f])
	  Call(FileSort, "(System)", $BiosFolder & "\System", $Files[$f])
;~ TRANSLATIONS
	  Call(FileSort, "[T-En", $TranslationFolder, $Files[$f])
	  Call(FileSort, "(T-En", $TranslationFolder, $Files[$f])
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
	  EndIf
;~ UNLICENSED
	  Call(FileSort, "(Pirate)", $UnlicensedFolder, $Files[$f])
	  Call(FileSort, "(Unl)", $UnlicensedFolder, $Files[$f])
;~ SEGA MINI CONSOLES
	  If $Mode = "0" Then
		 Call(FileSort, "(Mega Drive Mini)", $SegaMiniFolder, $Files[$f])
		 Call(FileSort, "(Genesis Mini)", $SegaMiniFolder, $Files[$f])
	  EndIf
;~ BETAS
	  Call(FileSort, "(Beta", $BetaFolder & "\Betas", $Files[$f])
	  Call(FileSort, "(Debug", $BetaFolder & "\Betas", $Files[$f])
	  Call(FileSort, "(Proto", $BetaFolder & "\Protos", $Files[$f])
	  Call(FileSort, "Proto)", $BetaFolder & "\Protos", $Files[$f])
;~ DEMOS
	  Call(FileSort, "(Demo", $DemoFolder & "\Demos", $Files[$f])
	  Call(FileSort, "Demo Disc", $DemoFolder & "\Demos", $Files[$f])
	  Call(FileSort, "(Kiosk", $DemoFolder & "\Demos", $Files[$f])
	  Call(FileSort, "(Sample", $DemoFolder & "\Samples", $Files[$f])
	  Call(FileSort, "(Promo", $DemoFolder & "\Samples", $Files[$f])
	  Call(FileSort, "Promo)", $DemoFolder & "\Samples", $Files[$f])
;~ PROGRAMS
	  Call(FileSort, "Program)", $ProgramFolder, $Files[$f])
;~ NINTENDO
	  If $Mode = "0" Then
		 Call(FileSort, "Virtual Console", $VcFolder, $Files[$f])
		 Call(FileSort, "Switch Online", $VcFolder, $Files[$f])
	  EndIf
;~ SEGA CD SPECIFIC
	  Call(FileSort, "(Brazil) (Sega CD 32X)", $SegaCd32xFolder & "\" & $OtherFolderName & "\Brazil", $Files[$f])
	  Call(FileSort, "Sega CD 32X", $SegaCd32xFolder & "\" & $UsaFolderName, $Files[$f])
	  Call(FileSort, "Mega-CD 32X", $SegaCd32xFolder & "\" & $EuropeFolderName, $Files[$f])
	  Call(FileSort, "Enhanced Soundtrack Disc", $EnhancedSoundtrackFolder, $Files[$f])
;~ REVISIONS
	  If $Mode = "0" Then
		 Call(FileSort, "(GameCube", $RevisionFolder, $Files[$f])
		 Call(FileSort, "(Wii)", $RevisionFolder, $Files[$f])
		 Call(FileSort, "(Sega Channel)", $RevisionFolder, $Files[$f])
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
;~ OTHER REGIONS
	  Call(FileSort, "(Germany)", $OtherFolder & "\Germany", $Files[$f])
	  Call(FileSort, "(Italy)", $OtherFolder & "\Italy", $Files[$f])
	  Call(FileSort, "(Spain)", $OtherFolder & "\Spain", $Files[$f])
	  Call(FileSort, "(France)", $OtherFolder & "\France", $Files[$f])
	  Call(FileSort, "(China)", $OtherFolder & "\China", $Files[$f])
	  Call(FileSort, "(Korea)", $OtherFolder & "\Korea", $Files[$f])
	  Call(FileSort, "(Australia)", $OtherFolder & "\Australia", $Files[$f])
	  Call(FileSort, "(United Kingdom", $OtherFolder & "\United Kingdom", $Files[$f])
	  Call(FileSort, "(UK)", $OtherFolder & "\United Kingdom", $Files[$f])
	  Call(FileSort, "(Netherlands)", $OtherFolder & "\Netherlands", $Files[$f])
	  Call(FileSort, "(Denmark)", $OtherFolder & "\Denmark", $Files[$f])
	  Call(FileSort, "(Sweden)", $OtherFolder & "\Sweden", $Files[$f])
	  Call(FileSort, "(Brazil", $OtherFolder & "\Brazil", $Files[$f])
	  Call(FileSort, "(Mexico)", $OtherFolder & "\Mexico", $Files[$f])
	  Call(FileSort, "(Asia)", $OtherFolder & "\Asia", $Files[$f])
	  Call(FileSort, "(Hong Kong)", $OtherFolder & "\Hong Kong", $Files[$f])
	  Call(FileSort, "(Taiwan)", $OtherFolder & "\Taiwan", $Files[$f])
	  Call(FileSort, "(Canada)", $OtherFolder & "\Canada", $Files[$f])
	  Call(FileSort, "(New Zealand)", $OtherFolder & "\New Zealand", $Files[$f])
	  Call(FileSort, "(Finland)", $OtherFolder & "\Finland", $Files[$f])
	  Call(FileSort, "(Greece)", $OtherFolder & "\Greece", $Files[$f])
	  Call(FileSort, "(Russia)", $OtherFolder & "\Russia", $Files[$f])
	  Call(FileSort, "(Norway)", $OtherFolder & "\Norway", $Files[$f])
	  Call(FileSort, "(Portugal)", $OtherFolder & "\Portugal", $Files[$f])
	  Call(FileSort, "(Scandinavia)", $OtherFolder & "\Scandinavia", $Files[$f])
	  Call(FileSort, "(Austria)", $OtherFolder & "\Austria", $Files[$f])
	  Call(FileSort, "(Ireland)", $OtherFolder & "\Ireland", $Files[$f])
	  Call(FileSort, "(Israel)", $OtherFolder & "\Israel", $Files[$f])
	  Call(FileSort, "(Belgium", $OtherFolder & "\Belgium", $Files[$f])
	  Call(FileSort, "(Poland)", $OtherFolder & "\Poland", $Files[$f])
	  Call(FileSort, "(Latin America)", $OtherFolder & "\Latin America", $Files[$f])
	  Call(FileSort, "(Export)", $OtherFolder & "\Export", $Files[$f])
	  Call(FileSort, "(Unknown)", $OtherFolder & "\Unknown", $Files[$f])
   Next
EndIf

;~ CREATE SUBFOLDERS FOR MAIN REGION FOLDERS
$UsaCount = _FileListToArrayRec($UsaFolder, "*", 1, 0, 1, 2)
If IsArray($UsaCount) Then
   If $UsaCount[0] > $MainFolderFileCount Then
	  $Name="USA"
	  Call(FolderSort, $UsaFolder, $Name, $SubFolderMinimumFileCount)
   EndIf
Endif

$EuropeCount = _FileListToArrayRec($EuropeFolder, "*", 1, 0, 1, 2)
If IsArray($EuropeCount) Then
   If $EuropeCount[0] > $MainFolderFileCount Then
	  $Name="Europe"
	  Call(FolderSort, $EuropeFolder, $Name, $SubFolderMinimumFileCount)
   EndIf
Endif

$JapanCount = _FileListToArrayRec($JapanFolder, "*", 1, 0, 1, 2)
If IsArray($JapanCount) Then
   If $JapanCount[0] > $MainFolderFileCount Then
	  $Name="Japan"
	  Call(FolderSort, $JapanFolder, $Name, $SubFolderMinimumFileCount)
   EndIf
Endif

$RevisionCount = _FileListToArrayRec($RevisionFolder, "*", 1, 0, 1, 2)
If IsArray($RevisionCount) Then
   If $RevisionCount[0] > $MainFolderFileCount Then
	  $Name="Revisions"
	  Call(FolderSort, $RevisionFolder, $Name, $SubFolderMinimumFileCount)
   EndIf
Endif

$TranslationCount = _FileListToArrayRec($TranslationFolder, "*", 1, 0, 1, 2)
If IsArray($TranslationCount) Then
   If $TranslationCount[0] > $MainFolderFileCount Then
	  $Name="Translations"
	  Call(FolderSort, $TranslationFolder, $Name, $SubFolderMinimumFileCount)
   EndIf
Endif

$UnlicensedCount = _FileListToArrayRec($UnlicensedFolder, "*", 1, 0, 1, 2)
If IsArray($UnlicensedCount) Then
   If $UnlicensedCount[0] > $MainFolderFileCount Then
	  $Name="Unlicensed"
	  Call(FolderSort, $UnlicensedFolder, $Name, $SubFolderMinimumFileCount)
   EndIf
Endif

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
Func FolderSort($RomsFolder, $Name, $SubFolderMinimumFileCount)
;~ ITERATE THROUGH ALPHABET
For $i = 65 To 90
   $Character = (Chr($i))
   If $Character = "A" Then
	  $Folder = $RomsFolder & "\" & $Name & " - A"
	  DirCreate($Folder)
;~ MOVE NUMBERED FILES
	  $FileList = _FileListToArrayRec($RomsFolder, "0*;1*;2*;3*;4*;5*;6*;7*;8*;9*;'*", 1, 0, 1, 2)
	  If IsArray($FileList) Then
		 For $f = 1 To $FileList[0]
			FileMove($FileList[$f], $Folder)
		 Next
	  EndIf
   EndIf
;~ CHECK FILES COUNT
   $FileListCount = _FileListToArrayRec($Folder, "*", 1, 0, 1, 2)
   If IsArray($FileListCount) Then
	  If $FileListCount[0] > $SubFolderMinimumFileCount Then
;~ RENAME FOLDER
		 $LastChar = StringRegExpReplace($Folder, "^.*\\", "")
		 $LastChar = StringREplace($Lastchar, $Name & " - ","")
		 $PreviousChar = (Chr($i-1))
;~ RENAME ONLY IF CHAR IS DIFFERENT
		 If $LastChar<>$PreviousChar Then
			DirMove($Folder, $Folder & "-" & $PreviousChar)
		 EndIf
;~ CREATE NEW FOLDER
		 $Folder = $RomsFolder & "\" & $Name & " - " & $Character
		 DirCreate($Folder)
	  EndIf
   Endif
;~ MOVE FILES
   $FileList = _FileListToArrayRec($RomsFolder, $Character & "*", 1, 0, 1, 2)
   If IsArray($FileList) Then
	  For $f = 1 To $FileList[0]
		 FileMove($FileList[$f], $Folder)
	  Next
   EndIf
   If $Character = "Z" And $Folder <> ($RomsFolder & "\" & $Name & " - Z") Then
	  DirMove($Folder, $Folder & "-Z")
   EndIf
 Next
 EndFunc