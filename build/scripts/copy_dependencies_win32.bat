@echo off
cd ..
mkdir "bin\panda3d\"
mkdir "bin\user"
COPY "S:\Panda3D\Panda3D4TIA\bin\*.dll" "bin\panda3d\"
COPY "S:\Panda3D\Panda3D4TIA\panda3d\*.pyd" "bin\panda3d\"
COPY "S:\Panda3D\Panda3D4TIA\python\DLLs\*" "bin\"
COPY "S:\Panda3D\Panda3D4TIA\python\python39.dll" "bin\"
COPY "..\user\*" "bin\"
DEL "bin\_msi.pyd"
DEL "bin\python_lib.cat"
DEL "bin\python_tools.cat"
DEL "bin\py.ico"
DEL "bin\pyc.ico"
DEL "bin\pyd.ico"
DEL "bin\sqlite3.dll"
DEL "bin\_sqlite3.pyd"
DEL "bin\winsound.pyd"
PAUSE
