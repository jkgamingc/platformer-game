@echo off
title game
color 1a
set enabledelayedexpansion
set player_posx=0
set player_posy=7
set player_health=50
set enemy_posx=8
set enemy_posy=7
set enemy_health=10
set enemy_posx2=26
set enemy_posy2=7
set enemy_health2=10
set enemy_posx3=57
set enemy_posy3=7
set enemy_health3=10
set enemy_posx4=89
set enemy_posy4=7
set enemy_health4=10
set boss_posx=110
set boss_posy=15
set boss_health=25
:menu
cls
cd "plugins"
cmdMenuSel f870 "start game" "exit"
if %errorlevel% == 1 goto game
if %errorlevel% == 2 exit
pause>nul
goto menu
:game
cls
color 9a
if %player_posx% ==100 (
set /a player_posy=%player_posy%+1
)
if %player_posx% gtr 101 (
if %player_posx% lss 109 (
set /a player_posy=%player_posy%+1
)
)
if %player_posx% == 113 (
if %player_posy% == 15 (
goto wongame
)
)
if %enemy_health% gtr 0 (
batbox /g %enemy_posx% 6 /c 0x9a /d "health:%enemy_health%"
)
if %enemy_health2% gtr 0 (
batbox /g %enemy_posx2% 6 /c 0x9a /d "health:%enemy_health2%"
)
if %enemy_health3% gtr 0 (
batbox /g %enemy_posx3% 6 /c 0x9a /d "health:%enemy_health3%"
)
if %enemy_health4% gtr 0 (
batbox /g %enemy_posx4% 6 /c 0x9a /d "health:%enemy_health4%"
)
if %player_posx% == %enemy_posx% (
set /a player_health=%player_health%-3
set /a enemy_health=%enemy_health%-5
)
if %player_posx% == %enemy_posx2% (
set /a player_health=%player_health%-3
set /a enemy_health2=%enemy_health2%-5
)
if %player_posx% == %enemy_posx3% (
set /a player_health=%player_health%-3
set /a enemy_health3=%enemy_health3%-5
)
if %player_posx% == %enemy_posx4% (
set /a player_health=%player_health%-3
set /a enemy_health4=%enemy_health4%-5
)
if %boss_health% gtr 0 (
batbox /g %boss_posx% %boss_posy% /c 0x4a /d "$"
)
if %boss_health% gtr 0 (
batbox /g %boss_posx% 14 /c 0x4a /d "health:%boss_health%"
)
if %player_posx% == %boss_posx% (
set /a player_health=%player_health%-5
set /a boss_health=%boss_health%-5
)
batbox /g 100 9 /c 0x20 /d "-"
batbox /g 101 9 /c 0x20 /d "-"
batbox /g 102 10 /c 0x20 /d "-"
batbox /g 103 11 /c 0x20 /d "-"
batbox /g 104 12 /c 0x20 /d "-"
batbox /g 105 13 /c 0x20 /d "-"
batbox /g 106 14 /c 0x20 /d "-"
batbox /g 107 15 /c 0x20 /d "-"
batbox /g 107 16 /c 0x20 /d "----------"
batbox /g 0 8 /c 0x20 /d "----------------------------------------------------------------------------------------------------"
batbox /g %player_posx% %player_posy% /c 0x9a /d "@"
if %enemy_health% gtr 0 (
batbox /g %enemy_posx% %enemy_posy% /c 0x9a /d "#"
)
if %enemy_health2% gtr 0 (
batbox /g %enemy_posx2% %enemy_posy2% /c 0x9a /d "#"
)
if %enemy_health3% gtr 0 (
batbox /g %enemy_posx3% %enemy_posy3% /c 0x9a /d "#"
)
if %enemy_health4% gtr 0 (
batbox /g %enemy_posx4% %enemy_posy4% /c 0x9a /d "#"
)
batbox /g 113 15 /c 0x9a /d "end"
batbox /g 0 0 /c 0x4a /d "health:%player_health%"
call Button 0 10 A0 "Left" 10 10 E0 "right"   X _Var_Box _Var_Hover

GetInput /M %_Var_Box% /H %_Var_Hover%

if %errorlevel% == 1 (
set /a player_posx=%player_posx%+1
goto game
)
if %errorlevel% == 2 (
if %player_posx%==100 (
set /a player_posy=%player_posy%-1
)
if %player_posy% lss 16 (
if %player_posx% gtr 101 (
set /a player_posy=%player_posy%-2
)
)
set /a player_posx=%player_posx%-1
goto game
)
pause>nul
goto game
:wongame
cls
color 4a
set player_posx=0
set player_posy=7
set player_health=50
set enemy_posx=8
set enemy_posy=7
set enemy_health=10
set enemy_posx2=26
set enemy_posy2=7
set enemy_health2=10
set enemy_posx3=57
set enemy_posy3=7
set enemy_health3=10
set enemy_posx4=89
set enemy_posy4=7
set enemy_health4=10
set boss_posx=110
set boss_posy=15
set boss_health=25
batbox /g 25 10 /c 0x9a /d "You won the game"
call Button 19 12 A0 "play again" 35 12 E0 "main menu"  X _Var_Box _Var_Hover

GetInput /M %_Var_Box% /H %_Var_Hover%

if %errorlevel%==1 goto game
if %errorlevel%==2 goto menu
pause>nul
goto menu
