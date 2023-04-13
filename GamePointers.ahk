#SingleInstance force

SetWorkingDir %A_ScriptDir%
#include %A_ScriptDir%\json.ahk
#include %A_ScriptDir%\GameMemoryData.ahk

global AllPlatforms := {}
global SteamPointers := {}
global KartridgePointers := {}
global EGSPointers := {}
global CNEPointers := {}
global OfflineBetaPointers := {}
global BasicPointerObj := ""

;Writes beautified json (object) to a file (FileName)
WriteObjectToJSON( FileName, ByRef object )
{
    objectJSON := JSON.stringify( object )
    objectJSON := JSON.Beautify( objectJSON )
    FileDelete, %FileName%
    FileAppend, %objectJSON%, %FileName%
    return
}

BuildSteamPointers()
{
    #include %A_LineFile%\..\_Steam.ahk
}

BuildEGSPointers()
{
    #include %A_LineFile%\..\_EGS.ahk
}

BuildKartridgePointers()
{
    #include %A_LineFile%\..\_Kartridge.ahk
}

BuildOfflineBetaPointers()
{
    #include %A_LineFile%\..\_Beta.ahk
}

BuildCNEPointers()
{
    #include %A_LineFile%\..\_CNE.ahk
}

BuildPointers()
{
    BuildSteamPointers()
    BuildEGSPointers()
    BuildKartridgePointers()
    BuildCNEPointers()
    BuildOfflineBetaPointers()
}

BuildPointers()
AllPlatforms["Steam"] := SteamPointers
AllPlatforms["EGS"] := EGSPointers
AllPlatforms["Kartridge"] := KartridgePointers
AllPlatforms["CNE"] := CNEPointers
AllPlatforms["Beta"] := OfflineBetaPointers

WriteObjectToJSON( "PointerData.json", AllPlatforms )
OutputDebug, % "Done!"