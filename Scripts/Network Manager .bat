@echo off
  
 title Windows ������Խű�����

rem ��ȡ����ԱȨ��
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
  
 :allstart
  
 cls
  echo       ������������������������������������������������������������������������������������������������������������������������������������������������
  echo       ��                                                                      ��
  echo       ��                       Windows ��������Խű�                       ��
  echo       ��                Windows Network Inspection Test Script                ��
  echo       ��                                                                      ��
  echo       ��                                    https://www.dreamstart.site       ��
  echo       ��                                                                      ��
  echo       ������������������������������������������������������������������������������������������������������������������������������������������������
  echo       ��       --------------------------------------------------------       ��
  echo       ��                                                                      ��
  echo       ��       ����������ѡ�� Enter the System Identification Nnumber :       ��
  echo       ��                                                                      ��
  echo       ��       1) �Զ������������                                            ��
  echo       ��                                                                      ��
  echo       ��       2) �ֶ���⴦������                                            ��
  echo       ��                                                                      ��
  echo       ��       3) ����Windows                                                 ��
  echo       ��                                                                      ��
  echo       ��                                                                      ��
  echo       ��       0) Exit                                                        ��
  echo       ��                                                                      ��
  echo       ��       --------------------------------------------------------       ��
  echo       ������������������������������������������������������������������������������������������������������������������������������������������������
  
 set in=
  
 set /p in=������:
  
 if "%in%"=="1" goto autonetwork
  
 if "%in%"=="2" goto networktest
  
 if "%in%"=="3" goto reboot
  
 if "%in%"=="0" goto allclose
  
rem �Զ������������ 
:autonetwork
rem cd/d %~dp0
cd %TEMP%
SET SJ=%RANDOM%/327
if not exist "folder\log\networkrn\" (MD folder\log\networkrn\)
set log=folder\log\networkrn\%date:~0,3%%date:~5,2%%date:~8,2%%sj%.log
@mode con lines=32 cols=100
rem ���͵�ַ
set ip1=127.0.0.1
rem ip��ַ

for /f "tokens=16" %%i in ('ipconfig ^|find /i "ipv4"') do set ip2=%%i
if "%ip2%"=="" (goto xp1) else goto 2
:xp1
for /f "tokens=15 " %%i in ('ipconfig ^|find /i "ipv4"') do (
set ip2=%%i
if "%ip2%"=="" (goto xp2) else goto 2
)
:xp2
for /f "tokens=15 " %%i in ('ipconfig ^|find /i "IP Address"') do set ip2=%%i
rem ���ص�ַ
:2
for /f "tokens=2 delims=:" %%i in ('ipconfig^|findstr Ĭ������') do set ip3=%%i
if "%ip3%"=="" (goto xpwg) else goto 3
:xpwg
for /f "tokens=2 delims=:" %%i in ('ipconfig^|findstr Gateway') do set ip3=%%i 
if "%ip3%"=="" (goto debug3) else goto 3
:3
cls
rem ������ַ
rem �ҵķ�������ַ
set ip4=10000.gd.cn
set ip5=www.baidu.com
rem ���������
echo.
echo                                  networkrn
echo.
echo                           ������������������������
echo.
echo                            ���͵�ַ:%ip1%
echo.
echo                            ������ַ:%ip2%
echo.
echo                            ���ص�ַ:%ip3%
echo.
echo                            �㶫����:%ip4%
echo.
echo                            ������ַ:%ip5%
echo.
echo                          ��������������������������
echo.
Ping/n 3 127.0.0.1 > NUL 
echo ��ʼ����
cls
echo log:[%time%]startting
echo log:[%time%]pinging %ip1%
ping %ip1% > NUL
if errorlevel 1 (set test1=��  & goto xs) else set test1=�� 
echo log:[%time%]pinging %ip1%:%test1%


echo log:[%time%]pinging %ip2%
ping %ip2% > nul
if errorlevel 1 (set test2=��  & goto xs) else set test2=��
echo [%time%]pinging %ip2%:%test1%

