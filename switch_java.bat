@echo off

rem --- Base Config 配置JDK的安装目录---

:init

set JAVA_HOME_8=D:\Java\jdk1.8.0_333
set JAVA_HOME_17=D:\Java\jdk-17.0.1

::可添加其他JDK目录

:start

echo 当前JDK版本:
java -version
echo.
echo ============================================= 
echo #############	JDK版本列表	#############
echo.                         
echo 		[1] 切换至JDK1.8
echo 		[2] 切换至JDK17
echo 		[3] 输入其他任意键退出
echo.
echo ============================================= 
echo.

:select
set /p opt=请选择需要切换的JDK版本：

if %opt%==1 (
	echo.
    echo 即将切换至JDK1.8
	set TARGET_JAVA_HOME=%JAVA_HOME_8%
)else if %opt%==2 (
	echo.
    echo 即将切换至JDK17
	set TARGET_JAVA_HOME=%JAVA_HOME_17%
)else (
	echo 退出
    cmd.exe exit
)

echo 当前选择的Java路径:%TARGET_JAVA_HOME%

wmic ENVIRONMENT where "name='JAVA_HOME'" delete

wmic ENVIRONMENT create name="JAVA_HOME",username="<SYSTEM>",VariableValue="%TARGET_JAVA_HOME%"

rem -- refresh env ---

echo.
echo 切换成功!
echo.
echo 刷新系统环境变量
refreshenv

echo 当前JDK版本:
java -version
echo.
pause>null

@echo on