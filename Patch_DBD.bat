@echo off&PUSHD %~DP0 &TITLE Patch_DBD

>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

echo --------------------------------------------------------------------------
echo ���ű��ɸ�����¼�������� ��ǰ�汾Ϊ V1.1 (20200311)
echo.&echo ������� ��������
echo.&echo ���ű��ɡ�����֡�����͡������ǰɱ�����ʸߺ��������⣨Ҳ���ǹر�Ĭ�Ͽ���ݵ�Ч����
echo.&echo �ýű�ʧЧ������ GitHub ���ύ Issues
echo.
echo --------------------------------------------------------------------------
echo ������ʾ�ܾ����ʵĶ���û���Թ���Աģʽ����������
echo ��ر���Ϸ�����д˽ű����˽ű�������һ�Ρ���Ͳ����ٴ���
echo ԭ���Ƕ���Ϸ�����ļ� Engine.ini �ļ������޸ģ�Ҳ���������������Ľ���֡������Ȼ��򻯳ɽű�����
echo ����ԭ����������վ�����ҵ�
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo https://steamcommunity.com/sharedfiles/filedetails/?id=877701418
echo https://tieba.baidu.com/p/6177302348
echo https://tieba.baidu.com/p/6276493302
echo https://forum.deadbydaylight.com/en/discussion/136099/how-can-i-disable-anti-aliasing
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.&echo ���ڻ᲻�᡾��š���������֪�����������о����Ƿ�ʹ�øýű������ű�ֻ�Ǽ򻯲�����ʹ�ü�Ϊ��ͬ��е����ա�
echo.&echo �����ĳ��ֲ��ɿ�������ֱ�ӡ����Ͻǹرա��ű�����ɾ��,�ű����˲�û�н����κβ���
echo.
echo ---------------------------------------------------------------------------
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set file=%localappdata%\DeadByDaylight\Saved\Config\WindowsNoEditor\Engine.ini
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo ����������Ķ����������ݣ�����ͬ��������밴��ָʾ���룬���������Ķ��᡾���½ű��˳���
echo.&set /p option=������ Y Ȼ��س���������
if %option%==Y goto :Verify
if %option%==y goto :Verify
exit


:Verify
cls

echo.&echo ��Ϊ������֤,ּ�ڷ�ֹ���ֵ�,ϲ��UP�Ļ��ǵá������ע�����ҡ�һ������������
echo.&echo ���ڴ򿪵���ҳ���ҵ���������UP�ġ��ǳơ�Ȼ��س�,�ǳ�Ӧ��Ϊ��Сд���»���
choice /t 2 /d y /n >nul
explorer "https://space.bilibili.com/180659383"
echo.&set /p Nicename=
if %Nicename%==Ailiaili_ goto :Start
exit

:Start
cls

echo.&echo Ϊ��ʹ�ű�����ȫ�����ã��������ܡ���Ҫ���ѡ�� 1 �� 2 һ��ʹ��
echo --------------------------------------------------------------------------
echo.&echo ��ѡ��Ҫ������ѡ������ù�����ǰ�汾���������� 3 �����������ģ�
echo.&echo 1.����֡�� (Ҳ���ǽ���60֡)
echo.&echo 2.�����ǰɱ�����ʸߺ� (ȥ������ue4�Ŀ���ݣ�ʹ�����������ָ�ԭ�������ֻ���)
echo.&echo 3.�ָ�ԭʼ�ļ�
echo.&echo 0.�˳�
echo.&set /p choice=�������ֺ�س���

if %choice%==1 goto Unlock
if %choice%==2 goto Shut
if %choice%==3 goto Restore
if %choice%==0 goto End

:Unlock
cls

(echo.) >> %file%
(echo [/script/engine.engine]) >> %file%
(echo bSmoothFrameRate=false) >> %file%
(echo MinSmoothedFrameRate=5) >> %file%
(echo MaxSmoothedFrameRate=144) >> %file%
(echo bUseVSync=false) >> %file%

echo.&echo ���гɹ�,�Ѿ�����60֡��
echo.&echo �����ص�ѡ�����
choice /t 3 /d y /n >nul
goto Start

:Shut
cls

(echo.) >> %file%
(echo [/Script/Engine.GarbageCollectionSettings]) >> %file%
(echo r.DefaultFeature.Bloom=False) >> %file%
(echo r.DefaultFeature.AmbientOcclusion=False) >> %file%
(echo r.DefaultFeature.AmbientOcclusionStaticFraction=False) >> %file%
(echo r.DefaultFeature.MotionBlur=False) >> %file%
(echo r.DefaultFeature.LensFlare=False) >> %file%
(echo r.DefaultFeature.AntiAliasing=0) >> %file%

echo.&echo ���гɹ�,Up����������ϷΪ���ͻ���+�ر��Զ����������Եõ���������
echo.&echo �밴�������������֪��Ҫͬʱ�޸���Ϸ������
echo.&pause
echo.&echo ���ڻص�ѡ�����
goto Start

:Restore
cls

del /a /f /q %file%
(echo [Core.System]) >> %file%
(echo Paths=../../../Engine/Content) >> %file%
(echo Paths=%GAMEDIR%Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/VersionNumber/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Wwise/Content) >> %file%
(echo Paths=../../../Engine/Plugins/2D/Paper2D/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/ThirdParty/RedShellPlugin/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/OnlinePresence/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/MirrorsSdk/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/MirrorsAnalytics/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/Bhvr/MirrorsAnalytics/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/VersionNumber/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Wwise/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Editor/CryptoKeys/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Editor/MeshEditor/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Enterprise/DatasmithContent/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Media/MediaCompositing/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/Oculus/OculusVR/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/Steam/SteamVR/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/HoudiniEngine/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Enterprise/VariantManagerContent/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Experimental/RemoteSession/Content) >> %file%
echo.&echo �ָ����,�Ѿ����˵�������ʼ�ļ�������������������֤��Ϸ������
echo.&echo ���ڻص�ѡ�����
choice /t 3 /d y /n >nul
goto Start

:End
exit