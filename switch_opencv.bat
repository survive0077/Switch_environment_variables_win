@echo off

rem --- Base Config ����OpenCV�İ�װĿ¼---

:init

set OPENCV_HOME_3=D:\opencv\opencv3.4.16\mingw_build\x64\mingw
set OPENCV_HOME_4=D:\opencv\opencv4.6.0\mingw_build\x64\mingw

::���������OpenCVĿ¼

:start

echo ��ǰOpenCV�汾:
opencv_version
echo.
echo ============================================= 
echo #############	OpenCV�汾�б�	#############
echo.                         
echo 		[1] �л���OpenCV3
echo 		[2] �л���OpenCV4
echo 		[3] ��������������˳�
echo.
echo ============================================= 
echo.

:select
set /p opt=��ѡ����Ҫ�л���OpenCV�汾��

if %opt%==1 (
	echo.
    echo �����л���OpenCV3
	set TARGET_OPENCV_HOME=%OPENCV_HOME_3%
)else if %opt%==2 (
	echo.
    echo �����л���OpenCV4
	set TARGET_OPENCV_HOME=%OPENCV_HOME_4%
)else (
	echo �˳�
    cmd.exe exit
)

echo ��ǰѡ���OPENCV·��:%TARGET_OPENCV_HOME%

wmic ENVIRONMENT where "name='OPENCV_HOME'" delete

wmic ENVIRONMENT create name="OPENCV_HOME",username="<SYSTEM>",VariableValue="%TARGET_OPENCV_HOME%"

rem -- refresh env ---

echo.
echo �л��ɹ�!
echo.
echo ˢ��ϵͳ��������
refreshenv

echo ��ǰOpenCV�汾:
opencv_version
echo.
pause>null

@echo on