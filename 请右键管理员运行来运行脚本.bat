@echo off
echo ------------------------------------------------------------------------
echo ���ű��ɸ�����¼��������  ��ǰ�汾ΪV1.0
echo.
echo ������� ��������
echo.
echo ���ű��ɡ�����֡�����͡������ǰɱ�����ʸߺ��������⣨Ҳ���ǹر�Ĭ�Ͽ���ݵ�Ч����
echo.
echo.
echo ��ر���Ϸ�����д˽ű�������һ�κ�Ͳ����ٴ���
echo.
echo ������ʾ�ܾ����ʵĶ���û���Թ���Աģʽ����������
echo.
echo.
echo ԭ���Ƕ���Ϸ�����ļ� Engine.ini �ļ������޸ģ�Ҳ���������������Ľ���֡������Ȼ��򻯳ɽű�����
echo.
echo ����ԭ����������վ�����ҵ�
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo https://steamcommunity.com/sharedfiles/filedetails/?id=877701418
echo.
echo https://tieba.baidu.com/p/6177302348
echo.
echo https://tieba.baidu.com/p/6276493302
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo ���ڻ᲻���ţ�����֪���������о����Ƿ�ʹ�øýű������ű�ֻ�Ǽ򻯲�����ʹ�ü�Ϊͬ��е�����
echo.
echo �����ĳ��ֲ��ɿ�������ֱ�����Ͻǹرսű�����ɾ��,�ű����˲�û���޸��κβ���
echo.
echo ------------------------------------------------------------------------
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set file=%localappdata%\DeadByDaylight\Saved\Config\WindowsNoEditor\Engine.ini
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


set /p option=����������Ķ����������ݣ�����ͬ�������������YȻ��س��������У����������Ķ��ᵼ�½ű��˳�
if %option%==Y goto :Verify
if %option%==y goto :Verify
exit


:Verify

echo.
echo ��Ϊ������֤,ּ�ڷ�ֹ���ֵ�,ϲ��UP�Ļ��ǵá������ע�����ҡ�һ������������
echo.
choice /t 1 /d y /n >nul
explorer "https://space.bilibili.com/180659383"
set /p Nicename=���ڴ򿪵���ҳ���ҵ���������UP�ġ��ǳơ���ȷ�ϼ�������,�ǳ�Ӧ��Ϊ��Сд���»���
if %Nicename%==Ailiaili_ goto :Start
exit

:Start
cls
echo.
echo ��ѡ��Ҫ������ѡ��
echo.
set /p choice=1.����֡��  2.�����ǰɱ�����ʸߺ�  3.�ָ�ԭʼ�ļ� 4.�˳� 
echo.
if %choice%==1 goto Unlock
if %choice%==2 goto Shut
if %choice%==3 goto Restore
if %choice%==4 goto End

:Unlock

echo.
(echo.) >> %file%
(echo [/script/engine.engine]) >> %file%
(echo bSmoothFrameRate=false) >> %file%
(echo MinSmoothedFrameRate=5) >> %file%
(echo MaxSmoothedFrameRate=144) >> %file%
(echo bUseVSync=false) >> %file%
echo ���гɹ�,�ص�ѡ�����
choice /t 2 /d y /n >nul
goto Start

:Shut

echo.
(echo.) >> %file%
(echo [/Script/Engine.RendererOverrideSettings]) >> %file%
(echo r.DefaultFeature.Bloom=False) >> %file%
(echo r.DefaultFeature.AmbientOcclusion=False) >> %file%
(echo r.DefaultFeature.AmbientOcclusionStaticFraction=False) >> %file%
(echo r.DefaultFeature.MotionBlur=False) >> %file%
(echo r.DefaultFeature.LensFlare=False) >> %file%
(echo r.DefaultFeature.AntiAliasing=0) >> %file%
echo ���гɹ�,Up����������ϷΪ���ͻ���+�ر��Զ����������Եõ���������
echo.
pause
echo ���ڻص�ѡ�����
goto Start

:Restore

echo.
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
echo �ָ����,�ص�ѡ�����
choice /t 2 /d y /n >nul
goto Start

:End
exit