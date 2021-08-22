#include <Array.au3>
#include <File.au3>
$TargetFolder=$CmdLine[1]
$FilesPerFolder=190
$MinFilesInFolder = 250

;~ DEFINE FOLDERS
$UsaFolder = $TargetFolder&"\1 USA"
$WorldFolder = $TargetFolder&"\1 USA"
$EuropeFolder = $TargetFolder&"\2 Europe"
$JapanFolder = $TargetFolder&"\2 Japan"
$OtherFolder = $TargetFolder&"\2 Other Regions"
$UnlicensedFolder = $TargetFolder&"\2 Unlicensed"
$NintendoPowerFolder = $TargetFolder&"\3 Nintendo Power"
$ArcadeFolder = $TargetFolder&"\3 Super System Arcade"
$VcFolder = $TargetFolder&"\3 Virtual Console"
$SegaChannelFolder = $TargetFolder&"\3 Sega Channel"
$SegaCd32xFolder = $TargetFolder&"\3 Sega CD 32X"
$EnhancedSoundtrackFolder = $TargetFolder&"\3 Enhanced Soundtrack"
$BetaFolder = $TargetFolder&"\4 Betas & Protos"
$DemoFolder = $TargetFolder&"\4 Demos & Samples"
$ProgramFolder = $TargetFolder&"\4 Programs"
$RevisionFolder = $TargetFolder&"\4 Revisions"
$VideoFolder = $TargetFolder&"\4 Videos"
$BiosFolder = $TargetFolder&"\5 BIOS"

;~ GET FILES
$Files = _FileListToArrayRec($TargetFolder, "*", 1, 0, 1, 2)
If IsArray($Files) Then
   For $f = 1 To $Files[0]
;~ BIOS
	  Call(FileSort,"[BIOS]",$BiosFolder,$Files[$f])
	  Call(FileSort,"(Enhancement Chip)",$BiosFolder&"\Enhancement Chip",$Files[$f])
;~ REVISIONS
	  Call(FileSort,"(Rev",$RevisionFolder,$Files[$f])
	  Call(FileSort,"(Alt",$RevisionFolder,$Files[$f])
	  Call(FileSort,"Alt)",$RevisionFolder,$Files[$f])
;~ SEGA CD SPECIFIC
	  Call(FileSort,"(Brazil) (Sega CD 32X)",$SegaCd32xFolder&"\2 Other Regions\Brazil",$Files[$f])
	  Call(FileSort,"Sega CD 32X",$SegaCd32xFolder&"\1 USA",$Files[$f])
	  Call(FileSort,"Mega-CD 32X",$SegaCd32xFolder&"\2 Europe",$Files[$f])
	  Call(FileSort,"Enhanced Soundtrack Disc",$EnhancedSoundtrackFolder,$Files[$f])
;~ BETAS
	  Call(FileSort,"(Beta",$BetaFolder&"\Beta",$Files[$f])
	  Call(FileSort,"(Proto",$BetaFolder&"\Proto",$Files[$f])
	  Call(FileSort,"Proto)",$BetaFolder&"\Proto",$Files[$f])
	  Call(FileSort,"(Debug",$BetaFolder&"\Debug",$Files[$f])
;~ UNLICENSED
	  Call(FileSort,"(Aftermarket)",$UnlicensedFolder&"\Aftermarket",$Files[$f])
	  Call(FileSort,"(Pirate)",$UnlicensedFolder&"\Pirate",$Files[$f])
	  Call(FileSort,"(Unl)",$UnlicensedFolder,$Files[$f])
;~ PROGRAMS
	  Call(FileSort,"Program)",$ProgramFolder,$Files[$f])
;~ DEMOS
	  Call(FileSort,"(Demo)",$DemoFolder&"\Demo",$Files[$f])
	  Call(FileSort,"(Kiosk)",$DemoFolder&"\Kiosk",$Files[$f])
	  Call(FileSort,"(Sample",$DemoFolder&"\Sample",$Files[$f])
	  Call(FileSort,"(Promo",$DemoFolder&"\Promo",$Files[$f])
	  Call(FileSort,"Promo)",$DemoFolder&"\Promo",$Files[$f])
;~ NINTENDO
	  Call(FileSort,"Virtual Console",$VcFolder,$Files[$f])
	  Call(FileSort,"Switch Online",$VcFolder,$Files[$f])
	  Call(FileSort,"Game Boy Advance Video",$VideoFolder,$Files[$f])
	  Call(FileSort,"(Arcade)",$ArcadeFolder,$Files[$f])
	  Call(FileSort,"(NP)",$NintendoPowerFolder,$Files[$f])
;~ SEGA
	  Call(FileSort,"(Sega Channel)",$SegaChannelFolder,$Files[$f])
	  Call(FileSort,"(SegaNet)",$SegaChannelFolder&"\SegaNet",$Files[$f])
;~ MAIN REGIONS
	  Call(FileSort,"(USA",$UsaFolder,$Files[$f])
	  Call(FileSort,", USA",$UsaFolder,$Files[$f])
	  Call(FileSort,"(World",$UsaFolder,$Files[$f])
	  Call(FileSort,"(Europe",$EuropeFolder,$Files[$f])
	  Call(FileSort,", Europe",$EuropeFolder,$Files[$f])
	  Call(FileSort,"(Japan",$JapanFolder,$Files[$f])
