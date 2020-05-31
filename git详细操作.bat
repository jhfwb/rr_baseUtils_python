@echo off
rem 标题
title   Git Working
cls 
goto :menu
pause
rem 选择函数
:menu
echo    请选择要执行的操作，然后按回车。请确保为git添加全局变量
echo ----------------------------------------
echo	1，提交所有文件
echo	2，返回上一个版本
echo	3，跳转到指定版本
echo	4，撤销工作区及缓存区
echo	5，查看
echo ----------------------------------------
set/p  f=  请选择：
if "%f%"=="1" (goto all)
if "%f%"=="2" (goto backlast)
if "%f%"=="3" (goto setbanben)
if "%f%"=="4" (goto backwork)
if "%f%"=="5" (goto lookmenu)

:setbanben
echo 以下是最近提交的版本号。按q。可以退出查看！
git log --pretty=oneline
echo 请选择跳转的版本号:
set/p  banben=  请输入版本号前5位:
git reset --hard "%banben%"
goto :menu


:all
git add .
echo 正在进行提交中...(如需取消，请关闭)
set/p  ca=  请输入描述内容：
git commit -m "%ca%"
echo 正在进行对文件进行描述中...
Echo 
set/p  yd=  请选择 Y. 推送远程            N. 退出：
rem 推送远程命令
If  %yd%==Y ( git push origin master -f  ) else (goto :menu)
goto :menu

:backlast
set/p  yd= 确认返回上一个版本？ Y. 确认            N.取消：
If  %yd%==Y (
git reset --hard HEAD^
goto :menu
) else (goto :menu)


:backwork
set/p  yd= 确认撤销工作区所有内容?撤销后无法恢复!!! Y. 确认            N.取消：
If  %yd%==Y ( 
git restore --staged .
echo 正在撤销缓存区...
git restore .
echo 正在撤销工作区...
echo 撤销成功！
goto :menu
 ) else (goto :menu)

:setbanben
git reflog
goto :menu

:lookmenu
echo    目录-查看
echo ----------------------------------------
echo	1，查看当前工作状态
echo	2，查看最近的提交记录
echo	3，查看最近操作记录
echo	5，返回上一级
echo ----------------------------------------
set/p  ff=  请选择：
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

