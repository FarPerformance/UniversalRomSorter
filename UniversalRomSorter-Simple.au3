#include <Array.au3>
#include <File.au3>

If Not $CmdLine[0] Then Exit

;~ PARAMETERS
$TargetFolder=$CmdLine[1]
$FilesPerFolder=190
$MinFilesInFolder = 250

;~ DEFINE FOLDERS
$UsaFolder = $TargetFolder&"\1 USA"
$WorldFolder = $TargetFolder&"\1 USA"
$EuropeFolder = $TargetFolder&"\2 Europe"
$JapanFolder = $TargetFolder&"\2 Japan"
$OtherFolder = $TargetFolder&"\2 Other Regions"
$SegaCd32xFolder = $TargetFolder&"\3 Sega CD 32X"
$EnhancedSoundtrackFolder = $TargetFolder&"\3 Enhanced Soundtrack"
$BetaFolder = $TargetFolder&"\4 Betas & Protos"
$DemoFolder = $TargetFolder&"\4 Demos & Samples"
$ProgramFolder = $TargetFolder&"\4 Programs"
$UnlicensedFolder = $TargetFolder&"\4 Unlicensed"
$VideoFolder = $TargetFolder&"\4 Videos"
$BiosFolder = $TargetFolder&"\5 BIOS"

;~ SORT MAIN FOLDER
;~ GET FILES
$Files = _FileListToArrayRec($TargetFolder, "*", 1, 0, 1, 2)
If IsArray($Files) Then
   For $f = 1 To $Files[0]
;~ BIOS
	  Call(FileSort,"[BIOS]",$BiosFolder,$Files[$f])
	  Call(FileSort,"(Enhancement Chip)",$BiosFolder&"\Enhancement Chip",$Files[$f])
	  Call(FileSort,"(Channel)",$BiosFolder&"\Channel",$Files[$f])
	  Call(FileSort,"(System)",$BiosFolder&"\System",$Files[$f])
;~ VIDEOS
	  Call(FileSort,"Game Boy Advance Video",$VideoFolder,$Files[$f])
;~ UNLICENSED
	  Call(FileSort,"(Pirate)",$UnlicensedFolder,$Files[$f])
	  Call(FileSort,"(Unl)",$UnlicensedFolder,$Files[$f])
;~ BETAS
	  Call(FileSort,"(Beta",$BetaFolder&"\Betas",$Files[$f])
	  Call(FileSort,"(Debug",$BetaFolder&"\Betas",$Files[$f])
	  Call(FileSort,"(Proto",$BetaFolder&"\Protos",$Files[$f])
	  Call(FileSort,"Proto)",$BetaFolder&"\Protos",$Files[$f])
;~ DEMOS
	  Call(FileSort,"(Demo)",$DemoFolder&"\Demos",$Files[$f])
	  Call(FileSort,"(Kiosk",$DemoFolder&"\Demos",$Files[$f])
	  Call(FileSort,"(Sample",$DemoFolder&"\Samples",$Files[$f])
	  Call(FileSort,"(Promo",$DemoFolder&"\Samples",$Files[$f])
	  Call(FileSort,"Promo)",$DemoFolder&"\Samples",$Files[$f])
;~ PROGRAMS
	  Call(FileSort,"Program)",$ProgramFolder,$Files[$f])
;~ SEGA CD SPECIFIC
	  Call(FileSort,"(Brazil) (Sega CD 32X)",$SegaCd32xFolder&"\2 Other Regions\Brazil",$Files[$f])
	  Call(FileSort,"Sega CD 32X",$SegaCd32xFolder&"\1 USA",$Files[$f])
	  Call(FileSort,"Mega-CD 32X",$SegaCd32xFolder&"\2 Europe",$Files[$f])
	  Call(FileSort,"Enhanced Soundtrack Disc",$EnhancedSoundtrackFolder,$Files[$f])
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
	  Call(FileSort,"(Brazil",$OtherFolder&"\Brazil",$Files[$f])
	  Call(FileSort,"(Mexico)",$OtherFolder&"\Mexico",$Files[$f])
	  Call(FileSort,"(Asia)",$OtherFolder&"\Asia",$Files[$f])
	  Call(FileSort,"(Hong Kong)",$OtherFolder&"\Hong Kong",$Files[$f])
	  Call(FileSort,"(Taiwan)",$OtherFolder&"\Taiwan",$Files[$f])
	  Call(FileSort,"(Canada)",$OtherFolder&"\Canada",$Files[$f])
	  Call(FileSort,"(New Zealand)",$OtherFolder&"\New Zealand",$Files[$f])
	  Call(FileSort,"(Finland)",$OtherFolder&"\Finland",$Files[$f])
	  Call(FileSort,"(Greece)",$OtherFolder&"\Greece",$Files[$f])
	  Call(FileSort,"(Russia)",$OtherFolder&"\Russia",$Files[$f])
	  Call(FileSort,"(Norway)",$OtherFolder&"\Norway",$Files[$f])
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

;~ SORT UNLICENSED FOLDER
$Files = _FileListToArrayRec($UnlicensedFolder, "*", 1, 0, 1, 2)
If IsArray($Files) Then
   For $f = 1 To $Files[0]
;~ AFTERMARKET
	  Call(FileSort,"Aftermarket",$UnlicensedFolder&"\Aftermarket",$Files[$f])
	  Call(FileSort,"(Pirate)",$UnlicensedFolder&"\Pirate",$Files[$f])
   Next
EndIf

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