echo log:[%time%]pinging %ip3%
ping %ip3% > NUL
if errorlevel 1 (set test3=��  & goto xs) else set test3=��
echo log:[%time%]pinging %ip1%:%test1%

echo log:[%time%]pinging %ip4%
ping %ip4% > NUL
if errorlevel 1 (set test4=��  & goto xs) else set test4=��
echo log:[%time%]pinging %ip4%:%test1%

echo log:[%time%]pinging %ip5%
ping %ip5% > nul
if errorlevel 1 (set test5=��  & goto xs) else set test5=��
echo log:[%time%]pinging %ip5%:%test1%
:xs
if "%test1%"=="" (set test1=?)
if "%test2%"=="" (set test2=?)
if "%test3%"=="" (set test3=?)
if "%test4%"=="" (set test4=?)
if "%test5%"=="" (set test5=?)
cls
echo �̴���ɹ�
echo ������ʧ��
echo ? ����δ����
echo                        ���Խ��
echo ��������������������������������������������������
echo.
echo                      ���͵�ַ:%test1%            
echo.
echo                      ������ַ:%test2%            
echo.
echo                      ��������:%test3%           
echo.
echo                      �㶫����:%test4%
echo.
echo                      ������ַ:%test5%                  
echo.
echo ��������������������������������������������������
if %test1%==��  (goto hs)
if %test2%==��  (goto bip)
if %test3%==��  (goto wg)
if %test4%==��  (goto gw)
if %test5%==��  (goto ww)
goto 3
:hs
if exist "failed1.txt" (del failed1.txt & echo ������Ȼ����)
echo.
echo ��������������������������������������������������
echo.
echo �����������⣨PING��ͨ���͵�ַ��
echo ���������
echo IP��ջ���ϣ������װTCP/IPЭ��
pause
goto allstart

:bip
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
echo.
echo �����������⣨PING��ͨ����IP��
echo.
echo ��������������������������������������������������
echo ���⵼��ԭ��
echo ������������������MODEM������
echo ���������
echo 1.������������Ƿ�����
echo 2.��IP��ַ����Ϊ�Զ�
pause
goto allstart

:wg
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
if exist "failed2.txt" (del failed2.txt & echo ���޸��޷�pingͨ����ip����)
echo.
echo �����������⣨PING��ͨ�������أ�
echo.
echo ��������������������������������������������������
echo ���ܵ��µ�ԭ��
echo 1.IP��ַ�������⣬����IP��ͻ
echo 2.�������ϣ������豸��ʱ̫��
echo ���������
echo 1.����IP�Զ�����
echo 2.��ϵ�������Ա
pause
goto allstart

