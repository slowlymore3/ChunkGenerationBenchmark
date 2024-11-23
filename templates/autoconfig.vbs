Set objWMIService = GetObject("winmgmts:\\" & "." & "\root\CIMV2")
Set colItems = objWMIService.ExecQuery("SELECT * FROM Win32_Processor", "WQL", _
                                          wbemFlagReturnImmediately + wbemFlagForwardOnly)

processors = "0"
For Each objItem In colItems
  processors = objItem.NumberOfLogicalProcessors
Next

Set objFS = CreateObject("Scripting.FileSystemObject")
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
strFile = scriptDir & ".\paper-global.template"
Set objFile = objFS.OpenTextFile(strFile)
Do Until objFile.AtEndOfStream
    strLine = objFile.ReadLine
    If InStr(strLine,"worker-threads")> 0 Then
        strLine = Replace(strLine,"x",processors)
    End If 
    If InStr(strLine,"io-threads")> 0 Then
        strLine = Replace(strLine,"x",processors/4)
    End If 
    WScript.Echo strLine
Loop