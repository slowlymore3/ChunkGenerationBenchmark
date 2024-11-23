Set objWMIService = GetObject("winmgmts:\\" & "." & "\root\CIMV2")
Set colOSItems = objWMIService.ExecQuery("SELECT * FROM Win32_OperatingSystem")

ram = "0"
For Each objOSItem In colOSItems
    ram = Int(objOSItem.FreePhysicalMemory/(1024*1024)*0.9)
Next
Set objFS = CreateObject("Scripting.FileSystemObject")
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
strFile = scriptDir & "\templates\start.template"
Set objFile = objFS.OpenTextFile(strFile)
Do Until objFile.AtEndOfStream
    strLine = objFile.ReadLine
        strLine = Replace(strLine,"minmem","-Xms"&ram&"G")
        strLine = Replace(strLine,"maxmem","-Xmx"&ram&"G")
    WScript.Echo strLine
Loop    