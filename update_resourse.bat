@echo off
@title "updating game resource..."

choice /c ync /m "Yes, No, or Continue..."

if errorlevel 2 goto NO
if errorlevel 1 goto YES

goto end

:YES

echo "upadating resource..."

rem resource path need to manually configure
set source_path=D:\Developer\Workspace\trunk\BDMoile\libs\package\ermj\v2.0.2\com.izhangxin.ermj.v2.0.2.android\assets\res01

if not exist assets\res01 (goto makedir) else (echo "res exist...")

rem if exist %source_path% (attrib *.* +a) else (echo "aaaaa")

rem attrib %source_path%\baseRes\config.plist -a

if exist %source_path% (if exist "assets\res01" (goto copyresuorse) else (echo "no resource folder found...")) else (echo "no resource found, please check path config...")

goto end

:makedir
mkdir assets\res01

:copyresuorse
xcopy %source_path% assets\res01\ /s /e

:NO
echo "cancel update..."
goto end

:end
@pause
