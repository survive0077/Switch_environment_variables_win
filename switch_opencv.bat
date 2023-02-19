@echo off

rem --- Base Config 配置OpenCV的安装目录---

:init

set OPENCV_HOME_3=D:\opencv\opencv3.4.16\mingw_build\x64\mingw
set OPENCV_HOME_4=D:\opencv\opencv4.6.0\mingw_build\x64\mingw

::可添加其他OpenCV目录

:start

echo 当前OpenCV版本:
opencv_version
echo.
echo ============================================= 
echo #############	OpenCV版本列表	#############
echo.                         
echo 		[1] 切换至OpenCV3
echo 		[2] 切换至OpenCV4
echo 		[3] 输入其他任意键退出
echo.
echo ============================================= 
echo.

:select
set /p opt=请选择需要切换的OpenCV版本：

if %opt%==1 (
	echo.
    echo 即将切换至OpenCV3
	set TARGET_OPENCV_HOME=%OPENCV_HOME_3%
)else if %opt%==2 (
	echo.
    echo 即将切换至OpenCV4
	set TARGET_OPENCV_HOME=%OPENCV_HOME_4%
)else (
	echo 退出
    cmd.exe exit
)

echo 当前选择的OPENCV路径:%TARGET_OPENCV_HOME%

wmic ENVIRONMENT where "name='OPENCV_HOME'" delete

wmic ENVIRONMENT create name="OPENCV_HOME",username="<SYSTEM>",VariableValue="%TARGET_OPENCV_HOME%"

rem -- refresh env ---

echo.
echo 切换成功!
echo.
echo 刷新系统环境变量
refreshenv

echo 当前OpenCV版本:
opencv_version
echo.
pause>null

@echo on