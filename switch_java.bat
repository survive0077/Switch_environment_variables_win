@echo off

rem --- Base Config ����JDK�İ�װĿ¼---

:init

set JAVA_HOME_8=D:\Java\jdk1.8.0_333
set JAVA_HOME_17=D:\Java\jdk-17.0.1

::���������JDKĿ¼

:start

echo ��ǰJDK�汾:
java -version
echo.
echo ============================================= 
echo #############	JDK�汾�б�	#############
echo.                         
echo 		[1] �л���JDK1.8
echo 		[2] �л���JDK17
echo 		[3] ��������������˳�
echo.
echo ============================================= 
echo.

:select
set /p opt=��ѡ����Ҫ�л���JDK�汾��

if %opt%==1 (
	echo.
    echo �����л���JDK1.8
	set TARGET_JAVA_HOME=%JAVA_HOME_8%
)else if %opt%==2 (
	echo.
    echo �����л���JDK17
	set TARGET_JAVA_HOME=%JAVA_HOME_17%
)else (
	echo �˳�
    cmd.exe exit
)

echo ��ǰѡ���Java·��:%TARGET_JAVA_HOME%

wmic ENVIRONMENT where "name='JAVA_HOME'" delete

wmic ENVIRONMENT create name="JAVA_HOME",username="<SYSTEM>",VariableValue="%TARGET_JAVA_HOME%"

rem -- refresh env ---

echo.
echo �л��ɹ�!
echo.
echo ˢ��ϵͳ��������
refreshenv

echo ��ǰJDK�汾:
java -version
echo.
pause>null

@echo on