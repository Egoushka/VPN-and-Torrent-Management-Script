@echo off

SET "script_folder=%USERPROFILE%\Documents\VPN_Torrent_Script"
SET "torrent_exe_file=%script_folder%\torrent_exe.txt"
SET "torrent_path_file=%script_folder%\torrent_path.txt"
SET "vpnapp_path_file=%script_folder%\vpnapp_path.txt"
SET "vpnapp_exe_file=%script_folder%\vpnapp_exe.txt"

goto setup

:setup	
	SETLOCAL EnableDelayedExpansion
	IF NOT EXIST "%script_folder%" mkdir "%script_folder%"

    IF EXIST "%torrent_exe_file%" (
		for /f "tokens=*" %%a in ('type "%torrent_exe_file%"') do set "torrent_exe=%%a"
		set torrent_exe=!torrent_exe: =!
	) ELSE (
        call:set_torrent "setup"
    )

    IF EXIST "%torrent_path_file%" (
        set /p torrent_path=<"%torrent_path_file%"
    ) ELSE (
        call:set_torrent "setup"
    )

    IF EXIST "%vpnapp_path_file%" (
        set /p vpnapp_path=<"%vpnapp_path_file%"
    ) ELSE (
        call:set_vpn "setup"
    )
    
    IF EXIST "%vpnapp_exe_file%" (
        for /f "tokens=*" %%a in ('type "%vpnapp_exe_file%"') do set "vpnapp_exe=%%a"
		set vpnapp_exe=!vpnapp_exe: =!
	) ELSE (
        call:set_vpn "setup"
    )
	
    IF "%1"=="auto" (
		timeout /t 1 /nobreak >nul
		IF "%2"=="vpn" goto start_vpn
        IF "%2"=="torrent" goto start_torrent
    )
    goto menu


:menu
	echo What would you like to do?
	echo 1. Start VPN
	echo 2. Start Torrent Client
	echo 3. Set Torrent Client
	echo 4. Set VPN Client
	echo 5. Exit
	set /p choice="Enter your choice: "

	if "%choice%"=="1" goto start_vpn
	if "%choice%"=="2" goto start_torrent
	if "%choice%"=="3" goto set_torrent
	if "%choice%"=="4" goto set_vpn
	if "%choice%"=="5" goto end

	echo Invalid choice.
	goto menu

:start_vpn
	IF "%vpnapp_path%"=="" (
		goto end
	)
	IF "%torrent_exe%"=="" (
		goto end
	)
	
	echo Closing torrent client: %torrent_exe%
	
	echo "%torrent_exe%"
	taskkill /IM "%torrent_exe%" /F
	
	start "" "%vpnapp_path%"
	goto end

:start_torrent
	IF "%vpnapp_path%"=="" (
		goto end
	)
	IF "%torrent_exe%"=="" (
		goto end
	)
	
	echo Closing VPN client: %vpnapp_exe%

    taskkill /IM "%vpnapp_exe%" /F
	start "" "%torrent_path%"
	goto end

:set_torrent
	echo Enter the full path of the torrent client executable:
	set /p torrent_path=
	set torrent_path=%torrent_path:"=%
	echo %torrent_path% > "%torrent_path_file%"
	FOR %%i IN ("%torrent_path%") DO SET torrent_exe=%%~nxi
	echo %torrent_exe% > "%torrent_exe_file%"
	
	IF "%~1"=="" goto menu
	IF %~1==setup goto setup
	
	goto menu

:set_vpn
	echo Enter the full path of the VPN client executable:
	set /p vpnapp_path=
	set vpnapp_path=%vpnapp_path:"=%
	echo %vpnapp_path% > "%vpnapp_path_file%"
	FOR %%i IN ("%vpnapp_path%") DO SET vpnapp_exe=%%~nxi
	echo %vpnapp_exe% > "%vpnapp_exe_file%"

	IF "%~1"=="" goto menu
	IF %~1==setup goto setup
	
	goto menu

:end
