@echo off

::进入不同PATH修改对应子bat目录
cd E:\batproject\

rem --- Base Config 配置可改变的PATH目录---

:start

echo 可供修改的PATH目录:
echo.
echo ============================================== 
echo ############# 可供修改的PATH目录 #############
echo.                         
echo 		[1] Java
echo 		[2] OpenCV
echo 		[3] 输入其他任意键退出
echo.
echo ==============================================
echo.

:select
set /p opt=请选择需要修改的PATH：

if %opt%==1 (
	echo.
    echo 进入Java修改模式
	echo.
	call switch_java.bat
)else if %opt%==2 (
	echo.
    echo 进入OpenCV修改模式
	echo.
	call switch_opencv.bat
)else (
	echo 退出
    cmd.exe exit
)