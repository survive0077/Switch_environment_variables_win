@echo off

::���벻ͬPATH�޸Ķ�Ӧ��batĿ¼
cd E:\batproject\

rem --- Base Config ���ÿɸı��PATHĿ¼---

:start

echo �ɹ��޸ĵ�PATHĿ¼:
echo.
echo ============================================== 
echo ############# �ɹ��޸ĵ�PATHĿ¼ #############
echo.                         
echo 		[1] Java
echo 		[2] OpenCV
echo 		[3] ��������������˳�
echo.
echo ==============================================
echo.

:select
set /p opt=��ѡ����Ҫ�޸ĵ�PATH��

if %opt%==1 (
	echo.
    echo ����Java�޸�ģʽ
	echo.
	call switch_java.bat
)else if %opt%==2 (
	echo.
    echo ����OpenCV�޸�ģʽ
	echo.
	call switch_opencv.bat
)else (
	echo �˳�
    cmd.exe exit
)