:gw
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
if exist "failed2.txt" (del failed2.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed3.txt" (del failed3.txt & echo ���޸��޷�pingͨ����ip����)
echo.
echo �����������⣨PING��ͨ������
echo.
echo ��������������������������������������������������
echo ���ܵ��µ�ԭ��
echo 1.�����������⣨LSP���⣩
echo 2.��è�쳣��ISP���⣩
echo 3.�����жϣ�ISP���⣩
echo ���������
echo 1.����LSP: ����ԱȨ������CMD��ִ��netsh winsock reset
echo   �������Ա���������LSP
echo 2.����è���ź��Ƿ���������ɫ����������ɫ�����ź��쳣��
echo 3.��ϵ���繩Ӧ�̣��й����ţ�
pause
goto allstart

:ww
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
if exist "failed2.txt" (del failed2.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed3.txt" (del failed3.txt & echo ���޸��޷�pingͨ����ip����)
echo.
echo �����������⣨PING��ͨ�ٶȣ�
echo.
echo ��������������������������������������������������
echo ���ܵ��µ�ԭ��
echo �����������⣨DNS��LSP���⣩
echo ���������
echo 1.����LSP: ����ԱȨ������CMD��ִ��netsh winsock reset
echo   �������Ա���������LSP
echo 2.��ϵ���繩Ӧ�̣��й����ţ�
pause
goto allstart

:3
if exist "failed1.txt" (del failed1.txt & echo ���޸��޷�pingͨ���͵�ַ��ַ����)
if exist "failed2.txt" (del failed2.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed3.txt" (del failed3.txt & echo ���޸��޷�pingͨ����ip����)
if exist "failed4.txt" (del failed4.txt & echo ���޸��޷�pingͨ��������)
echo.
echo �������������û�з������⡭��
echo.
echo ��������������������������������������������������
echo ��������޷����������飺
echo 1.������ʱ���Ƿ���ȷ������ʱ�ӣ��޸ĵ���ʱ��
echo 2.����LSP: ����ԱȨ������CMD��ִ��netsh winsock reset
echo   �������Ա���������LSP
echo 3.���hosts��C:\Windows\System32\drivers\etc\hosts)
echo 4.����IP��DNS�Զ���ȡ
echo 5.������ɣ�������Ȼ���ڣ�����ϵ�������Ա
pause
goto allstart
  
rem �ֶ������������ 
  
:networktest
 cls
  echo       ������������������������������������������������������������������������������������������������������������������������������������������������
  echo       ��                                                                      ��
  echo       ��                       Windows �ֶ����в�������                       ��
  echo       ��                Windows Network Inspection Test Script                ��
  echo       ��                                                                      ��
  echo       ��                                    https://www.dreamstart.site       ��
  echo       ��                                                                      ��
  echo       ������������������������������������������������������������������������������������������������������������������������������������������������
  echo       ��       --------------------------------------------------------       ��
  echo       ��                                                                      ��
  echo       ��       ����������ѡ�� Enter the System Identification Nnumber :       ��
  echo       ��                                                                      ��
  echo       ��       [1] �������(192.168.1.1) [����5�����ݰ�]                      ��
  echo       ��                                                                      ��
  echo       ��       [2] ���Ŀ������ɴ��� [����5�����ݰ�]                         ��
  echo       ��                                                                      ��
  echo       ��       [3] ���·��·�� [Tracert IP/����]                             ��
  echo       ��                                                                      ��
  echo       ��       [4] ����������ѯ��nslookup ������                              ��
  echo       ��                                                                      ��
  echo       ��       [5] ����TCP/IPЭ��ӿڣ�LSP��                                  ��
  echo       ��                                                                      ��
  echo       ��       [6] �������DNS����                                            ��
  echo       ��                                                                      ��
  echo       ��                                                                      ��
  echo       ��       0) ������һ��                                                  ��
  echo       ��                                                                      ��
  echo       ��       --------------------------------------------------------       ��
  echo       ������������������������������������������������������������������������������������������������������������������������������������������������

set /p s=��������Ҫ�Ĺ���:

if %s%==1 goto A

if %s%==2 goto B

if %s%==3 goto T

if %s%==4 goto H

if %s%==5 goto K

if %s%==6 goto C

if %s%==0 goto allstart

cls
echo �����������!
goto networktest

:A
ping.exe 192.168.1.1 -n 5
cls
goto networktest

:B
set /p w=��������ҪPING��������IP��ַ��
ping.exe %w%  -n 5
ping -n 3 127.1 >nul
cls
goto networktest

:T
set /p d=��������ҪTracert��������IP��ַ��
tracert %d%
ping -n 3 127.1 >nul
cls
goto networktest

:H
set /p c=��������Ҫ��ѯ��������
nslookup %c%
ping -n 3 127.1 >nul
goto networktest

:K
echo ��������TCP/IPЭ��ӿڣ�LSP��......
netsh winsock reset
ping -n 3 127.1 >nul
goto networktest

:C
echo �������DNS����......
ipconfig /flushdns
ping -n 3 127.1 >nul
goto networktest




rem ����Windows
  
:reboot
echo ���ڽ������������Ժ󡭡�
shutdown.exe /r -t 0
goto allclose
 

:allclose
echo ��������˳�
pause
exit#########