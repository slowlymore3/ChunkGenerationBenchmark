powershell -nologo -noprofile -command "Invoke-WebRequest https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_windows-x64_bin.zip -OutFile graalvm.zip"
powershell -nologo -noprofile -command "Expand-Archive -Literalpath "$pwd\graalvm.zip" -DestinationPath "$pwd"
powershell -nologo -noprofile -command "Get-ChildItem "graalvm-*" | Rename-Item -NewName "graalvm"
powershell -nologo -noprofile -command "Remove-Item "$pwd\graalvm.zip""
powershell -nologo -noprofile -command "Invoke-WebRequest https://api.papermc.io/v2/projects/paper/versions/1.21.3/builds/44/downloads/paper-1.21.3-44.jar -OutFile paper.jar"
powershell -nologo -noprofile -command "Get-ChildItem "$pwd\templates\Run-Test.template" | Move-Item -Destination "$pwd\RunTest.bat""
powershell -nologo -noprofile -command "Remove-Item "$pwd\Setup.bat""
pause