@echo off
rem ����
title   Git Working
cls 
goto :menu
pause
rem ѡ����
:menu
echo    ��ѡ��Ҫִ�еĲ�����Ȼ�󰴻س�����ȷ��Ϊgit���ȫ�ֱ���
echo ----------------------------------------
echo	1���ύ�����ļ�
echo	2��������һ���汾
echo	3����ת��ָ���汾
echo	4��������������������
echo	5���鿴
echo ----------------------------------------
set/p  f=  ��ѡ��
if "%f%"=="1" (goto all)
if "%f%"=="2" (goto backlast)
if "%f%"=="3" (goto setbanben)
if "%f%"=="4" (goto backwork)
if "%f%"=="5" (goto lookmenu)

:setbanben
echo ����������ύ�İ汾�š���q�������˳��鿴��
git log --pretty=oneline
echo ��ѡ����ת�İ汾��:
set/p  banben=  ������汾��ǰ5λ:
git reset --hard "%banben%"
goto :menu


:all
git add .
echo ���ڽ����ύ��...(����ȡ������ر�)
set/p  ca=  �������������ݣ�
git commit -m "%ca%"
echo ���ڽ��ж��ļ�����������...
Echo 
set/p  yd=  ��ѡ�� Y. ����Զ��            N. �˳���
rem ����Զ������
If  %yd%==Y ( git push origin master -f  ) else (goto :menu)
goto :menu

:backlast
set/p  yd= ȷ�Ϸ�����һ���汾�� Y. ȷ��            N.ȡ����
If  %yd%==Y (
git reset --hard HEAD^
goto :menu
) else (goto :menu)


:backwork
set/p  yd= ȷ�ϳ�����������������?�������޷��ָ�!!! Y. ȷ��            N.ȡ����
If  %yd%==Y ( 
git restore --staged .
echo ���ڳ���������...
git restore .
echo ���ڳ���������...
echo �����ɹ���
goto :menu
 ) else (goto :menu)

:setbanben
git reflog
goto :menu

:lookmenu
echo    Ŀ¼-�鿴
echo ----------------------------------------
echo	1���鿴��ǰ����״̬
echo	2���鿴������ύ��¼
echo	3���鿴���������¼
echo	5��������һ��
echo ----------------------------------------
set/p  ff=  ��ѡ��
if "%ff%"=="1" (goto :lookstatus)
if "%ff%"=="2" (goto :log)
if "%ff%"=="3" (goto :record1)

if "%ff%"=="5" (goto :menu)

:lookstatus
git status
goto :lookmenu

:log
git log
goto :lookmenu

:record1
git reflog
goto :lookmenu