;~ OTHER REGIONS
	  Call(FileSort,"(Germany)",$OtherFolder&"\Germany",$Files[$f])
	  Call(FileSort,"(Italy)",$OtherFolder&"\Italy",$Files[$f])
	  Call(FileSort,"(Spain)",$OtherFolder&"\Spain",$Files[$f])
	  Call(FileSort,"(France)",$OtherFolder&"\France",$Files[$f])
	  Call(FileSort,"(China)",$OtherFolder&"\China",$Files[$f])
	  Call(FileSort,"(Korea)",$OtherFolder&"\Korea",$Files[$f])
	  Call(FileSort,"(Australia)",$OtherFolder&"\Australia",$Files[$f])
	  Call(FileSort,"(United Kingdom",$OtherFolder&"\United Kingdom",$Files[$f])
	  Call(FileSort,"(Netherlands)",$OtherFolder&"\Netherlands",$Files[$f])
	  Call(FileSort,"(Denmark)",$OtherFolder&"\Denmark",$Files[$f])
	  Call(FileSort,"(Sweden)",$OtherFolder&"\Sweden",$Files[$f])
	  Call(FileSort,"(Brazil)",$OtherFolder&"\Brazil",$Files[$f])
	  Call(FileSort,"(Mexico)",$OtherFolder&"\Mexico",$Files[$f])
	  Call(FileSort,"(Asia)",$OtherFolder&"\Asia",$Files[$f])
	  Call(FileSort,"(Hong Kong)",$OtherFolder&"\Hong Kong",$Files[$f])
	  Call(FileSort,"(Taiwan)",$OtherFolder&"\Taiwan",$Files[$f])
	  Call(FileSort,"(Canada)",$OtherFolder&"\Canada",$Files[$f])
	  Call(FileSort,"(New Zealand)",$OtherFolder&"\New Zealand",$Files[$f])
	  Call(FileSort,"(Finland)",$OtherFolder&"\Finland",$Files[$f])
	  Call(FileSort,"(Unknown)",$OtherFolder&"\Unknown",$Files[$f])
   Next
EndIf

;~ CREATE SUBFOLDERS FOR MAIN REGION FOLDERS
$UsaCount = _FileListToArrayRec($UsaFolder, "*", 1, 0, 1, 2)
If IsArray($UsaCount) Then
   If $UsaCount[0] > $MinFilesInFolder Then
	  $Name="USA"
	  Call(FolderSort,$UsaFolder,$Name,$FilesPerFolder)
   EndIf
Endif

$EuropeCount = _FileListToArrayRec($EuropeFolder, "*", 1, 0, 1, 2)
If IsArray($EuropeCount) Then
   If $EuropeCount[0] > $MinFilesInFolder Then
	  $Name="Europe"
	  Call(FolderSort,$EuropeFolder,$Name,$FilesPerFolder)
   EndIf
Endif

$JapanCount = _FileListToArrayRec($JapanFolder, "*", 1, 0, 1, 2)
If IsArray($JapanCount) Then
   If $JapanCount[0] > $MinFilesInFolder Then
	  $Name="Japan"
	  Call(FolderSort,$JapanFolder,$Name,$FilesPerFolder)
   EndIf
Endif

;~ FUNCTIONS
;~ FILESORT
Func FileSort($Filter,$Folder,$FullName)
   If FileExists($FullName) And StringInStr($FullName,$Filter) Then
	  If Not FileExists($Folder) Then
		 DirCreate($Folder)
	  Endif
	  FileMove($FullName,$Folder)
   EndIf
EndFunc

;~ FOLDERSORT
Func FolderSort($TargetFolder,$Name,$FilesPerFolder)
;~ ITERATE THROUGH ALPHABET
For $i = 65 To 90
   $Character=(Chr($i))
   If $Character = "A" Then
	  $Folder=$TargetFolder&"\"&$Name&" - A"
	  DirCreate($Folder)
;~ MOVE NUMBERED FILES
	  $FileList = _FileListToArrayRec($TargetFolder, "0*;1*;2*;3*;4*;5*;6*;7*;8*;9*;'*", 1, 0, 1, 2)
	  If IsArray($FileList) Then
		 For $f = 1 To $FileList[0]
			FileMove($FileList[$f],$Folder)
		 Next
	  EndIf
   EndIf
;~ CHECK FILES COUNT
   $FileListCount = _FileListToArrayRec($Folder, "*", 1, 0, 1, 2)
   If IsArray($FileListCount) Then
	  If $FileListCount[0] > $FilesPerFolder Then
;~ RENAME FOLDER
		 $LastChar=StringRegExpReplace($Folder, "^.*\\", "")
		 $LastChar=StringREplace($Lastchar,$Name&" - ","")
		 $PreviousChar=(Chr($i-1))
;~ RENAME ONLY IF CHAR IS DIFFERENT
		 If $LastChar<>$PreviousChar Then
			DirMove($Folder,$Folder&"-"&$PreviousChar)
		 EndIf
;~ CREATE NEW FOLDER
		 $Folder=$TargetFolder&"\"&$Name&" - "&$Character
		 DirCreate($Folder)
	  EndIf
   Endif
;~ MOVE FILES
   $FileList = _FileListToArrayRec($TargetFolder, $Character&"*", 1, 0, 1, 2)
   If IsArray($FileList) Then
	  For $f = 1 To $FileList[0]
		 FileMove($FileList[$f],$Folder)
	  Next
   EndIf
   If $Character = "Z" Then
	  DirMove($Folder,$Folder&"-Z")
	EndIf
 Next
 EndFunc