# Credit to https://github.com/ChrisTitusTech/winutil & https://gamer-os.github.io/ as well as TCP Optimizer by https://www.speedguide.net/ for providing a majority of the scripting.

# Create a restore point
Write-Output "Creating a restore point..."
Checkpoint-Computer -Description "Before Postsetup Script" -RestorePointType "MODIFY_SETTINGS"
Write-Output "Done"

# Set Execution Policy to Unrestricted
Write-Output "Setting Execution Policy to Unrestricted..."
Set-ExecutionPolicy Unrestricted -Scope CurrentUser | Out-Null
Write-Output "Done"

# Run OO Shutup
Write-Output "Running OO Shutup..."
curl.exe -s "https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/ooshutup10_winutil_settings.cfg" -o $ENV:temp\ooshutup10.cfg
curl.exe -s "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -o $ENV:temp\OOSU10.exe
Start-Process $ENV:temp\OOSU10.exe -ArgumentList "$ENV:temp\ooshutup10.cfg /quiet" | Out-Null
Write-Output "Done"

# Remove Edge
#:: Standalone script by AveYo Source: https://raw.githubusercontent.com/AveYo/fox/main/Edge_Removal.bat
Write-Output "Running Edge Removal..."
curl.exe -s "https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/edgeremoval.bat" -o $ENV:temp\edgeremoval.bat
Start-Process $ENV:temp\edgeremoval.bat | Out-Null
Write-Output "Done"
    
# Disable Telemetry
Write-Output "Disabling Telemetry..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" -Name "AllowBuildPreview" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" -Name "NoGenTicket" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows" -Name "CEIPEnable" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "AITEnable" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableInventory" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\AppV\CEIP")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\AppV\CEIP" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\AppV\CEIP" -Name "CEIPEnable" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Name "PreventHandwritingDataSharing" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput")) {
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" -Name "AllowLinguisticDataCollection" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance")) {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" -Name "SearchOrderConfig" -Type DWord -Value 1 | Out-Null

Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting" | Out-Null
# Office 2016 / 2019
Disable-ScheduledTask -TaskName "Microsoft\Office\Office ClickToRun Service Monitor" -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Office\OfficeTelemetryAgentFallBack2016" -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Office\OfficeTelemetryAgentLogOn2016" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Performance Optimizations
Write-Output "Running Performance Optimizations..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Type DWord -Value 4294967295 | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "AutoEndTasks" -Type DWord -Value 1 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "AutoEndTasks" -Type DWord -Value 1 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "ClearPageFileAtShutdown" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\Ndu" -Name "Start" -Type DWord -Value 2 | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseHoverTime" -Type DWord -Value 200 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "IRPStackSize" -Type DWord -Value 30 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Type DWord -Value 8 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "Priority" -Type DWord -Value 6 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "Scheduling Category" -Type String -Value "High" | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableCdp" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "AllowClipboardHistory" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "AllowCrossDeviceClipboard" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Name "EnableFeeds" -Type DWord -Value 30 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Type DWord -Value 2 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCAMeetNow" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Typing Configuration
Write-Output "Running Typing Configuration..."
If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International")) {
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name "TurnOffAutocorrectMisspelledWords" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International")) {
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name "TurnOffHighlightMisspelledWords" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International")) {
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name "TurnOffOfferTextPredictions" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International")) {
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name "TurnOffInsertSpace" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\TabletTip\1.7")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\TabletTip\1.7" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\TabletTip\1.7" -Name "EnableDoubleTapSpace" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Input\Settings")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Input\Settings" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Input\Settings" -Name "InsightsEnabled" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SYSTEM\CurrentControlSet\Services\RasMan\Parameters\Config\VpnCostedNetworkSettings")) {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\RasMan\Parameters\Config\VpnCostedNetworkSettings" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\RasMan\Parameters\Config\VpnCostedNetworkSettings" -Name "InsightsEnabled" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Network Optimizations (Credit to TCP Optimizer by https://www.speedguide.net/)
Write-Output "Runnning Network Optimizations..."
Set-NetTCPSetting -SettingName internet -AutoTuningLevelLocal disabled | Out-Null
Set-NetTCPSetting -SettingName internet -ScalingHeuristics disabled | Out-Null
netsh int tcp set supplemental internet congestionprovider=ctcp
Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing disabled | Out-Null
Set-NetOffloadGlobalSetting -ReceiveSideScaling disabled | Out-Null
Disable-NetAdapterLso -Name * | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" -Name "explorer.exe" -Type DWord -Value 10 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" -Name "iexplore.exe" -Type DWord -Value 10 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" -Name "explorer.exe" -Type DWord -Value 10 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" -Name "iexplore.exe" -Type DWord -Value 10 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" -Name "LocalPriority" -Type DWord -Value 4 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" -Name "HostsPriority" -Type DWord -Value 5 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" -Name "DnsPriority" -Type DWord -Value 6 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" -Name "NetbtPriority" -Type DWord -Value 7 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Name "NonBestEffortLimit" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" -Name "Do Not use NLA" -Type String -Value 1 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "AlwaysOn" -Type DWord -Value 1 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Type DWord -Value 0xffffffff | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NoLazyMode" -Type DWord -Value 1 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "Size" -Type DWord -Value 3 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargeSystemCache" -Type DWord -Value 1 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "MaxUserPort" -Type DWord -Value 65534 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpTimedWaitDelay" -Type DWord -Value 30 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\MSMQ\Parameters" -Name "TCPNoDelay" -Type String -Value "" | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultTTL" -Type String -Value "" | Out-Null
Set-NetTCPSetting -SettingName internet -EcnCapability disabled | Out-Null
Set-NetOffloadGlobalSetting -Chimney disabled | Out-Null
Set-NetTCPSetting -SettingName internet -Timestamps disabled | Out-Null
Set-NetTCPSetting -SettingName internet -MaxSynRetransmissions 2 | Out-Null
Set-NetTCPSetting -SettingName internet -NonSackRttResiliency disabled | Out-Null
Set-NetTCPSetting -SettingName internet -InitialRtoMs 2000 | Out-Null
Set-NetTCPSetting -SettingName internet -MinRtoMs 300 | Out-Null
netsh interface ipv4 set subinterface "Ethernet 2" mtu=1492 store=persistent
netsh interface ipv6 set subinterface "Ethernet 2" mtu=1492 store=persistent
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{faf0c941-8197-4a30-b959-e93cf2efaf9c}" -Name "TcpAckFrequency" -Type String -Value "" | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{faf0c941-8197-4a30-b959-e93cf2efaf9c}" -Name "TcpDelAckTicks" -Type String -Value "" | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{faf0c941-8197-4a30-b959-e93cf2efaf9c}" -Name "TCPNoDelay" -Type String -Value "" | Out-Null
netsh interface ipv4 set subinterface "Ethernet" mtu=1492 store=persistent
netsh interface ipv6 set subinterface "Ethernet" mtu=1492 store=persistent
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eca522f4-2df2-4e86-a441-ebcec874e655}" -Name "TcpAckFrequency" -Type String -Value "" | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eca522f4-2df2-4e86-a441-ebcec874e655}" -Name "TcpDelAckTicks" -Type String -Value "" | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eca522f4-2df2-4e86-a441-ebcec874e655}" -Name "TCPNoDelay" -Type String -Value "" | Out-Null
Write-Output "Done"

# Disable WiFi-Sense
Write-Output "Disabling WiFi-Sense..."
Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Activity History
Write-Output "Disabling Activity History..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Location Tracking
Write-Output "Disabling Location Tracking..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny" | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type Dword -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type Dword -Value 0 | Out-Null
Write-Output "Done"

# Disable Storage Sense
Write-Output "Disabling Storage Sense..."
Remove-Item -Path \"HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy\" -Recurse -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Disable GameDVR
Write-Output "Disabling GameDVR..."
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehavior" -Type Dword -Value 2 | Out-Null
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type Dword -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_DXGIHonorFSEWindowsCompatible" -Type Dword -Value 1 | Out-Null
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_HonorUserFSEBehaviorMode" -Type Dword -Value 1 | Out-Null
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_EFSEFeatureFlags" -Type Dword -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Type Dword -Value 0 | Out-Null
Write-Output "Done"

# Services Tweaks
Write-Output "Running Service Tweaks..."
Set-Service -Name "AJRouter" -StartupType "Disabled"
Set-Service -Name "ALG" -StartupType "Manual"
Set-Service -Name "AppIDSvc" -StartupType "Manual"
Set-Service -Name "AppMgmt" -StartupType "Manual"
Set-Service -Name "AppReadiness" -StartupType "Manual"
Set-Service -Name "AppVClient" -StartupType "Disabled"
Set-Service -Name "AppXSvc" -StartupType "Manual"
Set-Service -Name "Appinfo" -StartupType "Manual"
Set-Service -Name "AssignedAccessManagerSvc" -StartupType "Disabled"
Set-Service -Name "AudioEndpointBuilder" -StartupType "Automatic"
Set-Service -Name "AudioSrv" -StartupType "Automatic"
Set-Service -Name "AxInstSV" -StartupType "Manual"
Set-Service -Name "BDESVC" -StartupType "Manual"
Set-Service -Name "BFE" -StartupType "Automatic"
Set-Service -Name "BITS" -StartupType "AutomaticDelayedStart"
Set-Service -Name "BTAGService" -StartupType "Manual"
Set-Service -Name "BcastDVRUserService_dc2a4" -StartupType "Manual"
Set-Service -Name "BluetoothUserService_dc2a4" -StartupType "Manual"
Set-Service -Name "BrokerInfrastructure" -StartupType "Automatic"
Set-Service -Name "Browser" -StartupType "Manual"
Set-Service -Name "BthAvctpSvc" -StartupType "Automatic"
Set-Service -Name "BthHFSrv" -StartupType "Automatic"
Set-Service -Name "CDPSvc" -StartupType "Manual"
Set-Service -Name "COMSysApp" -StartupType "Manual"
Set-Service -Name "CaptureService_dc2a4" -StartupType "Manual"
Set-Service -Name "CertPropSvc" -StartupType "Manual"
Set-Service -Name "ClipSVC" -StartupType "Manual"
Set-Service -Name "ConsentUxUserSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "CoreMessagingRegistrar" -StartupType "Automatic"
Set-Service -Name "CredentialEnrollmentManagerUserSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "CryptSvc" -StartupType "Automatic"
Set-Service -Name "CscService" -StartupType "Manual"
Set-Service -Name "DPS" -StartupType "Automatic"
Set-Service -Name "DcomLaunch" -StartupType "Automatic"
Set-Service -Name "CscService" -StartupType "Manual"
Set-Service -Name "DcpSvc" -StartupType "Manual"
Set-Service -Name "DevQueryBroker" -StartupType "Manual"
Set-Service -Name "DeviceAssociationBrokerSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "DeviceAssociationService" -StartupType "Manual"
Set-Service -Name "DeviceInstall" -StartupType "Manual"
Set-Service -Name "DevicePickerUserSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "DevicesFlowUserSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "Dhcp" -StartupType "Automatic"
Set-Service -Name "DiagTrack" -StartupType "Disabled"
Set-Service -Name "DialogBlockingService" -StartupType "Disabled"
Set-Service -Name "DispBrokerDesktopSvc" -StartupType "Automatic"
Set-Service -Name "DisplayEnhancementService" -StartupType "Manual"
Set-Service -Name "DmEnrollmentSvc" -StartupType "Manual"
Set-Service -Name "Dnscache" -StartupType "Automatic"
Set-Service -Name "DoSvc" -StartupType "AutomaticDelayedStart"
Set-Service -Name "DsSvc" -StartupType "Manual"
Set-Service -Name "DsmSvc" -StartupType "Manual"
Set-Service -Name "DusmSvc" -StartupType "Automatic"
Set-Service -Name "EFS" -StartupType "Manual"
Set-Service -Name "EapHost" -StartupType "Manual"
Set-Service -Name "EntAppSvc" -StartupType "Manual"
Set-Service -Name "EventLog" -StartupType "Automatic"
Set-Service -Name "EventSystem" -StartupType "Automatic"
Set-Service -Name "FDResPub" -StartupType "Manual"
Set-Service -Name "Fax" -StartupType "Manual"
Set-Service -Name "FontCache" -StartupType "Automatic"
Set-Service -Name "FrameServer" -StartupType "Manual"
Set-Service -Name "FrameServerMonitor" -StartupType "Manual"
Set-Service -Name "GraphicsPerfSvc" -StartupType "Manual"
Set-Service -Name "HomeGroupListener" -StartupType "Manual"
Set-Service -Name "HomeGroupProvider" -StartupType "Manual"
Set-Service -Name "HvHost" -StartupType "Manual"
Set-Service -Name "IEEtwCollectorService" -StartupType "Manual"
Set-Service -Name "IKEEXT" -StartupType "Manual"
Set-Service -Name "InstallService" -StartupType "Manual"
Set-Service -Name "InventorySvc" -StartupType "Manual"
Set-Service -Name "IpxlatCfgSvc" -StartupType "Manual"
Set-Service -Name "FontCache" -StartupType "Automatic"
Set-Service -Name "KeyIso" -StartupType "Automatic"
Set-Service -Name "KtmRm" -StartupType "Manual"
Set-Service -Name "LSM" -StartupType "Automatic"
Set-Service -Name "LanmanServer" -StartupType "Automatic"
Set-Service -Name "LanmanWorkstation" -StartupType "Automatic"
Set-Service -Name "LicenseManager" -StartupType "Manual"
Set-Service -Name "LxpSvc" -StartupType "Manual"
Set-Service -Name "MSDTC" -StartupType "Manual"
Set-Service -Name "MSiSCSI" -StartupType "Manual"
Set-Service -Name "MapsBroker" -StartupType "AutomaticDelayedStart"
Set-Service -Name "McpManagementService" -StartupType "Manual"
Set-Service -Name "MessagingService_dc2a4" -StartupType "Manual"
Set-Service -Name "MicrosoftEdgeElevationService" -StartupType "Manual"
Set-Service -Name "MixedRealityOpenXRSvc" -StartupType "Manual"
Set-Service -Name "MpsSvc" -StartupType "Automatic"
Set-Service -Name "MsKeyboardFilter" -StartupType "Manual"
Set-Service -Name "NPSMSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "NaturalAuthentication" -StartupType "Manual"
Set-Service -Name "NcaSvc" -StartupType "Manual"
Set-Service -Name "NcbService" -StartupType "Manual"
Set-Service -Name "NcdAutoSetup" -StartupType "Manual"
Set-Service -Name "NetTcpPortSharing" -StartupType "Disabled"
Set-Service -Name "Netlogon" -StartupType "Manual"
Set-Service -Name "Netman" -StartupType "Manual"
Set-Service -Name "NgcCtnrSvc" -StartupType "Manual"
Set-Service -Name "NgcSvc" -StartupType "Manual"
Set-Service -Name "NlaSvc" -StartupType "Manual"
Set-Service -Name "OneSyncSvc_dc2a4" -StartupType "Automatic"
Set-Service -Name "P9RdrService_dc2a4" -StartupType "Manual"
Set-Service -Name "PNRPAutoReg" -StartupType "Manual"
Set-Service -Name "PNRPsvc" -StartupType "Manual"
Set-Service -Name "PcaSvc" -StartupType "Manual"
Set-Service -Name "PeerDistSvc" -StartupType "Manual"
Set-Service -Name "PenService_dc2a4" -StartupType "Manual"
Set-Service -Name "PerfHost" -StartupType "Manual"
Set-Service -Name "PhoneSvc" -StartupType "Manual"
Set-Service -Name "PimIndexMaintenanceSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "PlugPlay" -StartupType "Manual"
Set-Service -Name "PolicyAgent" -StartupType "Manual"
Set-Service -Name "Power" -StartupType "Automatic"
Set-Service -Name "PrintNotify" -StartupType "Manual"
Set-Service -Name "PrintWorkflowUserSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "ProfSvc" -StartupType "Automatic"
Set-Service -Name "PushToInstall" -StartupType "Manual"
Set-Service -Name "QWAVE" -StartupType "Manual"
Set-Service -Name "RasAuto" -StartupType "Manual"
Set-Service -Name "RasMan" -StartupType "Manual"
Set-Service -Name "RemoteAccess" -StartupType "Disabled"
Set-Service -Name "RemoteRegistry" -StartupType "Disabled"
Set-Service -Name "RetailDemo" -StartupType "Manual"
Set-Service -Name "RmSvc" -StartupType "Manual"
Set-Service -Name "RpcEptMapper" -StartupType "Automatic"
Set-Service -Name "RpcLocator" -StartupType "Manual"
Set-Service -Name "RpcSs" -StartupType "Automatic"
Set-Service -Name "SCPolicySvc" -StartupType "Manual"
Set-Service -Name "SCardSvr" -StartupType "Manual"
Set-Service -Name "SDRSVC" -StartupType "Manual"
Set-Service -Name "SEMgrSvc" -StartupType "Manual"
Set-Service -Name "SENS" -StartupType "Automatic"
Set-Service -Name "SNMPTRAP" -StartupType "Manual"
Set-Service -Name "SNMPTrap" -StartupType "Manual"
Set-Service -Name "SSDPSRV" -StartupType "Manual"
Set-Service -Name "SENS" -StartupType "Automatic"
Set-Service -Name "SamSs" -StartupType "Automatic"
Set-Service -Name "ScDeviceEnum" -StartupType "Manual"
Set-Service -Name "Schedule" -StartupType "Automatic"
Set-Service -Name "SecurityHealthService" -StartupType "Manual"
Set-Service -Name "Sense" -StartupType "Manual"
Set-Service -Name "SensorDataService" -StartupType "Manual"
Set-Service -Name "SensorService" -StartupType "Manual"
Set-Service -Name "SensrSvc" -StartupType "Manual"
Set-Service -Name "SessionEnv" -StartupType "Manual"
Set-Service -Name "SgrmBroker" -StartupType "Automatic"
Set-Service -Name "SharedAccess" -StartupType "Manual"
Set-Service -Name "SharedRealitySvc" -StartupType "Manual"
Set-Service -Name "ShellHWDetection" -StartupType "Automatic"
Set-Service -Name "SmsRouter" -StartupType "Manual"
Set-Service -Name "Spooler" -StartupType "Automatic"
Set-Service -Name "SstpSvc" -StartupType "Manual"
Set-Service -Name "StateRepository" -StartupType "Manual"
Set-Service -Name "StorSvc" -StartupType "Manual"
Set-Service -Name "SysMain" -StartupType "Automatic"
Set-Service -Name "SystemEventsBroker" -StartupType "Automatic"
Set-Service -Name "TabletInputService" -StartupType "Manual"
Set-Service -Name "TapiSrv" -StartupType "Manual"
Set-Service -Name "TermService" -StartupType "Automatic"
Set-Service -Name "TextInputManagementService" -StartupType "Manual"
Set-Service -Name "Themes" -StartupType "Automatic"
Set-Service -Name "TieringEngineService" -StartupType "Manual"
Set-Service -Name "TimeBroker" -StartupType "Manual"
Set-Service -Name "TimeBrokerSvc" -StartupType "Manual"
Set-Service -Name "TokenBroker" -StartupType "Manual"
Set-Service -Name "TrkWks" -StartupType "Automatic"
Set-Service -Name "TroubleshootingSvc" -StartupType "Manual"
Set-Service -Name "TrustedInstaller" -StartupType "Manual"
Set-Service -Name "UI0Detect" -StartupType "Manual"
Set-Service -Name "UdkUserSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "UevAgentService" -StartupType "Disabled"
Set-Service -Name "UmRdpService" -StartupType "Manual"
Set-Service -Name "UnistoreSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "UserDataSvc_dc2a4" -StartupType "Manual"
Set-Service -Name "UserManager" -StartupType "Automatic"
Set-Service -Name "UsoSvc" -StartupType "Manual"
Set-Service -Name "VGAuthService" -StartupType "Automatic"
Set-Service -Name "VMTools" -StartupType "Automatic"
Set-Service -Name "VSS" -StartupType "Automatic"
Set-Service -Name "VacSvc" -StartupType "Manual"
Set-Service -Name "VaultSvc" -StartupType "Automatic"
Set-Service -Name "VacSvc" -StartupType "Manual"
Set-Service -Name "W32Time" -StartupType "Manual"
Set-Service -Name "WEPHOSTSVC" -StartupType "Manual"
Set-Service -Name "WFDSConMgrSvc" -StartupType "Manual"
Set-Service -Name "WMPNetworkSvc" -StartupType "Manual"
Set-Service -Name "WManSvcWManSvc" -StartupType "Manual"
Set-Service -Name "WManSvc" -StartupType "Manual"
Set-Service -Name "WPDBusEnum" -StartupType "Manual"
Set-Service -Name "WSService" -StartupType "Manual"
Set-Service -Name "WSearch" -StartupType "AutomaticDelayedStart"
Set-Service -Name "WaaSMedicSvc" -StartupType "Manual"
Set-Service -Name "WalletService" -StartupType "Manual"
Set-Service -Name "WarpJITSvc" -StartupType "Manual"
Set-Service -Name "WbioSrvc" -StartupType "Manual"
Set-Service -Name "Wcmsvc" -StartupType "Automatic"
Set-Service -Name "WdNisSvc" -StartupType "Manual"
Set-Service -Name "WdiServiceHost" -StartupType "Manual"
Set-Service -Name "WdiSystemHost" -StartupType "Manual"
Set-Service -Name "WebClient" -StartupType "Manual"
Set-Service -Name "Wecsvc" -StartupType "Manual"
Set-Service -Name "WerSvc" -StartupType "Manual"
Set-Service -Name "WiaRpc" -StartupType "Manual"
Set-Service -Name "WinDefend" -StartupType "Automatic"
Set-Service -Name "WcsPlugInService" -StartupType "Manual"
Set-Service -Name "WinHttpAutoProxySvc" -StartupType "Manual"
Set-Service -Name "WinRM" -StartupType "Manual"
Set-Service -Name "Winmgmt" -StartupType "Automatic"
Set-Service -Name "WlanSvc" -StartupType "Automatic"
Set-Service -Name "WpcMonSvc" -StartupType "Manual"
Set-Service -Name "WpnService" -StartupType "Manual"
Set-Service -Name "WpnUserService_dc2a4" -StartupType "Automatic"
Set-Service -Name "WwanSvc" -StartupType "Manual"
Set-Service -Name "XblAuthManager" -StartupType "Manual"
Set-Service -Name "XblGameSave" -StartupType "Manual"
Set-Service -Name "XboxGipSvc" -StartupType "Manual"
Set-Service -Name "XboxNetApiSvc" -StartupType "Manual"
Set-Service -Name "autotimesvc" -StartupType "Manual"
Set-Service -Name "bthserv" -StartupType "Manual"
Set-Service -Name "camsvc" -StartupType "Manual"
Set-Service -Name "cbdhsvc_dc2a4" -StartupType "Manual"
Set-Service -Name "cloudidsvc" -StartupType "Manual"
Set-Service -Name "dcsvc" -StartupType "Manual"
Set-Service -Name "defragsvc" -StartupType "Manual"
Set-Service -Name "diagnosticshub.standardcollector.service" -StartupType "Manual"
Set-Service -Name "diagsvc" -StartupType "Manual"
Set-Service -Name "dmwappushservice" -StartupType "Manual"
Set-Service -Name "dot3svc" -StartupType "Manual"
Set-Service -Name "edgeupdate" -StartupType "Manual"
Set-Service -Name "edgeupdatem" -StartupType "Manual"
Set-Service -Name "embeddedmode" -StartupType "Manual"
Set-Service -Name "fdPHost" -StartupType "Manual"
Set-Service -Name "fhsvc" -StartupType "Manual"
Set-Service -Name "gpsvc" -StartupType "Automatic"
Set-Service -Name "hidserv" -StartupType "Manual"
Set-Service -Name "icssvc" -StartupType "Manual"
Set-Service -Name "iphlpsvc" -StartupType "Automatic"
Set-Service -Name "lfsvc" -StartupType "Manual"
Set-Service -Name "lltdsvc" -StartupType "Manual"
Set-Service -Name "lmhosts" -StartupType "Manual"
Set-Service -Name "iphlpsvc" -StartupType "Automatic"
Set-Service -Name "mpssvc" -StartupType "Automatic"
Set-Service -Name "msiserver" -StartupType "Manual"
Set-Service -Name "netprofm" -StartupType "Manual"
Set-Service -Name "nsi" -StartupType "Automatic"
Set-Service -Name "p2pimsvc" -StartupType "Manual"
Set-Service -Name "p2psvc" -StartupType "Manual"
Set-Service -Name "perceptionsimulation" -StartupType "Manual"
Set-Service -Name "pla" -StartupType "Manual"
Set-Service -Name "seclogon" -StartupType "Manual"
Set-Service -Name "shpamsvc" -StartupType "Disabled"
Set-Service -Name "smphost" -StartupType "Manual"
Set-Service -Name "spectrum" -StartupType "Manual"
Set-Service -Name "sppsvc" -StartupType "AutomaticDelayedStart"
Set-Service -Name "ssh-agent" -StartupType "Disabled"
Set-Service -Name "svsvc" -StartupType "Manual"
Set-Service -Name "swprv" -StartupType "Manual"
Set-Service -Name "tiledatamodelsvc" -StartupType "Automatic"
Set-Service -Name "tzautoupdate" -StartupType "Disabled"
Set-Service -Name "uhssvc" -StartupType "Disabled"
Set-Service -Name "upnphost" -StartupType "Manual"
Set-Service -Name "vds" -StartupType "Manual"
Set-Service -Name "vm3dservice" -StartupType "Manual"
Set-Service -Name "vmicguestinterface" -StartupType "Manual"
Set-Service -Name "vmicheartbeat" -StartupType "Manual"
Set-Service -Name "vmickvpexchange" -StartupType "Manual"
Set-Service -Name "vmicrdv" -StartupType "Manual"
Set-Service -Name "vmicshutdown" -StartupType "Manual"
Set-Service -Name "vmictimesync" -StartupType "Manual"
Set-Service -Name "vmicvmsession" -StartupType "Manual"
Set-Service -Name "vmicvss" -StartupType "Manual"
Set-Service -Name "vmvss" -StartupType "Manual"
Set-Service -Name "wbengine" -StartupType "Manual"
Set-Service -Name "wcncsvc" -StartupType "Manual"
Set-Service -Name "webthreatdefsvc" -StartupType "Manual"
Set-Service -Name "webthreatdefusersvc_dc2a4" -StartupType "Automatic"
Set-Service -Name "wercplsupport" -StartupType "Manual"
Set-Service -Name "wisvc" -StartupType "Manual"
Set-Service -Name "wlidsvc" -StartupType "Manual"
Set-Service -Name "wlpasvc" -StartupType "Manual"
Set-Service -Name "wmiApSrv" -StartupType "Manual"
Set-Service -Name "workfolderssvc" -StartupType "Manual"
Set-Service -Name "wscsvc" -StartupType "AutomaticDelayedStart"
Set-Service -Name "wuauserv" -StartupType "Manual"
Set-Service -Name "wudfsvc" -StartupType "Manual"
Write-Output "Done"

# Disable Search Bloat
Write-Output "Disabling Search Bloat..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Type DWord -Value | Out-Null
Write-Output "Done"

# Disable Location Services
Write-Output "Disabling Location Services..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocation" -Type DWord -Value 1 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocationScripting" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Automatic Maps Updates
Write-Output "Disabling Automatic Maps Updates..."
Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Feedback
Write-Output "Disabling Feedback..."
If (!(Test-Path "HKCU:\Software\Microsoft\Siuf\Rules")) {
New-Item -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 1 | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClient" -ErrorAction SilentlyContinue | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Disable Tailored Experiences
Write-Output "Disabling Tailored Experiences..."
If (!(Test-Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent")) {
New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Advertising ID
Write-Output "Disabling Advertising ID..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Error Reporting
Write-Output "Disabling Error Reporting..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1 | Out-Null
Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting" | Out-Null
Write-Output "Done"

# Enable System Restore for system drive
Write-Output "Enabling System Restore for system drive..."
Enable-ComputerRestore -Drive "$env:SYSTEMDRIVE"
vssadmin Resize ShadowStorage /On=$env:SYSTEMDRIVE /For=$env:SYSTEMDRIVE /MaxSize=10GB
Write-Output "Done"

# Disable Recycle Bin - Files will be permanently deleted without placing into Recycle Bin
Write-Output "Disabling Recycle Bin..."
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoRecycleFiles" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Enable Action Center (Notification Center)
Write-Output "Enabling Action Center..."
Remove-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -ErrorAction SilentlyContinue | Out-Null
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Disable Lock Screen
Write-Output "Disabling Lock Screen..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreen" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Lock screen Blur - Applicable since 1903
Write-Output "Disabling Lock Screen Blur..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "DisableAcrylicBackgroundOnLogon" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Aero Shake (minimizing other windows when one is dragged by mouse and shaken)
Write-Output "Disabling Aero Shake..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisallowShaking" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Accessibility Keys prompts (Sticky keys, Toggle keys, Filter keys)
Write-Output "Disabling Accessibility Keys Prompts..."
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Type String -Value "506" | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\ToggleKeys" -Name "Flags" -Type String -Value "58" | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name "Flags" -Type String -Value "122" | Out-Null
Write-Output "Done"

# Hide Taskbar Search icon / box
Write-Output "Hiding Taskbar Search icon / box..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Hide Task View Button
Write-Output "Hiding Task View Button..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Set Taskbar Buttons to Always Combine and Hide Labels
Write-Output "Setting Taskbar Buttons to Always Combine and Hide Labels..."
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarGlomLevel" -ErrorAction SilentlyContinue | Out-Null
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "MMTaskbarGlomLevel" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Hide Taskbar People Icon
Write-Output "Hiding Taskbar People Icon..."
If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Showing All Tray Icons
Write-Output "Showing All Tray Icons..."
If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoAutoTrayNotify" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Hide Seconds from Taskbar
Write-Output "Hiding Seconds from Taskbar..."
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSecondsInSystemClock" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Disable "Search for App in Store" for Unknown Extensions
Write-Output 'Disabling "Search for App in Store" for Unknown Extensions...'
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoUseStoreOpenWith" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Hide 'Recently added' list from Start Menu
Write-Output "Hiding 'Recently added' list from Start Menu..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "HideRecentlyAddedApps" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Hide "Most used" Apps List from Start Menu - Applicable until 1703 (hidden by default since then)
Write-Output 'Hiding "Most used" Apps List from Start Menu...'
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoStartMenuMFUprogramsList" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Set Control Panel View to Categories
Write-Output "Setting Control Panel View to Categories..."
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" -Name "StartupPage" -ErrorAction SilentlyContinue | Out-Null
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" -Name "AllItemsIconView" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Keyboard & Mouse Data Queue Size Reduction
Write-Output "Lowering Keyboard & Mouse Data Queue Size..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" -Name "InitialKeyboardIndicators" -Value 16 | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" -Name "KeyboardDataQueueSize" -Value 10 | Out-Null
Write-Output "Done"

# Long Quantum Priority Seperation (https://forums.blurbusters.com/viewtopic.php?t=8535)
Write-Output "Increasing Quantum Priority Seperation..."
Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 16 | Out-Null
Write-Output "Done"

# Enable Dark Mode
Write-Output "Enabling Dark Mode..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name SystemUsesLightTheme -Value 0 | Out-Null
Write-Output "Done"

# Enable NumLock on Startup
Write-Output "Enabling NumLock on Startup..."
If (!(Test-Path "HKU:")) {
New-PSDrive -Name "HKU" -PSProvider "Registry" -Root "HKEY_USERS" | Out-Null
}
Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2147483650 | Out-Null
Add-Type -AssemblyName System.Windows.Forms
If (!([System.Windows.Forms.Control]::IsKeyLocked('NumLock'))) {
$wsh = New-Object -ComObject WScript.Shell
$wsh.SendKeys('{NUMLOCK}')
}
Write-Output "Done"

# Show File Extensions
Write-Output "Showing File Extensions..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Windows 11 Right Click Menu
Write-Output "Disabling Windows 11 Right Click Menu..."
New-Item -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Name "InprocServer32" -force -value ""
Write-Output "Done"

# Set Windows Performance Optimizations
Write-Output "Setting Windows Performance Optimizations..."
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Type String -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type String -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](90,12,3,80,11,0,0,0)) | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Type String -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Type String -Value "" | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Colors" -Name "Background" -Type String -Value "0 120 215" | Out-Null
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "EnablePerProcessSystemDPI" -Type DWord -Value "0 120 215" | Out-Null
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Multimedia\Audio" -Name "UserDuckingPreference" -Type DWord -Value 3 | Out-Null
Write-Output "Done"

# Set Sound Scheme to No Sounds
Write-Output "Setting Sound Scheme to No Sounds..."
$SoundScheme = ".None"
Get-ChildItem -Path "HKCU:\AppEvents\Schemes\Apps\*\*" | ForEach-Object {
# If scheme keys do not exist in an event, create empty ones (similar behavior to Sound control panel).
If (!(Test-Path "$($_.PsPath)\$($SoundScheme)")) {
New-Item -Path "$($_.PsPath)\$($SoundScheme)" | Out-Null
}
If (!(Test-Path "$($_.PsPath)\.Current")) {
New-Item -Path "$($_.PsPath)\.Current" | Out-Null
}
# Get a regular string from any possible kind of value, i.e. resolve REG_EXPAND_SZ, copy REG_SZ or empty from non-existing.
$Data = (Get-ItemProperty -Path "$($_.PsPath)\$($SoundScheme)" -Name "(Default)" -ErrorAction SilentlyContinue)."(Default)"
# Replace any kind of value with a regular string (similar behavior to Sound control panel).
Set-ItemProperty -Path "$($_.PsPath)\$($SoundScheme)" -Name "(Default)" -Type String -Value $Data | Out-Null
# Copy data from source scheme to current.
Set-ItemProperty -Path "$($_.PsPath)\.Current" -Name "(Default)" -Type String -Value $Data | Out-Null
}
Set-ItemProperty -Path "HKCU:\AppEvents\Schemes" -Name "(Default)" -Type String -Value $SoundScheme | Out-Null
Write-Output "Done"

# Disable Windows Startup Sound
Write-Output "Disabling Windows Startup Sound..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" -Name "DisableStartupSound" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Show File Operations Details
Write-Output "Showing File Operations Details..."
If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager")) {
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Name "EnthusiastMode" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Show Network Options on Lock Screen
Write-Output "Showing Network Options on Lock Screen..."
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "DontDisplayNetworkSelectionUI" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Enable File Delete Confirmation Dialog
Write-Output "Enabling File Delete Confirmation Dialog..."
If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "ConfirmFileDelete" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Enable Verbose Startup/Shutdown Status Messages
Write-Output "Enabling Verbose Startup/Shutdown Status Messages..."
If ((Get-CimInstance -Class "Win32_OperatingSystem").ProductType -eq 1) {
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "VerboseStatus" -Type DWord -Value 1 | Out-Null
} Else {
Remove-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "VerboseStatus" -ErrorAction SilentlyContinue | Out-Null
}
Write-Output "Done"

# Disable Adding "- shortcut" to Shortcut Name
Write-Output 'Disabling Adding "- shortcut" to Shortcut Name...'
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "link" -Type Binary -Value ([byte[]](0,0,0,0)) | Out-Null
Write-Output "Done"

# Show Shortcut Icon Arrow
Write-Output "Showing Shortcut Icon Arrow..."
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" -Name "29" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Disable F1 Help Key in Explorer and on Desktop
Write-Output "Disabling F1 Help Key..."
If (!(Test-Path "HKCU:\Software\Classes\TypeLib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win32")) {
New-Item -Path "HKCU:\Software\Classes\TypeLib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win32" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Classes\TypeLib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win32" -Name "(Default)" -Type "String" -Value "" | Out-Null
If (!(Test-Path "HKCU:\Software\Classes\TypeLib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64")) {
New-Item -Path "HKCU:\Software\Classes\TypeLib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Classes\TypeLib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64" -Name "(Default)" -Type "String" -Value "" | Out-Null
Write-Output "Done"

# Show Full Directory Path in Explorer Title Bar
Write-Output "Showing Full Directory Path in Explorer Title Bar..."
If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState")) {
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" -Name "FullPath" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Enable NTFS Paths with Length Over 260 Characters
Write-Output "Enabling NTFS Paths with Length Over 260 Characters..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Hide Hidden Files
Write-Output "Hiding Hidden Files..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Type DWord -Value 2 | Out-Null
Write-Output "Done"

# Hide Protected Operating System Files
Write-Output "Hiding Protected Operating System Files..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Show Empty Drives (With No Media)
Write-Output "Showing Empty Drives (With No Media)..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideDrivesWithNoMedia" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Show Folder Merge Conflicts
Write-Output "Showing Folder Merge Conflicts..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideMergeConflicts" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Explorer Navigation Pane Expanding to Current Folder
Write-Output "Disabling Navigation Pane Expanding to Current Folder..."
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "NavPaneExpandToCurrentFolder" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Hide all folders from Explorer navigation pane except the basic ones (Quick access, OneDrive, This PC, Network)
Write-Output "Hiding All Folders in Explorer Navigation Pane (Except the Basic Ones)..."
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "NavPaneShowAllFolders" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Hide Libraries from Explorer Navigation Pane
Write-Output "Hiding Libraries from Explorer Navigation Pane..."
Remove-ItemProperty -Path "HKCU:\Software\Classes\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" -Name "System.IsPinnedToNameSpaceTree" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Disable Launching Folder Windows in a Separate Process
Write-Output "Disabling Launching Folder Windows in a Separate Process..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SeparateProcess" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Restoring Previous Folder Windows at Logon
Write-Output "Disabling Restoring Previous Folder Windows at Logon..."
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "PersistBrowsers" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Hide Coloring of Encrypted or Compressed NTFS Files
Write-Output "Hiding Coloring of Encrypted or Compressed NTFS Files..."
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowEncryptCompressedColor" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Disable Sharing Wizard
Write-Output "Disabling Sharing Wizard..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SharingWizardOn" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Show Item Selection Checkboxes
Write-Output "Showing Item Selection Checkboxes..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "AutoCheckSelect" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Hide Sync Provider Notifications
Write-Output "Hiding Sync Provider Notifications..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSyncProviderNotifications" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Recent Files Lists
Write-Output "Disabling Recent Files Lists..."
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoRecentDocsHistory" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Hide Recent and Frequently Used Item Shortcuts in Explorer
Write-Output "Hiding Recent and Frequently Used Item Shortcuts in Explorer..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Change Default Explorer View to This PC
Write-Output "Changing Default Explorer View to This PC..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Show Quick Access in Explorer Navigation Pane
Write-Output "Showing Quick Access in Explorer Navigation Pane..."
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "HubMode" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Hide All Icons from Desktop
Write-Output "Hiding All Icons from Desktop..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideIcons" -Value 1 | Out-Null
Write-Output "Done"

# Remove Windows Build Number and Windows Edition (Home/Pro/Enterprise) from Bottom Right of Desktop
Write-Output "Hiding Windows Build Number from Desktop..."
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "PaintDesktopVersion" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Hide "Include in Library" Context Menu Item
Write-Output 'Hiding "Include in Library" Context Menu Item...'
If (!(Test-Path "HKCR:")) {
New-PSDrive -Name "HKCR" -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" | Out-Null
}
Remove-Item -Path "HKCR:\Folder\ShellEx\ContextMenuHandlers\Library Location" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Hide "Give Access To" (until 1703 'Share With') Context Menu Item.
Write-Output 'Hiding "Give Access To" Context Menu Item...'
If (!(Test-Path "HKCR:")) {
New-PSDrive -Name "HKCR" -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" | Out-Null
}
Remove-Item -LiteralPath "HKCR:\*\shellex\ContextMenuHandlers\Sharing" -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Path "HKCR:\Directory\Background\shellex\ContextMenuHandlers\Sharing" -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Path "HKCR:\Directory\shellex\ContextMenuHandlers\Sharing" -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Path "HKCR:\Drive\shellex\ContextMenuHandlers\Sharing" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Hide 'Share' Context Menu Item. Applicable since 1709
Write-Output 'Hiding "Share" Context Menu Item...'
If (!(Test-Path "HKCR:")) {
New-PSDrive -Name "HKCR" -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" | Out-Null
}
Remove-Item -LiteralPath "HKCR:\*\shellex\ContextMenuHandlers\ModernSharing" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Enable Thumbnails
Write-Output "Enabling Thumbnails..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "IconsOnly" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Creation of Thumbnail Cache Files
Write-Output "Disabling Creation of Thumbnail Cache Files..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisableThumbnailCache" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable creation of Thumbs.db Thumbnail Cache Files on Network Folders
Write-Output "Disabling Creation of Thumbs.db on Network Folders..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisableThumbsDBOnNetworkFolders" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Unset Photo Viewer Association for bmp, gif, jpg, png and tif
Write-Output "Unsetting Photo Viewer Association for bmp, gif, jpg, png and tif..."
If (!(Test-Path "HKCR:")) {
New-PSDrive -Name "HKCR" -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" | Out-Null
}
Remove-Item -Path "HKCR:\Paint.Picture\shell\open" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-ItemProperty -Path "HKCR:\giffile\shell\open" -Name "MuiVerb" -ErrorAction SilentlyContinue | Out-Null
Set-ItemProperty -Path "HKCR:\giffile\shell\open" -Name "CommandId" -Type String -Value "IE.File" | Out-Null
Set-ItemProperty -Path "HKCR:\giffile\shell\open\command" -Name "(Default)" -Type String -Value "`"$env:SystemDrive\Program Files\Internet Explorer\iexplore.exe`" %1" | Out-Null
Set-ItemProperty -Path "HKCR:\giffile\shell\open\command" -Name "DelegateExecute" -Type String -Value "{17FE9752-0B5A-4665-84CD-569794602F5C}" | Out-Null
Remove-Item -Path "HKCR:\jpegfile\shell\open" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Path "HKCR:\pngfile\shell\open" -Recurse -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Remove Photo Viewer from 'Open with...'
Write-Output 'Removing Photo Viewer from "Open with..."'
If (!(Test-Path "HKCR:")) {
New-PSDrive -Name "HKCR" -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" | Out-Null
}
Remove-Item -Path "HKCR:\Applications\photoviewer.dll\shell\open" -Recurse -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Disable Built-in Adobe Flash in IE and Edge
Write-Output "Disabling Built-in Adobe Flash in IE and Edge..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer" -Name "DisableFlashInIE" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" -Name "FlashPlayerEnabled" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Edge Preload after Windows Startup
Write-Output "Disabling Edge Preload..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" -Name "AllowPrelaunch" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" -Name "AllowTabPreloading" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Edge Desktop Shortcut Creation after Certain Windows Updates
Write-Output "Disabling Edge Shortcut Creation..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "DisableEdgeDesktopShortcutCreation" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Internet Explorer First Run Wizard
Write-Output "Disabling Internet Explorer First Run Wizard..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" -Name "DisableFirstRunCustomize" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable "Hi!" First Logon Animation (It will be replaced by "Preparing Windows" message)
Write-Output "Disabling First Logon Animation..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableFirstLogonAnimation" -Type DWord -Value 0 | Out-Null
Write-Output "Done"

# Disable Windows Media Player's Media Sharing Feature
Write-Output "Disabling Windows Media Player Media Sharing..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" -Name "PreventLibrarySharing" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Windows Media Player Online Access - audio file metadata download, radio presets, DRM.
Write-Output "Disabling Windows Media Player Online Access..."
If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer")) {
New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" -Name "PreventCDDVDMetadataRetrieval" -Type DWord -Value 1 | Out-Null
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" -Name "PreventMusicFileMetadataRetrieval" -Type DWord -Value 1 | Out-Null
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" -Name "PreventRadioPresetsRetrieval" -Type DWord -Value 1 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\WMDRM")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WMDRM" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WMDRM" -Name "DisableOnline" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Developer Mode
Write-Output "Disabling Developer Mode..."
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Name "AllowDevelopmentWithoutDevLicense" -ErrorAction SilentlyContinue | Out-Null
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Name "AllowAllTrustedApps" -ErrorAction SilentlyContinue | Out-Null
Write-Output "Done"

# Disable Password Complexity and Maximum Age Requirements
Write-Output "Disabling Password Complexity and Maximum Age Requirements..."
$tmpfile = New-TemporaryFile
secedit /export /cfg $tmpfile /quiet
(Get-Content $tmpfile).Replace("PasswordComplexity = 1", "PasswordComplexity = 0").Replace("MaximumPasswordAge = 42", "MaximumPasswordAge = -1") | Out-File $tmpfile
secedit /configure /db "$env:SYSTEMROOT\security\database\local.sdb" /cfg $tmpfile /areas SECURITYPOLICY | Out-Null
Remove-Item -Path $tmpfile | Out-Null
Write-Output "Done"

# Disable Ctrl+Alt+Del Requirement Before Login
Write-Output "Disabling Ctrl+Alt+Del Requirement Before Login..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Delete Windows 10 + 11 Bloat (Apps, Features & Components)
Write-Output "Deleting Windows 10 + 11 Bloat (Apps, Features & Components)..."
$ErrorActionPreference = "silentlycontinue"

$Windows10Apps = @(

#Unnecessary Windows 10 Apps
"Microsoft.549981C3F5F10"
"Microsoft.BingWeather"
"Microsoft.GetHelp"
"Microsoft.Getstarted"
"Microsoft.Microsoft3DViewer"
"Microsoft.MicrosoftOfficeHub"
"Microsoft.MicrosoftSolitaireCollection"
"Microsoft.MicrosoftStickyNotes"
"Microsoft.MixedReality.Portal"
"Microsoft.Office.OneNote"
"Microsoft.People"
"Microsoft.ScreenSketch"
"Microsoft.SkypeApp"
"Microsoft.Wallet"
"Microsoft.Windows.Photos"
"Microsoft.WindowsAlarms"
"Microsoft.WindowsCamera"
"microsoft.windowscommunicationsapps"
"Microsoft.WindowsFeedbackHub"
"Microsoft.WindowsMaps"
"Microsoft.WindowsSoundRecorder"
"Microsoft.ZuneMusic"
"Microsoft.ZuneVideo"

)
foreach ($App in $Windows10Apps) {
Get-AppxPackage -Name $App| Remove-AppxPackage
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $App | Remove-AppxProvisionedPackage -Online
}

#Windows 10
if((Get-WindowsCapability -Name 'Accessibility.Braille~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Accessibility.Braille~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Analog.Holographic.Desktop~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Analog.Holographic.Desktop~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'App.StepsRecorder~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'App.StepsRecorder~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'App.Support.QuickAssist~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'App.Support.QuickAssist~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'App.WirelessDisplay.Connect~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'App.WirelessDisplay.Connect~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Browser.InternetExplorer~~~~0.0.11.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Browser.InternetExplorer~~~~0.0.11.0'
}
if((Get-WindowsCapability -Name 'Hello.Face.18967~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Hello.Face.18967~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Hello.Face.Migration.18967~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Hello.Face.Migration.18967~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'MathRecognizer~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'MathRecognizer~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Media.WindowsMediaPlayer~~~~0.0.12.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Media.WindowsMediaPlayer~~~~0.0.12.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Onecore.StorageManagement~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Onecore.StorageManagement~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.WebDriver~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.WebDriver~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.StorageManagement~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.StorageManagement~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.WordPad~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.WordPad~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Msix.PackagingTool.Driver~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Msix.PackagingTool.Driver~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Network.Irda~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Network.Irda~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'OneCoreUAP.OneSync~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'OneCoreUAP.OneSync~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'OpenSSH.Client~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'OpenSSH.Client~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'OpenSSH.Server~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'OpenSSH.Server~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Print.Fax.Scan~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Print.Fax.Scan~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Print.Management.Console~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Print.Management.Console~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'RasCMAK.Client~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'RasCMAK.Client~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'RIP.Listener~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'RIP.Listener~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.CertificateServices.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.CertificateServices.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.DHCP.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.DHCP.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.Dns.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.Dns.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.FileServices.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.FileServices.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.IPAM.Client.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.IPAM.Client.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.LLDP.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.LLDP.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.NetworkController.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.NetworkController.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.ServerManager.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.ServerManager.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.Shielded.VM.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.Shielded.VM.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.StorageReplica.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.StorageReplica.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.SystemInsights.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.SystemInsights.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.VolumeActivation.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.VolumeActivation.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.WSUS.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.WSUS.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'SNMP.Client~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'SNMP.Client~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Tools.DeveloperMode.Core~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Tools.DeveloperMode.Core~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Tools.Graphics.DirectX~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Tools.Graphics.DirectX~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Windows.Client.ShellComponents~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Windows.Client.ShellComponents~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Windows.Desktop.EMS-SAC.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Windows.Desktop.EMS-SAC.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'WMI-SNMP-Provider.Client~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'WMI-SNMP-Provider.Client~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'XPS.Viewer~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'XPS.Viewer~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Language.Handwriting~~~en-us~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Language.Handwriting~~~en-us~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Language.OCR~~~en-us~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Language.OCR~~~en-us~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Language.Speech~~~en-us~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Language.Speech~~~en-us~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Language.TextToSpeech~~~en-us~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Language.TextToSpeech~~~en-us~0.0.1.0'
}

#Windows 10
if((Get-WindowsOptionalFeature -FeatureName 'TFTP' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'TFTP'
}
if((Get-WindowsOptionalFeature -FeatureName 'LegacyComponents' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'LegacyComponents'
}
if((Get-WindowsOptionalFeature -FeatureName 'DirectPlay' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'DirectPlay'
}
if((Get-WindowsOptionalFeature -FeatureName 'SimpleTCP' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SimpleTCP'
}
if((Get-WindowsOptionalFeature -FeatureName 'Windows-Identity-Foundation' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Windows-Identity-Foundation'
}
if((Get-WindowsOptionalFeature -FeatureName 'NetFx3' -Online).State -eq "Enabled") { 
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'NetFx3'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-HTTP-Activation' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-HTTP-Activation'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-NonHTTP-Activation' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-NonHTTP-Activation'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebServerRole' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebServerRole'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebServer' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebServer'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-CommonHttpFeatures' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-CommonHttpFeatures'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpErrors' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpErrors'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpRedirect' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpRedirect'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ApplicationDevelopment' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ApplicationDevelopment'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-Security' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-Security'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-RequestFiltering' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-RequestFiltering'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-NetFxExtensibility' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-NetFxExtensibility'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-NetFxExtensibility45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-NetFxExtensibility45'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HealthAndDiagnostics' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HealthAndDiagnostics'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpLogging' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpLogging'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-LoggingLibraries' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-LoggingLibraries'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-RequestMonitor' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-RequestMonitor'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpTracing' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpTracing'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-URLAuthorization' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-URLAuthorization'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-IPSecurity' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-IPSecurity'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-Performance' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-Performance'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpCompressionDynamic' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpCompressionDynamic'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebServerManagementTools' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebServerManagementTools'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ManagementScriptingTools' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ManagementScriptingTools'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-IIS6ManagementCompatibility' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-IIS6ManagementCompatibility'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-Metabase' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-Metabase'
}
if((Get-WindowsOptionalFeature -FeatureName 'WAS-WindowsActivationService' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WAS-WindowsActivationService'
}
if((Get-WindowsOptionalFeature -FeatureName 'WAS-ProcessModel' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WAS-ProcessModel'
}
if((Get-WindowsOptionalFeature -FeatureName 'WAS-NetFxEnvironment' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WAS-NetFxEnvironment'
}
if((Get-WindowsOptionalFeature -FeatureName 'WAS-ConfigurationAPI' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WAS-ConfigurationAPI'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HostableWebCore' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HostableWebCore'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-Services45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-Services45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-HTTP-Activation45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-HTTP-Activation45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-TCP-Activation45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-TCP-Activation45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-Pipe-Activation45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-Pipe-Activation45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-MSMQ-Activation45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-MSMQ-Activation45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-TCP-PortSharing45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-TCP-PortSharing45'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-StaticContent' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-StaticContent'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-DefaultDocument' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-DefaultDocument'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-DirectoryBrowsing' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-DirectoryBrowsing'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebDAV' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebDAV'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebSockets' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebSockets'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ApplicationInit' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ApplicationInit'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ASPNET' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ASPNET'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ASPNET45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ASPNET45'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ASP' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ASP'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-CGI' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-CGI'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ISAPIExtensions' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ISAPIExtensions'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ISAPIFilter' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ISAPIFilter'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ServerSideIncludes' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ServerSideIncludes'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-CustomLogging' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-CustomLogging'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-BasicAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-BasicAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpCompressionStatic' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpCompressionStatic'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ManagementConsole' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ManagementConsole'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ManagementService' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ManagementService'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WMICompatibility' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WMICompatibility'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-LegacyScripts' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-LegacyScripts'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-LegacySnapIn' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-LegacySnapIn'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-FTPServer' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-FTPServer'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-FTPSvc' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-FTPSvc'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-FTPExtensibility' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-FTPExtensibility'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-Container' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-Container'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-DCOMProxy' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-DCOMProxy'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-Server' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-Server'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-ADIntegration' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-ADIntegration'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-HTTP' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-HTTP'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-Multicast' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-Multicast'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-Triggers' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-Triggers'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-CertProvider' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-CertProvider'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WindowsAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WindowsAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-DigestAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-DigestAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ClientCertificateMappingAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ClientCertificateMappingAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-IISCertificateMappingAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-IISCertificateMappingAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ODBCLogging' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ODBCLogging'
}
if((Get-WindowsOptionalFeature -FeatureName 'WindowsMediaPlayer' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WindowsMediaPlayer'
}
if((Get-WindowsOptionalFeature -FeatureName 'DataCenterBridging' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'DataCenterBridging'
}
if((Get-WindowsOptionalFeature -FeatureName 'SmbDirect' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SmbDirect'
}
if((Get-WindowsOptionalFeature -FeatureName 'AppServerClient' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'AppServerClient'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-PrintToPDFServices-Features' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-PrintToPDFServices-Features'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-XPSServices-Features' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-XPSServices-Features'
}
if((Get-WindowsOptionalFeature -FeatureName 'SearchEngine-Client-Package' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SearchEngine-Client-Package'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSRDC-Infrastructure' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSRDC-Infrastructure'
}
if((Get-WindowsOptionalFeature -FeatureName 'TelnetClient' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'TelnetClient'
}
if((Get-WindowsOptionalFeature -FeatureName 'TIFFIFilter' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'TIFFIFilter'
}
if((Get-WindowsOptionalFeature -FeatureName 'WorkFolders-Client' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WorkFolders-Client'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-Foundation-Features' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-Foundation-Features'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-Foundation-InternetPrinting-Client' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-Foundation-InternetPrinting-Client'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-Foundation-LPDPrintService' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-Foundation-LPDPrintService'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-Foundation-LPRPortMonitor' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-Foundation-LPRPortMonitor'
}
if((Get-WindowsOptionalFeature -FeatureName 'MicrosoftWindowsPowerShellV2Root' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MicrosoftWindowsPowerShellV2Root'
}
if((Get-WindowsOptionalFeature -FeatureName 'MicrosoftWindowsPowerShellV2' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MicrosoftWindowsPowerShellV2'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Windows-Subsystem-Linux' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Windows-Subsystem-Linux'
}
if((Get-WindowsOptionalFeature -FeatureName 'HypervisorPlatform' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'HypervisorPlatform'
}
if((Get-WindowsOptionalFeature -FeatureName 'VirtualMachinePlatform' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'VirtualMachinePlatform'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-ProjFS' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-ProjFS'
}
if((Get-WindowsOptionalFeature -FeatureName 'Containers-DisposableClientVM' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Containers-DisposableClientVM'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-All' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-All'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Tools-All' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Tools-All'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Management-PowerShell' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Management-PowerShell'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Hypervisor' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Hypervisor'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Services' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Services'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Management-Clients' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Management-Clients'
}
if((Get-WindowsOptionalFeature -FeatureName 'HostGuardian' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'HostGuardian'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-DeviceLockdown' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-DeviceLockdown'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-EmbeddedShellLauncher' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-EmbeddedShellLauncher'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-EmbeddedBootExp' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-EmbeddedBootExp'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-EmbeddedLogon' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-EmbeddedLogon'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-KeyboardFilter' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-KeyboardFilter'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-UnifiedWriteFilter' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-UnifiedWriteFilter'
}
if((Get-WindowsOptionalFeature -FeatureName 'DirectoryServices-ADAM-Client' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'DirectoryServices-ADAM-Client'
}
if((Get-WindowsOptionalFeature -FeatureName 'NetFx4Extended-ASPNET45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'NetFx4Extended-ASPNET45'
}
if((Get-WindowsOptionalFeature -FeatureName 'ServicesForNFS-ClientOnly' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'ServicesForNFS-ClientOnly'
}
if((Get-WindowsOptionalFeature -FeatureName 'ClientForNFS-Infrastructure' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'ClientForNFS-Infrastructure'
}
if((Get-WindowsOptionalFeature -FeatureName 'NFS-Administration' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'NFS-Administration'
}
if((Get-WindowsOptionalFeature -FeatureName 'SMB1Protocol' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SMB1Protocol'
}
if((Get-WindowsOptionalFeature -FeatureName 'SMB1Protocol-Client' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SMB1Protocol-Client'
}
if((Get-WindowsOptionalFeature -FeatureName 'SMB1Protocol-Server' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SMB1Protocol-Server'
}
if((Get-WindowsOptionalFeature -FeatureName 'SMB1Protocol-Deprecation' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SMB1Protocol-Deprecation'
}
if((Get-WindowsOptionalFeature -FeatureName 'MultiPoint-Connector' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MultiPoint-Connector'
}
if((Get-WindowsOptionalFeature -FeatureName 'MultiPoint-Connector-Services' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MultiPoint-Connector-Services'
}
if((Get-WindowsOptionalFeature -FeatureName 'MultiPoint-Tools' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MultiPoint-Tools'
}
if((Get-WindowsOptionalFeature -FeatureName 'Internet-Explorer-Optional-amd64' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Internet-Explorer-Optional-amd64'
}

$Windows11Apps = @(

#Unnecessary Windows 11 Apps
"Clipchamp.Clipchamp"
"Microsoft.549981C3F5F10"
"Microsoft.BingNews_4.2.27001.0"
"Microsoft.BingWeather"
"Microsoft.DesktopAppInstaller"
"Microsoft.GamingApp"
"Microsoft.GetHelp"
"Microsoft.Getstarted"
"Microsoft.MicrosoftOfficeHub"
"Microsoft.MicrosoftSolitaireCollection"
"Microsoft.MicrosoftStickyNotes"
"Microsoft.People"
"Microsoft.PowerAutomateDesktop"
"Microsoft.ScreenSketch"
"Microsoft.SecHealthUI"
"Microsoft.Todos"
"Microsoft.Windows.Photos"
"Microsoft.WindowsAlarms"
"Microsoft.WindowsCamera"
"microsoft.windowscommunicationsapps"
"Microsoft.WindowsFeedbackHub"
"Microsoft.WindowsMaps"
"Microsoft.WindowsSoundRecorder"
"Microsoft.WindowsTerminal"
"Microsoft.Xbox.TCUI"
"Microsoft.XboxGameOverlay"
"Microsoft.XboxGamingOverlay"
"Microsoft.XboxIdentityProvider"
"Microsoft.XboxSpeechToTextOverlay"
"Microsoft.ZuneMusic"
"Microsoft.ZuneVideo"
"MicrosoftCorporationII.QuickAssist"
"MicrosoftWindows.Client.WebExperience"


)
foreach ($App in $Windows11Apps) {
Get-AppxPackage -Name $App| Remove-AppxPackage
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $App | Remove-AppxProvisionedPackage -Online
}

if((Get-WindowsCapability -Name 'Accessibility.Braille~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Accessibility.Braille~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Analog.Holographic.Desktop~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Analog.Holographic.Desktop~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'App.StepsRecorder~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'App.StepsRecorder~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'App.WirelessDisplay.Connect~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'App.WirelessDisplay.Connect~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Browser.InternetExplorer~~~~0.0.11.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Browser.InternetExplorer~~~~0.0.11.0'
}
if((Get-WindowsCapability -Name 'Hello.Face.20134~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Hello.Face.20134~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'MathRecognizer~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'MathRecognizer~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Media.WindowsMediaPlayer~~~~0.0.12.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Media.WindowsMediaPlayer~~~~0.0.12.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Onecore.StorageManagement~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Onecore.StorageManagement~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Wallpapers.Extended~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Wallpapers.Extended~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.WebDriver~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.WebDriver~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Ethernet.Client.Intel.E1i68x64~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Ethernet.Client.Intel.E1i68x64~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Ethernet.Client.Intel.E2f68~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Ethernet.Client.Intel.E2f68~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Ethernet.Client.Realtek.Rtcx21x64~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Ethernet.Client.Realtek.Rtcx21x64~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Ethernet.Client.Vmware.Vmxnet3~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Ethernet.Client.Vmware.Vmxnet3~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.IoTDeviceUpdateCenter~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.IoTDeviceUpdateCenter~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.StorageManagement~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.StorageManagement~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Broadcom.Bcmpciedhd63~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Broadcom.Bcmpciedhd63~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Broadcom.Bcmwl63al~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Broadcom.Bcmwl63al~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Broadcom.Bcmwl63a~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Broadcom.Bcmwl63a~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwbw02~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwbw02~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwew00~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwew00~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwew01~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwew01~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwlv64~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwlv64~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwns64~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwns64~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwsw00~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwsw00~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw02~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw02~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw04~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw04~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw06~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw06~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw08~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw08~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw10~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Intel.Netwtw10~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Marvel.Mrvlpcie8897~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Marvel.Mrvlpcie8897~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Qualcomm.Athw8x~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Qualcomm.Athw8x~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Qualcomm.Athwnx~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Qualcomm.Athwnx~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Qualcomm.Qcamain10x64~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Qualcomm.Qcamain10x64~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Ralink.Netr28x~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Ralink.Netr28x~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtl8187se~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtl8187se~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtl8192se~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtl8192se~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtl819xp~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtl819xp~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtl85n64~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtl85n64~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtwlane01~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtwlane01~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtwlane13~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtwlane13~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtwlane~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.Wifi.Client.Realtek.Rtwlane~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Microsoft.Windows.WordPad~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Microsoft.Windows.WordPad~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Msix.PackagingTool.Driver~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Msix.PackagingTool.Driver~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Network.Irda~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Network.Irda~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'OneCoreUAP.OneSync~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'OneCoreUAP.OneSync~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'OpenSSH.Client~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'OpenSSH.Client~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'OpenSSH.Server~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'OpenSSH.Server~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Print.Fax.Scan~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Print.Fax.Scan~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Print.Management.Console~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Print.Management.Console~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'RasCMAK.Client~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'RasCMAK.Client~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'RIP.Listener~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'RIP.Listener~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.AzureStack.HCI.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.AzureStack.HCI.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.CertificateServices.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.CertificateServices.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.DHCP.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.DHCP.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.Dns.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.Dns.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.FileServices.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.FileServices.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.IPAM.Client.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.IPAM.Client.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.LLDP.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.LLDP.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.NetworkController.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.NetworkController.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.ServerManager.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.ServerManager.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.StorageReplica.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.StorageReplica.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.SystemInsights.Management.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.SystemInsights.Management.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.VolumeActivation.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.VolumeActivation.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Rsat.WSUS.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Rsat.WSUS.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'SNMP.Client~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'SNMP.Client~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Tools.DeveloperMode.Core~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Tools.DeveloperMode.Core~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Tools.Graphics.DirectX~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Tools.Graphics.DirectX~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Tpm.TpmDiagnostics~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Tpm.TpmDiagnostics~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Windows.Desktop.EMS-SAC.Tools~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Windows.Desktop.EMS-SAC.Tools~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'Windows.Kernel.LA57~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'Windows.Kernel.LA57~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'WMI-SNMP-Provider.Client~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'WMI-SNMP-Provider.Client~~~~0.0.1.0'
}
if((Get-WindowsCapability -Name 'WMIC~~~~' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'WMIC~~~~'
}
if((Get-WindowsCapability -Name 'XPS.Viewer~~~~0.0.1.0' -Online).State -eq "Installed") {
    Remove-WindowsCapability -Online -Name 'XPS.Viewer~~~~0.0.1.0'
}

if((Get-WindowsOptionalFeature -FeatureName 'Printing-PrintToPDFServices-Features' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-PrintToPDFServices-Features'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-XPSServices-Features' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-XPSServices-Features'
}
if((Get-WindowsOptionalFeature -FeatureName 'TelnetClient' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'TelnetClient'
}
if((Get-WindowsOptionalFeature -FeatureName 'TFTP' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'TFTP'
}
if((Get-WindowsOptionalFeature -FeatureName 'TIFFIFilter' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'TIFFIFilter'
}
if((Get-WindowsOptionalFeature -FeatureName 'LegacyComponents' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'LegacyComponents'
}
if((Get-WindowsOptionalFeature -FeatureName 'DirectPlay' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'DirectPlay'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSRDC-Infrastructure' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSRDC-Infrastructure'
}
if((Get-WindowsOptionalFeature -FeatureName 'Windows-Identity-Foundation' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Windows-Identity-Foundation'
}
if((Get-WindowsOptionalFeature -FeatureName 'MicrosoftWindowsPowerShellV2Root' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MicrosoftWindowsPowerShellV2Root'
}
if((Get-WindowsOptionalFeature -FeatureName 'MicrosoftWindowsPowerShellV2' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MicrosoftWindowsPowerShellV2'
}
if((Get-WindowsOptionalFeature -FeatureName 'SimpleTCP' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SimpleTCP'
}
if((Get-WindowsOptionalFeature -FeatureName 'NetFx4Extended-ASPNET45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'NetFx4Extended-ASPNET45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-Services45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-Services45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-HTTP-Activation45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-HTTP-Activation45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-TCP-Activation45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-TCP-Activation45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-Pipe-Activation45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-Pipe-Activation45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-MSMQ-Activation45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-MSMQ-Activation45'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-TCP-PortSharing45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-TCP-PortSharing45'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebServerRole' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebServerRole'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebServer' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebServer'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-CommonHttpFeatures' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-CommonHttpFeatures'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpErrors' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpErrors'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpRedirect' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpRedirect'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ApplicationDevelopment' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ApplicationDevelopment'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-Security' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-Security'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-RequestFiltering' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-RequestFiltering'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-NetFxExtensibility' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-NetFxExtensibility'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-NetFxExtensibility45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-NetFxExtensibility45'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HealthAndDiagnostics' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HealthAndDiagnostics'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpLogging' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpLogging'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-LoggingLibraries' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-LoggingLibraries'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-RequestMonitor' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-RequestMonitor'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpTracing' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpTracing'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-URLAuthorization' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-URLAuthorization'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-IPSecurity' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-IPSecurity'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-Performance' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-Performance'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpCompressionDynamic' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpCompressionDynamic'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebServerManagementTools' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebServerManagementTools'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ManagementScriptingTools' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ManagementScriptingTools'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-IIS6ManagementCompatibility' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-IIS6ManagementCompatibility'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-Metabase' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-Metabase'
}
if((Get-WindowsOptionalFeature -FeatureName 'WAS-WindowsActivationService' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WAS-WindowsActivationService'
}
if((Get-WindowsOptionalFeature -FeatureName 'WAS-ProcessModel' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WAS-ProcessModel'
}
if((Get-WindowsOptionalFeature -FeatureName 'WAS-NetFxEnvironment' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WAS-NetFxEnvironment'
}
if((Get-WindowsOptionalFeature -FeatureName 'WAS-ConfigurationAPI' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WAS-ConfigurationAPI'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HostableWebCore' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HostableWebCore'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-HTTP-Activation' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-HTTP-Activation'
}
if((Get-WindowsOptionalFeature -FeatureName 'WCF-NonHTTP-Activation' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WCF-NonHTTP-Activation'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-StaticContent' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-StaticContent'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-DefaultDocument' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-DefaultDocument'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-DirectoryBrowsing' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-DirectoryBrowsing'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebDAV' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebDAV'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WebSockets' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebSockets'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ApplicationInit' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ApplicationInit'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ISAPIFilter' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ISAPIFilter'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ISAPIExtensions' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ISAPIExtensions'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ASPNET' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ASPNET'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ASPNET45' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ASPNET45'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ASP' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ASP'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-CGI' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-CGI'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ServerSideIncludes' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ServerSideIncludes'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-CustomLogging' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-CustomLogging'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-BasicAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-BasicAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-HttpCompressionStatic' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-HttpCompressionStatic'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ManagementConsole' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ManagementConsole'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ManagementService' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ManagementService'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WMICompatibility' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WMICompatibility'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-LegacyScripts' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-LegacyScripts'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-LegacySnapIn' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-LegacySnapIn'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-FTPServer' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-FTPServer'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-FTPSvc' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-FTPSvc'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-FTPExtensibility' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-FTPExtensibility'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-Container' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-Container'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-DCOMProxy' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-DCOMProxy'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-Server' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-Server'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-ADIntegration' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-ADIntegration'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-HTTP' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-HTTP'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-Multicast' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-Multicast'
}
if((Get-WindowsOptionalFeature -FeatureName 'MSMQ-Triggers' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MSMQ-Triggers'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-CertProvider' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-CertProvider'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-WindowsAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WindowsAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-DigestAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-DigestAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ClientCertificateMappingAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ClientCertificateMappingAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-IISCertificateMappingAuthentication' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-IISCertificateMappingAuthentication'
}
if((Get-WindowsOptionalFeature -FeatureName 'IIS-ODBCLogging' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-ODBCLogging'
}
if((Get-WindowsOptionalFeature -FeatureName 'SMB1Protocol-Deprecation' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SMB1Protocol-Deprecation'
}
if((Get-WindowsOptionalFeature -FeatureName 'MediaPlayback' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MediaPlayback'
}
if((Get-WindowsOptionalFeature -FeatureName 'WindowsMediaPlayer' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WindowsMediaPlayer'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-DeviceLockdown' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-DeviceLockdown'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-EmbeddedShellLauncher' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-EmbeddedShellLauncher'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-EmbeddedBootExp' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-EmbeddedBootExp'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-EmbeddedLogon' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-EmbeddedLogon'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-KeyboardFilter' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-KeyboardFilter'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-UnifiedWriteFilter' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-UnifiedWriteFilter'
}
if((Get-WindowsOptionalFeature -FeatureName 'HostGuardian' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'HostGuardian'
}
if((Get-WindowsOptionalFeature -FeatureName 'MultiPoint-Connector' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MultiPoint-Connector'
}
if((Get-WindowsOptionalFeature -FeatureName 'MultiPoint-Connector-Services' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MultiPoint-Connector-Services'
}
if((Get-WindowsOptionalFeature -FeatureName 'MultiPoint-Tools' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'MultiPoint-Tools'
}
if((Get-WindowsOptionalFeature -FeatureName 'AppServerClient' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'AppServerClient'
}
if((Get-WindowsOptionalFeature -FeatureName 'SearchEngine-Client-Package' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SearchEngine-Client-Package'
}
if((Get-WindowsOptionalFeature -FeatureName 'WorkFolders-Client' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'WorkFolders-Client'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-Foundation-Features' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-Foundation-Features'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-Foundation-InternetPrinting-Client' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-Foundation-InternetPrinting-Client'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-Foundation-LPDPrintService' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-Foundation-LPDPrintService'
}
if((Get-WindowsOptionalFeature -FeatureName 'Printing-Foundation-LPRPortMonitor' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Printing-Foundation-LPRPortMonitor'
}
if((Get-WindowsOptionalFeature -FeatureName 'HypervisorPlatform' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'HypervisorPlatform'
}
if((Get-WindowsOptionalFeature -FeatureName 'VirtualMachinePlatform' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'VirtualMachinePlatform'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Windows-Subsystem-Linux' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Windows-Subsystem-Linux'
}
if((Get-WindowsOptionalFeature -FeatureName 'Client-ProjFS' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Client-ProjFS'
}
if((Get-WindowsOptionalFeature -FeatureName 'Containers-DisposableClientVM' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Containers-DisposableClientVM'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-All' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-All'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Tools-All' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Tools-All'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Management-PowerShell' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Management-PowerShell'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Hypervisor' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Hypervisor'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Services' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Services'
}
if((Get-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Management-Clients' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Microsoft-Hyper-V-Management-Clients'
}
if((Get-WindowsOptionalFeature -FeatureName 'DataCenterBridging' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'DataCenterBridging'
}
if((Get-WindowsOptionalFeature -FeatureName 'DirectoryServices-ADAM-Client' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'DirectoryServices-ADAM-Client'
}
if((Get-WindowsOptionalFeature -FeatureName 'ServicesForNFS-ClientOnly' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'ServicesForNFS-ClientOnly'
}
if((Get-WindowsOptionalFeature -FeatureName 'ClientForNFS-Infrastructure' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'ClientForNFS-Infrastructure'
}
if((Get-WindowsOptionalFeature -FeatureName 'NFS-Administration' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'NFS-Administration'
}
if((Get-WindowsOptionalFeature -FeatureName 'Containers-HNS' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Containers-HNS'
}
if((Get-WindowsOptionalFeature -FeatureName 'Containers-SDN' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'Containers-SDN'
}
if((Get-WindowsOptionalFeature -FeatureName 'SMB1Protocol' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SMB1Protocol'
}
if((Get-WindowsOptionalFeature -FeatureName 'SMB1Protocol-Client' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SMB1Protocol-Client'
}
if((Get-WindowsOptionalFeature -FeatureName 'SMB1Protocol-Server' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SMB1Protocol-Server'
}
if((Get-WindowsOptionalFeature -FeatureName 'SmbDirect' -Online).State -eq "Enabled") {
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'SmbDirect'
}
Write-Output "Done"

# Remove Teams
Write-Output "Removing Teams..."
$TeamsPath = [System.IO.Path]::Combine($env:LOCALAPPDATA, 'Microsoft', 'Teams')
$TeamsUpdateExePath = [System.IO.Path]::Combine($TeamsPath, 'Update.exe')

Stop-Process -Name "*teams*" -Force -ErrorAction SilentlyContinue

if ([System.IO.File]::Exists($TeamsUpdateExePath)) {
    # Uninstall app
    $proc = Start-Process $TeamsUpdateExePath -uninstall -s -PassThru | Out-Null
    $proc.WaitForExit()
}

Get-AppxPackage "*Teams*" | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage "*Teams*" -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

if ([System.IO.Directory]::Exists($TeamsPath)) {
    Remove-Item $TeamsPath -Force -Recurse -ErrorAction SilentlyContinue | Out-Null
}

# Uninstall from Uninstall registry key UninstallString
$us = (Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | Get-ItemProperty | Where-Object { $_.DisplayName -like '*Teams*'}).UninstallString
if ($us.Length -gt 0) {
    $us = ($us.Replace('I', 'uninstall') + 'quiet').Replace('', '')
    $FilePath = ($us.Substring(0, $us.IndexOf('.exe') + 4).Trim())
    $ProcessArgs = ($us.Substring($us.IndexOf('.exe') + 5).Trim().replace('', ''))
    $proc = Start-Process -FilePath $FilePath -Args $ProcessArgs -PassThru | Out-Null
    $proc.WaitForExit()
}
Write-Output "Done"

# Disable OneDrive
Write-Output "Disabling OneDrive..."
Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
Start-Sleep -s 2
$onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
If (!(Test-Path $onedrive)) {
$onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
}
Start-Process $onedrive "/uninstall" -NoNewWindow -Wait | Out-Null
Start-Sleep -s 2
Stop-Process -Name "explorer" -Force -ErrorAction SilentlyContinue
Start-Sleep -s 2
If ((Get-ChildItem -Path "$env:USERPROFILE\OneDrive" -ErrorAction SilentlyContinue | Measure-Object).Count -eq 0) {
Remove-Item -Path "$env:USERPROFILE\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue | Out-Null
}
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Path "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Path "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse -ErrorAction SilentlyContinue | Out-Null
If (!(Test-Path "HKCR:")) {
New-PSDrive -Name "HKCR" -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" | Out-Null
}
Remove-Item -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Type DWord -Value 1 | Out-Null
Write-Output "Done"

# Disable Application Suggestions and Automatic Installation
Write-Output "Disabling Application Suggestions..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-310093Enabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-314559Enabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353696Enabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement")) {
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Name "ScoobeSystemSettingEnabled" -Type DWord -Value 0 | Out-Null
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace")) {
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" -Name "AllowSuggestedAppsInWindowsInkWorkspace" -Type DWord -Value 0 | Out-Null
# Empty placeholder tile collection in registry cache and restart Start Menu process to reload the cache
If ([System.Environment]::OSVersion.Version.Build -ge 17134) {
$key = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\*windows.data.placeholdertilecollection\Current"
Set-ItemProperty -Path $key.PSPath -Name "Data" -Type Binary -Value $key.Data[0..15] | Out-Null
Stop-Process -Name "ShellExperienceHost" -Force -ErrorAction SilentlyContinue
}

# Unpin All Start Menu Tiles
Write-Output "Unpinning All Start Menu Tiles..."
$key = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\*start.tilegrid`$windows.data.curatedtilecollection.tilecollection\Current"
$data = $key.Data[0..25] + ([byte[]](202,50,0,226,44,1,1,0,0))
Set-ItemProperty -Path $key.PSPath -Name "Data" -Type Binary -Value $data | Out-Null
Stop-Process -Name "ShellExperienceHost" -Force -ErrorAction SilentlyContinue

# Firewall Block Telemetry
$ErrorActionPreference = "silentlycontinue"
New-Item $ENV:temp\Firewall_Telemetry.reg -ItemType File  -Value "Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules]
""{90A0B842-5C60-467A-B246-31864E723044}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=1.9.56.27|RA4=1.9.56.43|RA4=1.9.56.49|RA4=1.9.56.66|RA4=1.9.56.96|RA4=1.9.56.104|RA4=1.9.56.145|RA4=1.9.56.154|RA4=1.186.191.200|RA4=1.186.191.201|RA4=1.186.191.203|RA4=1.186.191.209|RA4=1.186.191.211|RA4=1.186.200.202|RA4=1.186.200.203|RA4=1.224.180.79|RA4=1.224.181.20|RA4=103.243.220.231|RA4=103.243.220.234|RA4=103.243.221.17|RA4=103.243.221.51|RA4=103.243.221.75|RA4=103.243.221.87|RA4=103.243.221.108|RA4=103.243.221.109|RA4=103.243.221.112|RA4=103.243.222.7|RA4=103.243.222.24|RA4=103.243.222.32|RA4=103.243.222.33|RA4=103.243.222.37|RA4=103.243.222.40|RA4=103.243.222.41|RA4=103.243.222.48|RA4=103.243.222.61|RA4=103.243.222.84|RA4=103.243.222.85|RA4=103.243.222.91|RA4=103.243.222.155|RA4=104.64.7.135|RA4=104.64.11.8|RA4=104.64.22.211|RA4=104.64.27.144|RA4=104.64.31.38|RA4=104.64.36.192|RA4=104.64.115.17|RA4=104.64.119.64|RA4=104.64.120.106|RA4=104.64.120.213|RA4=104.64.157.95|RA4=104.64.164.152|RA4=104.64.210.149|RA4=104.64.220.181|RA4=104.64.224.71|RA4=104.64.234.202|RA4=104.65.74.182|RA4=104.65.79.217|RA4=104.65.215.72|RA4=104.65.215.201|RA4=104.65.233.182|RA4=104.65.234.152|RA4=104.65.239.243|RA4=104.66.4.39|RA4=104.66.10.93|RA4=104.66.13.129|RA4=104.66.13.162|RA4=104.66.16.206|RA4=104.66.17.12|RA4=104.66.37.194|RA4=104.66.40.35|RA4=104.66.52.63|RA4=104.66.67.202|RA4=104.66.91.186|RA4=104.66.93.129|RA4=104.66.99.201|RA4=104.66.109.105|RA4=104.66.118.195|RA4=104.66.122.38|RA4=104.66.129.60|RA4=104.66.196.74|RA4=104.66.204.85|RA4=104.66.237.55|RA4=104.66.244.49|RA4=104.66.246.158|RA4=104.67.6.19|RA4=104.67.15.189|RA4=104.67.39.118|RA4=104.67.42.12|RA4=104.67.43.61|RA4=104.67.44.82|RA4=104.67.46.7|RA4=104.67.66.201|RA4=104.67.73.185|RA4=104.67.81.155|RA4=104.67.86.142|RA4=104.67.86.151|RA4=104.67.88.181|RA4=104.67.93.83|RA4=104.67.101.204|RA4=104.67.109.241|RA4=104.67.205.219|RA4=104.67.213.190|RA4=104.67.225.122|RA4=104.67.226.244|RA4=104.68.68.87|RA4=104.68.77.34|RA4=104.68.81.34|RA4=104.68.83.80|RA4=104.68.102.130|RA4=104.68.106.130|RA4=104.68.108.80|RA4=104.68.116.87|RA4=104.68.122.11|RA4=104.68.122.246|RA4=104.68.129.165|RA4=104.68.136.9|RA4=104.68.148.39|RA4=104.68.148.237|RA4=104.68.184.151|RA4=104.68.213.111|RA4=104.69.6.237|RA4=104.69.8.109|RA4=104.69.10.190|RA4=104.69.11.227|RA4=104.69.17.181|RA4=104.69.37.144|RA4=104.69.40.24|RA4=104.69.44.46|RA4=104.69.52.70|RA4=104.69.67.29|RA4=104.69.71.66|RA4=104.69.71.94|RA4=104.69.72.163|RA4=104.69.113.196|RA4=104.69.119.19|RA4=104.69.126.239|RA4=104.69.134.65|RA4=104.69.135.172|RA4=104.69.243.159|RA4=104.70.6.76|RA4=104.70.12.59|RA4=104.70.55.184|RA4=104.70.72.220|RA4=104.70.82.120|RA4=104.70.84.205|RA4=104.70.86.66|RA4=104.70.99.105|RA4=104.70.120.21|RA4=104.70.131.94|RA4=104.70.139.218|RA4=104.70.141.176|RA4=104.70.143.149|RA4=104.70.145.161|RA4=104.70.147.232|RA4=104.70.149.178|RA4=104.70.151.136|RA4=104.70.156.12|RA4=104.70.178.57|RA4=104.70.178.64|RA4=104.70.185.59|RA4=104.70.188.236|RA4=104.70.192.89|RA4=104.70.200.20|RA4=104.70.213.80|RA4=104.70.213.239|RA4=104.70.214.96|RA4=104.70.215.194|RA4=104.70.216.179|RA4=104.70.234.22|RA4=104.70.246.120|RA4=104.70.248.211|RA4=104.70.253.152|RA4=104.71.0.169|RA4=104.71.7.77|RA4=104.71.10.18|RA4=104.71.13.225|RA4=104.71.24.67|RA4=104.71.41.165|RA4=104.71.50.35|RA4=104.71.65.53|RA4=104.71.77.251|RA4=104.71.84.219|RA4=104.71.96.195|RA4=104.71.116.95|RA4=104.71.117.29|RA4=104.71.131.39|RA4=104.71.131.40|RA4=104.71.131.45|RA4=104.71.131.53|RA4=104.71.136.84|RA4=104.71.141.63|RA4=104.71.154.10|RA4=104.71.155.158|RA4=104.71.158.2|RA4=104.71.159.162|RA4=104.71.160.48|RA4=104.71.164.126|RA4=104.71.167.173|RA4=104.71.183.229|RA4=104.71.185.14|RA4=104.71.193.38|RA4=104.71.194.216|RA4=104.71.198.188|RA4=104.71.238.142|RA4=104.71.242.141|RA4=104.71.253.201|RA4=104.72.70.27|RA4=104.72.70.56|RA4=104.72.70.57|RA4=104.72.70.73|RA4=104.72.70.82|RA4=104.72.70.83|RA4=104.72.76.218|RA4=104.72.84.118|RA4=104.72.86.67|RA4=104.72.92.16|RA4=104.72.96.47|RA4=104.72.120.187|RA4=104.72.170.32|RA4=104.72.172.220|RA4=104.72.178.98|RA4=104.72.185.86|RA4=104.72.220.183|RA4=104.72.243.185|RA4=104.73.8.147|RA4=104.73.9.223|RA4=104.73.13.179|RA4=104.73.14.110|RA4=104.73.20.91|RA4=104.73.22.189|RA4=104.73.31.192|RA4=104.73.39.146|RA4=104.73.45.146|RA4=104.73.62.67|RA4=104.73.92.177|RA4=104.73.93.244|RA4=104.73.101.226|RA4=104.73.105.230|RA4=104.73.115.82|RA4=104.73.123.75|RA4=104.73.124.132|RA4=104.73.129.241|RA4=104.73.139.144|RA4=104.73.142.70|RA4=104.73.147.123|RA4=104.73.154.194|RA4=104.73.156.204|RA4=104.73.160.17|RA4=104.73.160.42|RA4=104.73.160.64|RA4=104.73.160.75|RA4=104.73.160.82|RA4=104.73.160.107|RA4=104.73.160.112|RA4=104.73.183.52|RA4=104.73.190.63|RA4=104.73.195.28|RA4=104.73.196.114|RA4=104.73.213.7|RA4=104.73.215.154|RA4=104.73.232.205|RA4=104.73.243.175|RA4=104.73.249.235|RA4=104.73.250.184|RA4=104.73.252.241|RA4=104.73.253.120|RA4=104.73.255.90|RA4=104.74.3.116|RA4=104.74.3.243|RA4=104.74.5.131|RA4=104.74.16.244|RA4=104.74.18.221|RA4=104.74.33.228|RA4=104.74.39.37|RA4=104.74.39.242|RA4=104.74.40.25|RA4=104.74.41.55|RA4=104.74.54.153|RA4=104.74.74.55|RA4=104.74.75.131|RA4=104.74.76.251|RA4=104.74.80.129|RA4=104.74.83.193|RA4=104.74.106.111|RA4=104.74.124.109|RA4=104.74.127.48|RA4=104.74.127.232|RA4=104.74.136.197|RA4=104.74.140.55|RA4=104.74.143.226|RA4=104.74.152.71|RA4=104.74.156.39|RA4=104.74.156.99|RA4=104.74.159.83|RA4=104.74.162.162|RA4=104.74.192.133|RA4=104.74.197.118|RA4=104.74.202.15|RA4=104.74.206.9|RA4=104.74.209.77|RA4=104.74.215.67|RA4=104.74.230.221|RA4=104.74.231.65|RA4=104.74.231.235|RA4=104.74.234.109|RA4=104.74.236.92|RA4=104.74.243.57|RA4=104.74.245.91|RA4=104.74.246.209|RA4=104.74.251.108|RA4=104.74.252.209|RA4=104.74.252.250|RA4=104.75.11.78|RA4=104.75.12.16|RA4=104.75.12.19|RA4=104.75.17.52|RA4=104.75.103.16|RA4=104.75.108.202|RA4=104.75.120.140|RA4=104.75.182.73|RA4=104.75.184.139|RA4=104.100.186.221|RA4=104.101.148.180|RA4=104.101.168.161|RA4=104.101.171.194|RA4=104.101.175.44|RA4=104.101.243.189|RA4=104.101.249.110|RA4=104.102.7.101|RA4=104.102.149.119|RA4=104.102.167.201|RA4=104.102.171.49|RA4=104.102.191.75|RA4=104.102.224.92|RA4=104.102.224.215|RA4=104.102.231.51|RA4=104.102.236.97|RA4=104.103.72.139|RA4=104.103.72.145|RA4=104.103.72.162|RA4=104.103.72.168|RA4=104.103.72.169|RA4=104.103.72.177|RA4=104.103.72.203|RA4=104.103.77.187|RA4=104.103.80.71|RA4=104.103.85.29|RA4=104.103.85.230|RA4=104.103.96.124|RA4=104.103.184.200|RA4=104.103.199.30|RA4=104.103.216.212|RA4=104.103.219.56|RA4=104.103.219.153|RA4=104.103.223.187|RA4=104.103.224.246|RA4=104.103.239.97|RA4=104.104.27.74|RA4=104.104.32.213|RA4=104.104.35.73|RA4=104.104.54.198|RA4=104.104.57.49|RA4=104.104.83.113|RA4=104.104.87.195|RA4=104.104.128.32|RA4=104.104.129.62|RA4=104.104.166.14|RA4=104.104.166.137|RA4=104.104.173.193|RA4=104.104.180.142|RA4=104.104.251.65|RA4=104.105.126.130|RA4=104.105.175.156|RA4=104.105.175.186|RA4=104.105.183.70|RA4=104.105.183.225|RA4=104.105.204.221|RA4=104.105.211.104|RA4=104.106.87.34|RA4=104.106.101.244|RA4=104.106.103.133|RA4=104.106.120.169|RA4=104.106.124.186|RA4=104.106.241.111|RA4=104.106.248.16|RA4=104.106.249.119|RA4=104.106.250.147|RA4=104.107.30.220|RA4=104.107.39.56|RA4=104.107.60.114|RA4=104.107.60.161|RA4=104.107.60.201|RA4=104.107.60.208|RA4=104.107.144.194|RA4=104.107.145.77|RA4=104.107.146.203|RA4=104.108.33.119|RA4=104.108.34.229|RA4=104.108.40.176|RA4=104.108.118.28|RA4=104.108.169.81|RA4=104.108.169.196|RA4=104.108.180.14|RA4=104.109.53.9|RA4=104.109.53.10|RA4=104.109.53.11|RA4=104.109.53.27|RA4=104.109.53.34|RA4=104.109.54.49|RA4=104.109.66.31|RA4=104.109.102.6|RA4=104.109.102.25|RA4=104.109.105.196|RA4=104.110.2.76|RA4=104.110.15.179|RA4=104.110.27.221|RA4=104.111.195.97|RA4=104.111.199.86|RA4=104.111.213.181|RA4=104.111.225.75|RA4=104.111.243.17|RA4=104.114.147.224|RA4=104.114.152.77|RA4=104.114.156.189|RA4=104.114.159.235|RA4=104.114.183.248|RA4=104.115.118.172|RA4=104.115.121.90|RA4=104.115.246.145|RA4=104.115.249.99|RA4=104.116.72.236|RA4=104.116.83.3|RA4=104.117.218.80|RA4=104.118.104.10|RA4=104.118.104.24|RA4=104.118.104.25|RA4=104.118.104.40|RA4=104.118.220.166|RA4=104.120.218.180|RA4=104.120.243.129|RA4=104.120.254.53|RA4=104.121.11.180|RA4=104.121.113.223|RA4=104.121.150.8|RA4=104.121.150.42|RA4=104.121.165.61|RA4=104.121.170.189|RA4=104.122.60.238|RA4=104.122.67.7|RA4=104.122.85.42|RA4=104.122.242.163|RA4=104.123.228.143|RA4=104.123.230.139|RA4=104.123.230.246|RA4=104.124.100.118|RA4=104.124.112.70|RA4=104.124.128.161|RA4=104.124.137.154|RA4=104.125.4.19|RA4=104.125.13.138|RA4=104.125.17.90|RA4=104.125.21.74|RA4=104.125.22.106|RA4=104.126.38.67|RA4=104.126.85.243|RA4=104.126.94.195|RA4=104.126.118.134|RA4=104.126.133.13|RA4=104.127.54.148|RA4=104.127.56.50|RA4=104.127.58.56|RA4=104.129.67.168|RA4=104.129.67.170|RA4=104.129.67.176|RA4=104.129.67.179|RA4=104.129.67.186|RA4=104.254.123.58|RA4=104.254.123.75|RA4=104.254.123.88|RA4=104.254.123.99|RA4=104.254.123.154|RA4=104.254.123.155|RA4=104.254.148.19|RA4=104.254.148.20|RA4=104.254.148.46|RA4=104.254.148.48|RA4=104.254.149.58|RA4=104.254.149.59|RA4=104.254.150.4|RA4=104.254.150.9|RA4=104.254.150.11|RA4=104.254.150.13|RA4=104.254.150.21|RA4=104.254.150.37|RA4=104.254.150.58|RA4=104.254.150.59|RA4=104.254.150.69|RA4=104.254.150.70|RA4=104.254.150.77|RA4=104.254.150.79|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-1|""
""{664FFD59-4D1C-4EC4-AE8F-2BC003155B8C}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=104.75.3.204|RA4=104.75.19.138|RA4=104.75.21.202|RA4=104.75.23.228|RA4=104.75.23.235|RA4=104.75.24.80|RA4=104.75.25.16|RA4=104.75.30.37|RA4=104.75.34.60|RA4=104.75.37.107|RA4=104.75.61.55|RA4=104.75.63.29|RA4=104.75.66.208|RA4=104.75.67.66|RA4=104.75.68.163|RA4=104.75.70.173|RA4=104.75.77.190|RA4=104.75.80.94|RA4=104.75.80.110|RA4=104.75.84.10|RA4=104.75.84.19|RA4=104.75.84.24|RA4=104.75.84.25|RA4=104.75.84.27|RA4=104.75.86.143|RA4=104.75.87.71|RA4=104.75.90.11|RA4=104.75.91.171|RA4=104.75.194.141|RA4=104.75.199.93|RA4=104.75.200.123|RA4=104.75.227.96|RA4=104.75.228.45|RA4=104.75.237.3|RA4=104.75.244.140|RA4=104.75.252.79|RA4=104.76.0.81|RA4=104.76.12.19|RA4=104.76.16.60|RA4=104.76.23.137|RA4=104.76.25.42|RA4=104.76.26.53|RA4=104.76.27.203|RA4=104.76.31.71|RA4=104.76.32.102|RA4=104.76.37.175|RA4=104.76.40.239|RA4=104.76.45.186|RA4=104.76.49.197|RA4=104.76.51.139|RA4=104.76.61.95|RA4=104.76.64.40|RA4=104.76.65.74|RA4=104.76.68.175|RA4=104.76.69.96|RA4=104.76.72.224|RA4=104.76.73.145|RA4=104.76.82.178|RA4=104.76.99.93|RA4=104.76.99.95|RA4=104.76.112.170|RA4=104.76.115.223|RA4=104.76.119.137|RA4=104.76.126.66|RA4=104.76.127.122|RA4=104.76.129.2|RA4=104.76.138.180|RA4=104.76.146.123|RA4=104.76.230.84|RA4=104.76.231.32|RA4=104.76.242.88|RA4=104.76.251.193|RA4=104.77.21.169|RA4=104.77.28.95|RA4=104.77.36.111|RA4=104.77.36.250|RA4=104.77.61.34|RA4=104.77.63.31|RA4=104.77.64.118|RA4=104.77.67.217|RA4=104.77.75.213|RA4=104.77.215.80|RA4=104.77.215.165|RA4=104.77.216.152|RA4=104.77.219.240|RA4=104.77.235.145|RA4=104.77.236.18|RA4=104.77.236.175|RA4=104.77.244.103|RA4=104.77.247.120|RA4=104.78.0.107|RA4=104.78.0.179|RA4=104.78.2.191|RA4=104.78.11.158|RA4=104.78.16.62|RA4=104.78.17.56|RA4=104.78.19.155|RA4=104.78.19.181|RA4=104.78.24.253|RA4=104.78.26.196|RA4=104.78.85.102|RA4=104.78.89.115|RA4=104.78.89.232|RA4=104.78.107.26|RA4=104.78.180.132|RA4=104.78.180.190|RA4=104.78.204.80|RA4=104.78.208.52|RA4=104.78.220.65|RA4=104.79.2.24|RA4=104.79.2.26|RA4=104.79.2.40|RA4=104.79.2.41|RA4=104.79.2.43|RA4=104.79.2.49|RA4=104.79.2.56|RA4=104.79.10.34|RA4=104.79.10.35|RA4=104.79.10.40|RA4=104.79.10.42|RA4=104.79.10.43|RA4=104.79.10.49|RA4=104.79.10.50|RA4=104.79.10.56|RA4=104.79.85.43|RA4=104.79.108.168|RA4=104.79.117.155|RA4=104.79.118.63|RA4=104.79.125.175|RA4=104.79.126.119|RA4=104.79.144.122|RA4=104.79.147.136|RA4=104.79.151.27|RA4=104.79.173.224|RA4=104.79.182.139|RA4=104.79.185.130|RA4=104.79.186.196|RA4=104.79.195.85|RA4=104.79.221.50|RA4=104.79.222.168|RA4=104.79.223.195|RA4=104.79.226.104|RA4=104.79.229.93|RA4=104.79.230.72|RA4=104.79.231.110|RA4=104.79.247.180|RA4=104.79.248.80|RA4=104.79.248.249|RA4=104.80.43.176|RA4=104.80.44.10|RA4=104.80.47.24|RA4=104.80.88.33|RA4=104.80.88.40|RA4=104.80.88.152|RA4=104.80.89.24|RA4=104.80.89.43|RA4=104.80.89.81|RA4=104.80.89.88|RA4=104.80.89.113|RA4=104.80.102.33|RA4=104.80.127.217|RA4=104.80.170.87|RA4=104.80.181.133|RA4=104.80.183.12|RA4=104.80.187.223|RA4=104.80.207.160|RA4=104.80.216.186|RA4=104.80.219.138|RA4=104.80.222.40|RA4=104.80.223.195|RA4=104.80.225.70|RA4=104.80.233.150|RA4=104.80.237.156|RA4=104.81.27.83|RA4=104.81.27.88|RA4=104.81.27.195|RA4=104.81.47.118|RA4=104.81.48.127|RA4=104.81.52.55|RA4=104.81.52.167|RA4=104.81.57.65|RA4=104.81.60.17|RA4=104.81.60.32|RA4=104.81.60.33|RA4=104.81.60.58|RA4=104.81.60.64|RA4=104.81.60.66|RA4=104.81.60.67|RA4=104.81.60.73|RA4=104.81.60.107|RA4=104.81.60.113|RA4=104.81.64.9|RA4=104.81.67.53|RA4=104.81.72.119|RA4=104.81.76.156|RA4=104.81.80.46|RA4=104.81.83.4|RA4=104.81.88.184|RA4=104.81.92.24|RA4=104.81.97.18|RA4=104.81.102.216|RA4=104.81.104.163|RA4=104.81.106.58|RA4=104.81.106.209|RA4=104.81.107.120|RA4=104.81.116.70|RA4=104.81.118.213|RA4=104.81.127.42|RA4=104.81.129.13|RA4=104.81.187.217|RA4=104.81.196.218|RA4=104.81.209.213|RA4=104.81.213.170|RA4=104.81.219.94|RA4=104.81.222.180|RA4=104.81.226.115|RA4=104.81.229.197|RA4=104.81.234.137|RA4=104.81.235.196|RA4=104.81.240.23|RA4=104.81.248.163|RA4=104.81.255.200|RA4=104.82.10.198|RA4=104.82.14.146|RA4=104.82.16.89|RA4=104.82.18.9|RA4=104.82.19.186|RA4=104.82.22.249|RA4=104.82.24.21|RA4=104.82.47.195|RA4=104.82.48.99|RA4=104.82.88.94|RA4=104.82.200.108|RA4=104.82.201.42|RA4=104.82.202.234|RA4=104.82.207.38|RA4=104.82.217.81|RA4=104.82.249.228|RA4=104.82.251.220|RA4=104.83.0.120|RA4=104.83.4.8|RA4=104.83.4.16|RA4=104.83.4.18|RA4=104.83.4.19|RA4=104.83.4.24|RA4=104.83.4.26|RA4=104.83.4.57|RA4=104.83.4.130|RA4=104.83.4.160|RA4=104.83.4.161|RA4=104.83.4.178|RA4=104.83.4.184|RA4=104.83.12.65|RA4=104.83.18.73|RA4=104.83.19.41|RA4=104.83.21.99|RA4=104.83.21.161|RA4=104.83.25.141|RA4=104.83.25.183|RA4=104.83.42.217|RA4=104.83.46.132|RA4=104.83.46.149|RA4=104.83.49.158|RA4=104.83.58.128|RA4=104.83.65.247|RA4=104.83.70.178|RA4=104.83.75.16|RA4=104.83.76.102|RA4=104.83.83.43|RA4=104.83.104.23|RA4=104.83.107.51|RA4=104.83.123.29|RA4=104.83.144.75|RA4=104.83.146.111|RA4=104.83.151.42|RA4=104.83.169.197|RA4=104.83.174.118|RA4=104.83.187.123|RA4=104.83.191.71|RA4=104.83.193.163|RA4=104.83.200.143|RA4=104.83.201.19|RA4=104.83.212.67|RA4=104.83.212.159|RA4=104.83.216.38|RA4=104.83.229.253|RA4=104.83.254.96|RA4=104.84.4.195|RA4=104.84.8.84|RA4=104.84.123.22|RA4=104.84.131.27|RA4=104.84.144.121|RA4=104.84.146.175|RA4=104.84.152.33|RA4=104.84.152.41|RA4=104.84.152.57|RA4=104.84.152.59|RA4=104.84.152.66|RA4=104.84.152.161|RA4=104.84.152.162|RA4=104.84.152.168|RA4=104.84.152.170|RA4=104.84.152.176|RA4=104.84.154.160|RA4=104.84.173.2|RA4=104.84.174.206|RA4=104.84.181.66|RA4=104.84.182.176|RA4=104.84.185.64|RA4=104.84.185.74|RA4=104.84.185.214|RA4=104.84.186.113|RA4=104.84.191.202|RA4=104.84.192.24|RA4=104.84.208.63|RA4=104.84.212.99|RA4=104.84.220.70|RA4=104.84.220.117|RA4=104.84.221.65|RA4=104.84.221.72|RA4=104.84.221.175|RA4=104.84.227.204|RA4=104.85.20.131|RA4=104.85.23.23|RA4=104.85.24.197|RA4=104.85.25.150|RA4=104.85.27.137|RA4=104.85.28.125|RA4=104.85.31.15|RA4=104.85.40.224|RA4=104.85.50.119|RA4=104.85.52.127|RA4=104.85.59.184|RA4=104.85.61.190|RA4=104.85.70.141|RA4=104.85.73.125|RA4=104.85.86.65|RA4=104.85.87.215|RA4=104.85.92.65|RA4=104.85.113.184|RA4=104.85.122.217|RA4=104.85.136.28|RA4=104.85.147.45|RA4=104.85.151.79|RA4=104.85.164.42|RA4=104.85.164.56|RA4=104.85.164.58|RA4=104.85.166.44|RA4=104.85.166.49|RA4=104.85.166.51|RA4=104.85.166.57|RA4=104.85.166.58|RA4=104.85.166.74|RA4=104.85.166.90|RA4=104.85.168.60|RA4=104.85.172.80|RA4=104.85.181.84|RA4=104.85.202.7|RA4=104.85.244.10|RA4=104.85.244.129|RA4=104.85.248.190|RA4=104.85.248.230|RA4=104.85.249.17|RA4=104.85.252.201|RA4=104.85.255.250|RA4=104.86.0.169|RA4=104.86.4.67|RA4=104.86.7.206|RA4=104.86.12.241|RA4=104.86.27.109|RA4=104.86.39.153|RA4=104.86.45.240|RA4=104.86.47.182|RA4=104.86.53.164|RA4=104.86.57.18|RA4=104.86.57.117|RA4=104.86.69.106|RA4=104.86.70.202|RA4=104.86.72.117|RA4=104.86.75.116|RA4=104.86.80.211|RA4=104.86.88.157|RA4=104.86.93.63|RA4=104.86.104.29|RA4=104.86.110.17|RA4=104.86.110.25|RA4=104.86.110.32|RA4=104.86.110.33|RA4=104.86.110.34|RA4=104.86.110.56|RA4=104.86.110.58|RA4=104.86.110.88|RA4=104.86.110.89|RA4=104.86.111.43|RA4=104.86.111.51|RA4=104.86.111.65|RA4=104.86.111.144|RA4=104.86.111.161|RA4=104.86.116.33|RA4=104.86.125.88|RA4=104.86.129.23|RA4=104.86.129.78|RA4=104.86.129.246|RA4=104.86.134.76|RA4=104.86.138.49|RA4=104.86.139.190|RA4=104.86.158.131|RA4=104.86.163.160|RA4=104.86.181.24|RA4=104.86.196.165|RA4=104.86.204.15|RA4=104.86.208.249|RA4=104.86.212.79|RA4=104.86.212.85|RA4=104.86.212.189|RA4=104.86.219.101|RA4=104.86.220.158|RA4=104.86.225.178|RA4=104.86.226.140|RA4=104.86.230.66|RA4=104.86.236.53|RA4=104.86.243.40|RA4=104.86.244.95|RA4=104.87.9.8|RA4=104.87.22.207|RA4=104.87.24.124|RA4=104.87.30.180|RA4=104.87.30.250|RA4=104.87.35.121|RA4=104.87.35.170|RA4=104.87.42.227|RA4=104.87.53.198|RA4=104.87.54.72|RA4=104.87.56.15|RA4=104.87.60.41|RA4=104.87.68.189|RA4=104.87.92.63|RA4=104.87.105.92|RA4=104.87.106.197|RA4=104.87.154.64|RA4=104.87.154.167|RA4=104.87.157.241|RA4=104.87.160.50|RA4=104.87.169.42|RA4=104.87.175.17|RA4=104.87.186.124|RA4=104.87.188.251|RA4=104.87.197.59|RA4=104.87.199.51|RA4=104.87.205.145|RA4=104.87.218.124|RA4=104.87.227.70|RA4=104.87.233.238|RA4=104.87.249.28|RA4=104.88.5.114|RA4=104.88.11.190|RA4=104.88.51.58|RA4=104.88.55.41|RA4=104.88.61.161|RA4=104.88.65.251|RA4=104.88.67.56|RA4=104.88.68.211|RA4=104.88.71.150|RA4=104.88.75.130|RA4=104.88.78.180|RA4=104.88.95.175|RA4=104.88.120.130|RA4=104.88.122.101|RA4=104.88.122.234|RA4=104.88.140.30|RA4=104.88.241.40|RA4=104.89.4.53|RA4=104.89.28.203|RA4=104.89.30.77|RA4=104.89.31.60|RA4=104.89.36.97|RA4=104.89.36.159|RA4=104.89.36.251|RA4=104.89.38.242|RA4=104.89.43.203|RA4=104.89.126.106|RA4=104.89.127.169|RA4=104.89.138.176|RA4=104.89.142.106|RA4=104.89.149.25|RA4=104.89.149.216|RA4=104.89.163.239|RA4=104.89.177.39|RA4=104.89.189.164|RA4=104.89.191.79|RA4=104.89.195.152|RA4=104.89.203.179|RA4=104.89.223.140|RA4=104.89.232.10|RA4=104.89.247.93|RA4=104.89.251.162|RA4=104.90.11.179|RA4=104.90.100.211|RA4=104.90.135.149|RA4=104.90.140.196|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-2|""
""{40671662-8F0F-404E-9D3A-FF7F1A379224}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=104.90.8.239|RA4=104.90.17.117|RA4=104.90.88.79|RA4=104.90.158.91|RA4=104.90.163.112|RA4=104.90.176.46|RA4=104.90.177.173|RA4=104.90.181.195|RA4=104.90.181.254|RA4=104.90.208.101|RA4=104.90.209.166|RA4=104.90.218.167|RA4=104.90.221.13|RA4=104.90.228.75|RA4=104.90.231.191|RA4=104.90.232.106|RA4=104.90.234.226|RA4=104.90.237.72|RA4=104.91.63.77|RA4=104.91.99.36|RA4=104.91.107.34|RA4=104.91.133.110|RA4=104.91.135.135|RA4=104.91.143.67|RA4=104.91.160.125|RA4=104.91.166.81|RA4=104.91.166.83|RA4=104.91.166.91|RA4=104.91.166.97|RA4=104.91.166.98|RA4=104.91.166.99|RA4=104.91.166.104|RA4=104.91.166.105|RA4=104.91.166.106|RA4=104.91.166.146|RA4=104.91.166.154|RA4=104.91.166.200|RA4=104.91.166.203|RA4=104.91.190.147|RA4=104.91.191.191|RA4=104.91.203.58|RA4=104.91.228.79|RA4=104.91.231.53|RA4=104.91.236.211|RA4=104.91.252.154|RA4=104.91.252.203|RA4=104.92.2.59|RA4=104.92.20.117|RA4=104.92.27.241|RA4=104.92.37.182|RA4=104.92.44.67|RA4=104.92.54.50|RA4=104.92.57.129|RA4=104.92.64.119|RA4=104.92.82.116|RA4=104.92.88.85|RA4=104.92.91.211|RA4=104.92.92.188|RA4=104.92.108.17|RA4=104.92.108.217|RA4=104.92.112.140|RA4=104.92.123.108|RA4=104.92.125.176|RA4=104.92.235.80|RA4=104.92.247.43|RA4=104.92.251.15|RA4=104.93.5.50|RA4=104.93.63.58|RA4=104.93.67.40|RA4=104.93.75.53|RA4=104.93.82.25|RA4=104.93.82.27|RA4=104.93.82.32|RA4=104.93.82.34|RA4=104.93.82.160|RA4=104.93.82.168|RA4=104.93.82.176|RA4=104.93.82.185|RA4=104.93.82.203|RA4=104.93.172.39|RA4=104.93.174.75|RA4=104.93.183.175|RA4=104.93.192.53|RA4=104.93.193.31|RA4=104.93.204.67|RA4=104.93.247.146|RA4=104.94.22.171|RA4=104.94.23.13|RA4=104.94.23.213|RA4=104.94.35.130|RA4=104.94.47.211|RA4=104.94.58.57|RA4=104.94.106.107|RA4=104.94.111.8|RA4=104.94.111.208|RA4=104.94.119.82|RA4=104.94.136.229|RA4=104.94.160.84|RA4=104.94.163.155|RA4=104.94.163.199|RA4=104.94.168.220|RA4=104.94.172.176|RA4=104.94.172.245|RA4=104.94.189.7|RA4=104.94.190.236|RA4=104.94.214.240|RA4=104.94.230.232|RA4=104.94.231.36|RA4=104.94.233.176|RA4=104.94.235.35|RA4=104.95.5.154|RA4=104.95.6.103|RA4=104.95.10.140|RA4=104.95.24.51|RA4=104.95.25.122|RA4=104.95.28.145|RA4=104.95.43.184|RA4=104.95.51.155|RA4=104.95.52.136|RA4=104.95.68.132|RA4=104.95.99.19|RA4=104.95.101.238|RA4=104.95.103.238|RA4=104.95.122.13|RA4=104.95.123.73|RA4=104.95.125.185|RA4=104.95.139.9|RA4=104.95.148.163|RA4=104.95.173.85|RA4=104.95.182.58|RA4=104.95.189.56|RA4=104.95.198.108|RA4=104.95.207.149|RA4=104.95.215.249|RA4=104.95.235.25|RA4=104.95.240.99|RA4=104.95.243.34|RA4=104.95.248.201|RA4=104.96.0.73|RA4=104.96.0.83|RA4=104.96.0.120|RA4=104.96.0.130|RA4=104.96.8.212|RA4=104.96.9.45|RA4=104.96.9.65|RA4=104.96.19.206|RA4=104.96.20.117|RA4=104.96.28.184|RA4=104.96.39.66|RA4=104.96.40.23|RA4=104.96.90.82|RA4=104.96.90.99|RA4=104.96.90.138|RA4=104.96.90.139|RA4=104.96.90.153|RA4=104.96.90.160|RA4=104.96.90.162|RA4=104.96.90.169|RA4=104.96.90.195|RA4=104.96.90.201|RA4=104.96.90.202|RA4=104.96.90.209|RA4=104.96.90.216|RA4=104.96.90.218|RA4=104.96.90.224|RA4=104.96.90.243|RA4=104.96.91.8|RA4=104.96.91.10|RA4=104.96.91.16|RA4=104.96.91.18|RA4=104.96.91.24|RA4=104.96.91.51|RA4=104.96.92.162|RA4=104.96.95.9|RA4=104.96.129.73|RA4=104.96.132.54|RA4=104.96.132.156|RA4=104.96.144.76|RA4=104.96.147.26|RA4=104.96.151.109|RA4=104.96.155.138|RA4=104.96.156.14|RA4=104.96.210.96|RA4=104.96.210.110|RA4=104.96.210.206|RA4=104.96.210.208|RA4=104.96.210.214|RA4=104.96.210.221|RA4=104.96.221.83|RA4=104.96.221.88|RA4=104.97.73.93|RA4=104.97.73.215|RA4=104.97.78.120|RA4=104.97.78.168|RA4=104.97.82.42|RA4=104.97.84.60|RA4=104.97.87.197|RA4=104.97.99.200|RA4=104.97.112.168|RA4=104.97.116.212|RA4=104.97.121.45|RA4=104.97.128.80|RA4=104.97.249.248|RA4=104.98.3.8|RA4=104.98.3.16|RA4=104.98.3.17|RA4=104.98.3.19|RA4=104.98.22.144|RA4=104.98.30.89|RA4=104.98.38.72|RA4=104.98.40.28|RA4=104.98.129.44|RA4=104.98.135.242|RA4=104.98.148.20|RA4=104.99.6.91|RA4=104.99.12.121|RA4=104.99.48.128|RA4=104.99.63.219|RA4=104.99.129.81|RA4=104.99.171.119|RA4=104.99.172.132|RA4=106.51.144.69|RA4=106.51.146.66|RA4=106.187.61.8|RA4=106.187.61.10|RA4=106.187.61.18|RA4=107.14.34.106|RA4=107.14.34.123|RA4=107.14.34.153|RA4=107.14.34.161|RA4=107.14.34.163|RA4=107.14.34.186|RA4=107.14.38.18|RA4=107.14.38.40|RA4=107.14.43.146|RA4=107.14.43.153|RA4=107.14.45.49|RA4=107.14.45.57|RA4=107.14.45.58|RA4=107.14.45.67|RA4=107.14.45.88|RA4=107.14.46.17|RA4=107.14.46.42|RA4=107.14.46.49|RA4=107.14.46.222|RA4=107.14.46.223|RA4=107.14.47.122|RA4=107.14.47.145|RA4=107.14.47.155|RA4=107.14.47.171|RA4=107.23.31.119|RA4=107.23.98.92|RA4=108.168.151.72|RA4=108.177.96.148|RA4=108.177.96.149|RA4=108.177.97.148|RA4=108.177.97.149|RA4=109.69.139.5|RA4=109.69.139.167|RA4=109.105.109.8|RA4=109.105.109.10|RA4=109.105.109.19|RA4=109.105.109.24|RA4=109.105.109.25|RA4=109.105.109.27|RA4=109.105.109.32|RA4=109.105.109.40|RA4=109.105.109.43|RA4=109.144.115.9|RA4=109.144.115.11|RA4=109.144.115.19|RA4=109.144.115.33|RA4=109.193.193.199|RA4=109.193.193.201|RA4=109.193.193.209|RA4=109.193.193.210|RA4=109.193.193.215|RA4=109.193.193.216|RA4=110.93.233.11|RA4=110.93.233.18|RA4=110.93.233.24|RA4=110.93.233.26|RA4=110.93.233.34|RA4=110.164.2.67|RA4=110.164.2.73|RA4=110.164.11.10|RA4=110.164.11.59|RA4=110.164.17.9|RA4=110.164.17.25|RA4=110.164.17.105|RA4=110.164.17.155|RA4=110.164.253.137|RA4=110.164.253.154|RA4=110.164.253.168|RA4=110.164.253.238|RA4=110.164.253.246|RA4=110.232.152.9|RA4=110.232.152.11|RA4=110.232.152.16|RA4=110.232.152.17|RA4=110.232.152.27|RA4=110.232.152.48|RA4=111.63.135.19|RA4=111.94.254.19|RA4=111.94.254.33|RA4=111.94.254.40|RA4=111.108.54.34|RA4=111.108.54.35|RA4=111.119.230.9|RA4=111.119.230.11|RA4=111.119.230.17|RA4=111.119.230.24|RA4=111.221.29.8|RA4=111.221.29.13|RA4=111.221.29.30|RA4=111.221.29.177|RA4=111.221.29.189|RA4=111.221.29.253|RA4=111.221.29.254|RA4=111.221.123.231|RA4=112.175.42.48|RA4=112.175.42.51|RA4=112.175.42.66|RA4=112.175.42.72|RA4=112.175.42.82|RA4=112.175.42.83|RA4=112.175.42.91|RA4=112.175.42.98|RA4=112.175.42.99|RA4=112.175.42.105|RA4=112.175.42.107|RA4=112.175.42.112|RA4=113.29.17.253|RA4=113.29.41.125|RA4=113.29.41.253|RA4=113.29.69.125|RA4=113.29.69.253|RA4=114.4.39.200|RA4=114.4.39.202|RA4=114.4.39.203|RA4=114.4.39.210|RA4=114.4.39.224|RA4=114.4.39.229|RA4=114.4.39.245|RA4=114.4.39.251|RA4=114.108.166.10|RA4=114.108.166.25|RA4=114.108.166.40|RA4=114.108.166.41|RA4=114.108.166.80|RA4=114.108.166.82|RA4=114.108.188.55|RA4=114.130.7.8|RA4=114.130.7.9|RA4=114.130.7.17|RA4=114.130.7.19|RA4=115.112.1.4|RA4=115.112.1.6|RA4=115.112.1.12|RA4=115.112.1.14|RA4=115.112.1.21|RA4=115.112.1.28|RA4=115.112.1.29|RA4=115.112.3.5|RA4=115.112.3.6|RA4=115.112.5.22|RA4=115.112.5.23|RA4=115.124.93.138|RA4=115.124.93.144|RA4=115.124.93.145|RA4=115.124.93.155|RA4=115.124.93.161|RA4=115.124.93.163|RA4=115.146.116.57|RA4=115.146.119.148|RA4=115.178.57.11|RA4=115.178.57.16|RA4=116.91.142.73|RA4=116.91.142.75|RA4=116.91.142.88|RA4=116.91.142.90|RA4=116.91.142.91|RA4=116.91.142.98|RA4=116.212.220.75|RA4=116.212.220.80|RA4=116.212.220.81|RA4=116.223.128.182|RA4=116.223.135.196|RA4=116.223.136.215|RA4=116.223.144.230|RA4=116.223.155.136|RA4=116.223.183.131|RA4=116.223.202.17|RA4=116.223.204.10|RA4=116.223.204.18|RA4=116.223.204.19|RA4=116.223.204.25|RA4=116.223.204.27|RA4=116.223.204.34|RA4=116.223.204.40|RA4=116.223.204.42|RA4=116.223.204.43|RA4=116.223.204.184|RA4=116.223.204.185|RA4=116.223.204.193|RA4=116.223.204.201|RA4=117.18.232.200|RA4=117.54.200.62|RA4=117.102.125.145|RA4=117.104.135.10|RA4=117.104.135.55|RA4=117.104.135.136|RA4=117.104.135.161|RA4=117.104.139.172|RA4=117.104.139.174|RA4=117.104.139.181|RA4=117.104.139.183|RA4=117.239.91.9|RA4=117.239.91.11|RA4=117.239.91.19|RA4=117.239.91.33|RA4=117.239.122.16|RA4=117.239.122.18|RA4=117.239.122.26|RA4=117.239.122.32|RA4=117.239.122.49|RA4=117.239.141.42|RA4=117.239.141.65|RA4=118.155.230.9|RA4=118.155.230.18|RA4=118.155.230.25|RA4=118.155.230.49|RA4=118.155.230.64|RA4=118.155.230.67|RA4=118.155.230.72|RA4=118.155.230.80|RA4=118.155.230.81|RA4=118.155.230.83|RA4=118.155.230.163|RA4=118.155.230.169|RA4=118.155.230.170|RA4=118.155.230.171|RA4=118.155.230.177|RA4=118.155.230.179|RA4=118.214.17.128|RA4=118.214.21.223|RA4=118.214.23.193|RA4=118.214.29.226|RA4=118.214.33.97|RA4=118.214.47.149|RA4=118.214.75.131|RA4=118.214.83.140|RA4=118.214.160.162|RA4=118.214.160.163|RA4=118.214.160.168|RA4=118.214.160.170|RA4=118.214.160.171|RA4=118.214.160.176|RA4=118.214.160.177|RA4=118.214.161.10|RA4=118.214.161.11|RA4=118.214.161.17|RA4=118.214.161.18|RA4=118.214.161.26|RA4=118.214.161.56|RA4=118.214.161.136|RA4=118.214.161.144|RA4=118.214.161.153|RA4=118.214.161.161|RA4=118.214.161.163|RA4=118.214.161.169|RA4=118.214.243.42|RA4=118.214.247.175|RA4=118.214.249.9|RA4=118.214.253.195|RA4=118.215.9.63|RA4=118.215.68.61|RA4=118.215.71.185|RA4=118.215.99.67|RA4=118.215.154.12|RA4=118.215.183.130|RA4=118.215.191.187|RA4=119.11.251.11|RA4=119.11.251.27|RA4=119.110.115.74|RA4=119.110.115.83|RA4=119.110.115.106|RA4=119.110.115.122|RA4=119.206.193.126|RA4=119.206.193.254|RA4=119.207.64.8|RA4=119.207.64.11|RA4=119.207.64.17|RA4=119.207.64.19|RA4=119.207.64.24|RA4=119.207.64.25|RA4=119.207.64.138|RA4=119.207.64.160|RA4=119.207.65.10|RA4=119.207.65.152|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-3|""
""{05DA8F69-700E-43FA-B749-7C9B4CD3BC9A}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=12.129.210.13|RA4=12.129.210.52|RA4=12.129.210.53|RA4=12.129.210.71|RA4=13.74.47.54|RA4=13.75.94.74|RA4=13.75.118.214|RA4=13.75.119.249|RA4=13.78.184.44|RA4=13.78.188.147|RA4=13.78.232.226|RA4=13.82.28.61|RA4=13.88.15.24|RA4=13.92.194.212|RA4=13.228.192.121|RA4=13.229.24.120|RA4=14.200.100.11|RA4=14.200.100.25|RA4=14.200.100.32|RA4=14.200.100.34|RA4=14.200.100.42|RA4=14.200.100.51|RA4=14.200.100.58|RA4=14.200.100.66|RA4=119.207.65.26|RA4=119.207.65.35|RA4=119.207.65.154|RA4=119.207.65.161|RA4=119.207.65.169|RA4=119.207.66.16|RA4=119.207.66.32|RA4=119.207.66.35|RA4=119.207.66.56|RA4=119.207.66.145|RA4=119.207.66.155|RA4=119.207.66.169|RA4=119.207.66.171|RA4=119.224.129.201|RA4=119.224.129.245|RA4=119.224.143.42|RA4=119.224.143.43|RA4=119.224.143.48|RA4=119.224.143.49|RA4=120.202.249.230|RA4=121.123.204.8|RA4=121.123.204.10|RA4=121.123.204.11|RA4=121.123.204.24|RA4=121.123.204.93|RA4=121.123.204.101|RA4=121.156.60.102|RA4=121.254.188.136|RA4=121.254.188.137|RA4=121.254.188.138|RA4=121.254.188.139|RA4=122.155.236.24|RA4=122.155.236.42|RA4=122.155.236.49|RA4=122.155.236.51|RA4=122.155.236.57|RA4=122.201.18.10|RA4=122.201.18.19|RA4=122.201.18.26|RA4=122.201.18.27|RA4=122.201.18.32|RA4=122.201.18.33|RA4=123.63.250.83|RA4=123.63.250.136|RA4=123.63.250.138|RA4=123.63.250.144|RA4=123.63.250.145|RA4=123.176.32.136|RA4=123.176.32.137|RA4=123.176.32.144|RA4=123.176.32.176|RA4=123.176.32.185|RA4=123.215.198.8|RA4=123.215.198.9|RA4=123.215.198.10|RA4=123.215.198.16|RA4=123.215.198.18|RA4=123.215.198.19|RA4=124.40.41.6|RA4=124.40.41.7|RA4=124.40.41.8|RA4=124.40.41.14|RA4=124.40.41.15|RA4=124.40.41.16|RA4=124.40.41.17|RA4=124.40.53.16|RA4=124.40.53.56|RA4=124.124.252.17|RA4=124.124.252.18|RA4=124.124.252.19|RA4=124.124.252.25|RA4=124.124.252.31|RA4=124.124.252.32|RA4=124.124.252.50|RA4=124.124.252.105|RA4=124.124.252.112|RA4=124.124.252.114|RA4=124.155.222.10|RA4=124.155.222.17|RA4=125.56.145.239|RA4=125.56.178.150|RA4=125.56.181.31|RA4=125.56.199.24|RA4=125.56.199.27|RA4=125.56.199.88|RA4=125.56.199.138|RA4=125.56.199.139|RA4=125.56.199.153|RA4=125.56.201.91|RA4=125.56.201.99|RA4=125.56.201.114|RA4=125.56.201.115|RA4=125.56.201.123|RA4=125.56.204.81|RA4=125.56.204.105|RA4=125.56.204.106|RA4=125.56.204.128|RA4=125.56.204.201|RA4=125.56.204.209|RA4=125.56.213.183|RA4=125.56.214.67|RA4=125.56.214.107|RA4=125.56.214.113|RA4=125.56.214.115|RA4=125.56.218.11|RA4=125.56.219.9|RA4=125.56.219.16|RA4=125.252.217.216|RA4=125.252.226.91|RA4=125.252.226.114|RA4=125.252.226.147|RA4=125.252.226.153|RA4=125.252.226.154|RA4=125.252.226.155|RA4=125.252.232.231|RA4=125.252.233.219|RA4=125.255.81.40|RA4=125.255.81.42|RA4=125.255.81.43|RA4=125.255.81.48|RA4=125.255.240.9|RA4=125.255.240.10|RA4=125.255.240.11|RA4=125.255.240.16|RA4=128.8.10.90|RA4=128.177.96.33|RA4=128.177.96.43|RA4=128.177.96.56|RA4=128.177.96.57|RA4=128.177.96.59|RA4=128.177.98.35|RA4=128.177.98.40|RA4=128.177.164.13|RA4=128.177.164.34|RA4=129.7.130.133|RA4=129.7.130.134|RA4=129.7.130.136|RA4=129.7.130.141|RA4=131.107.113.238|RA4=131.253.14.76|RA4=131.253.14.121|RA4=131.253.14.153|RA4=131.253.14.192|RA4=131.253.14.195|RA4=131.253.18.253|RA4=131.253.21.1|RA4=131.253.33.200|RA4=131.253.33.203|RA4=131.253.33.223|RA4=131.253.34.162|RA4=131.253.40.37|RA4=131.253.40.44|RA4=131.253.40.47|RA4=131.253.40.50|RA4=131.253.40.59|RA4=131.253.40.109|RA4=132.245.72.114|RA4=134.170.0.199|RA4=134.170.0.200|RA4=134.170.0.215|RA4=134.170.0.216|RA4=134.170.3.199|RA4=134.170.3.200|RA4=134.170.30.202|RA4=134.170.51.253|RA4=134.170.52.151|RA4=134.170.104.154|RA4=134.170.111.154|RA4=134.170.115.60|RA4=134.170.170.55|RA4=134.170.170.56|RA4=134.170.184.133|RA4=134.170.185.70|RA4=134.170.188.84|RA4=134.170.188.248|RA4=137.116.81.24|RA4=137.116.172.217|RA4=137.116.242.248|RA4=137.117.100.176|RA4=137.135.52.44|RA4=137.135.204.246|RA4=139.175.236.49|RA4=139.175.236.75|RA4=139.175.236.80|RA4=139.175.236.89|RA4=139.175.236.91|RA4=139.175.236.97|RA4=139.175.236.107|RA4=139.175.236.121|RA4=139.175.236.203|RA4=139.175.236.217|RA4=139.175.236.223|RA4=139.175.236.224|RA4=139.175.236.225|RA4=139.193.253.8|RA4=139.193.253.16|RA4=139.193.253.24|RA4=139.193.253.26|RA4=139.193.253.27|RA4=139.193.253.35|RA4=142.165.4.9|RA4=142.165.4.10|RA4=142.165.4.12|RA4=142.165.4.18|RA4=142.165.4.19|RA4=142.165.4.25|RA4=143.90.194.8|RA4=143.90.194.9|RA4=143.90.194.41|RA4=143.90.194.48|RA4=143.90.194.49|RA4=143.90.194.50|RA4=143.215.203.33|RA4=143.215.203.39|RA4=146.148.34.125|RA4=147.8.239.45|RA4=147.8.239.46|RA4=147.8.239.47|RA4=147.229.255.72|RA4=147.229.255.73|RA4=147.229.255.74|RA4=147.229.255.80|RA4=147.229.255.81|RA4=147.229.255.82|RA4=147.229.255.83|RA4=147.229.255.88|RA4=150.101.98.8|RA4=150.101.98.10|RA4=150.101.98.17|RA4=150.101.98.48|RA4=150.101.98.57|RA4=150.101.152.8|RA4=150.101.152.32|RA4=150.101.161.8|RA4=150.101.161.10|RA4=150.101.161.26|RA4=150.101.161.32|RA4=150.101.161.33|RA4=150.101.165.9|RA4=150.101.165.11|RA4=150.101.165.17|RA4=150.101.165.48|RA4=150.101.170.8|RA4=150.101.170.10|RA4=150.101.170.16|RA4=150.101.170.25|RA4=150.101.170.32|RA4=150.101.170.208|RA4=151.21.209.89|RA4=151.21.209.90|RA4=151.21.209.91|RA4=151.21.209.96|RA4=151.21.209.97|RA4=151.21.209.98|RA4=151.29.122.67|RA4=151.29.122.75|RA4=151.29.122.106|RA4=151.29.122.112|RA4=151.29.122.121|RA4=151.29.122.130|RA4=151.40.148.89|RA4=151.40.148.90|RA4=151.40.148.105|RA4=151.40.148.120|RA4=151.40.148.123|RA4=151.40.148.130|RA4=157.55.6.71|RA4=157.55.129.21|RA4=157.55.240.220|RA4=157.56.17.247|RA4=157.56.17.248|RA4=157.56.23.91|RA4=157.56.57.5|RA4=157.56.67.218|RA4=157.56.74.250|RA4=157.56.91.77|RA4=157.56.91.82|RA4=157.56.106.189|RA4=157.56.106.210|RA4=157.56.108.82|RA4=157.56.109.8|RA4=157.56.114.104|RA4=157.56.121.89|RA4=157.56.122.82|RA4=157.56.123.82|RA4=157.56.149.250|RA4=157.56.194.24|RA4=157.56.198.14|RA4=157.58.211.44|RA4=157.58.249.57|RA4=157.157.19.105|RA4=157.157.19.106|RA4=157.157.19.107|RA4=157.157.19.113|RA4=157.240.0.5|RA4=157.240.1.6|RA4=157.240.2.7|RA4=157.240.3.7|RA4=157.240.7.8|RA4=157.240.8.7|RA4=157.240.9.6|RA4=157.240.11.5|RA4=157.240.14.5|RA4=157.240.15.6|RA4=157.240.20.5|RA4=157.240.21.6|RA4=158.255.97.8|RA4=158.255.97.16|RA4=158.255.97.19|RA4=158.255.97.41|RA4=158.255.97.48|RA4=158.255.97.65|RA4=158.255.97.82|RA4=159.134.168.160|RA4=159.134.168.176|RA4=159.134.168.203|RA4=159.134.168.209|RA4=159.134.168.211|RA4=159.134.168.217|RA4=159.148.86.199|RA4=159.148.86.201|RA4=159.148.86.207|RA4=162.246.158.8|RA4=162.246.158.10|RA4=162.246.158.11|RA4=162.246.158.16|RA4=162.246.158.18|RA4=163.28.5.8|RA4=163.28.5.10|RA4=163.28.5.16|RA4=163.28.5.19|RA4=163.28.5.27|RA4=163.28.5.32|RA4=163.139.173.8|RA4=163.139.173.10|RA4=163.139.173.16|RA4=163.139.173.27|RA4=163.139.173.34|RA4=163.139.173.135|RA4=163.139.173.137|RA4=163.139.173.143|RA4=163.139.173.158|RA4=163.139.173.159|RA4=163.139.173.167|RA4=164.58.129.137|RA4=164.58.129.146|RA4=164.58.129.152|RA4=164.58.129.153|RA4=164.58.129.154|RA4=164.215.74.151|RA4=164.215.74.153|RA4=164.215.74.156|RA4=164.215.74.168|RA4=164.215.74.169|RA4=164.215.74.171|RA4=164.215.74.178|RA4=165.254.0.8|RA4=165.254.0.16|RA4=165.254.0.27|RA4=165.254.0.57|RA4=165.254.0.58|RA4=165.254.0.145|RA4=165.254.0.153|RA4=165.254.24.144|RA4=165.254.24.166|RA4=165.254.34.208|RA4=165.254.34.216|RA4=165.254.34.232|RA4=165.254.34.247|RA4=165.254.42.74|RA4=165.254.42.81|RA4=165.254.42.82|RA4=165.254.42.88|RA4=165.254.42.89|RA4=165.254.42.97|RA4=165.254.42.105|RA4=165.254.47.107|RA4=165.254.47.121|RA4=165.254.47.122|RA4=165.254.47.129|RA4=165.254.47.131|RA4=165.254.50.64|RA4=165.254.50.129|RA4=165.254.94.113|RA4=165.254.94.114|RA4=165.254.96.111|RA4=165.254.96.118|RA4=165.254.96.135|RA4=165.254.102.148|RA4=165.254.102.164|RA4=165.254.114.8|RA4=165.254.114.10|RA4=165.254.114.16|RA4=165.254.114.24|RA4=165.254.114.34|RA4=165.254.114.35|RA4=165.254.146.194|RA4=165.254.146.208|RA4=165.254.155.43|RA4=165.254.155.51|RA4=165.254.155.64|RA4=165.254.155.67|RA4=165.254.155.83|RA4=165.254.155.88|RA4=165.254.204.137|RA4=165.254.204.138|RA4=165.254.204.170|RA4=165.254.204.184|RA4=165.254.204.193|RA4=165.254.204.194|RA4=165.254.207.51|RA4=165.254.207.59|RA4=165.254.207.73|RA4=165.254.244.211|RA4=165.254.244.232|RA4=165.254.245.8|RA4=165.254.245.40|RA4=165.254.247.208|RA4=165.254.247.224|RA4=167.142.232.210|RA4=167.142.232.211|RA4=167.142.232.219|RA4=167.142.232.225|RA4=167.206.87.26|RA4=167.206.87.34|RA4=167.206.87.123|RA4=167.206.87.160|RA4=167.206.87.177|RA4=167.206.87.186|RA4=167.206.116.34|RA4=167.206.116.49|RA4=167.206.116.161|RA4=167.206.116.162|RA4=167.206.116.178|RA4=167.206.218.106|RA4=167.206.218.130|RA4=168.61.24.141|RA4=168.62.187.13|RA4=168.63.108.233|RA4=168.63.220.46|RA4=168.143.241.185|RA4=168.143.241.202|RA4=168.143.241.219|RA4=172.217.0.6|RA4=172.217.0.38|RA4=172.217.0.134|RA4=172.217.0.166|RA4=172.217.1.38|RA4=172.217.1.102|RA4=172.217.10.102|RA4=172.217.11.6|RA4=172.217.11.38|RA4=172.217.11.70|RA4=172.217.11.134|RA4=172.217.12.70|RA4=172.217.12.134|RA4=172.217.12.198|RA4=172.217.13.166|RA4=172.217.16.38|RA4=172.217.16.70|RA4=172.217.16.102|RA4=172.217.16.134|RA4=172.217.16.166|RA4=172.217.16.198|RA4=172.217.17.38|RA4=172.217.17.102|RA4=172.217.17.134|RA4=172.217.17.166|RA4=172.217.17.198|RA4=172.217.18.6|RA4=172.217.18.38|RA4=172.217.18.70|RA4=172.217.18.134|RA4=172.217.18.166|RA4=172.217.18.230|RA4=172.217.19.198|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-4|""
""{66088403-4083-4CBA-BFCF-5F53E4B76D2F}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=172.217.2.6|RA4=172.217.2.38|RA4=172.217.2.134|RA4=172.217.3.6|RA4=172.217.3.38|RA4=172.217.3.134|RA4=172.217.3.198|RA4=172.217.4.6|RA4=172.217.4.38|RA4=172.217.4.70|RA4=172.217.4.166|RA4=172.217.4.198|RA4=172.217.5.6|RA4=172.217.6.70|RA4=172.217.6.102|RA4=172.217.6.134|RA4=172.217.6.166|RA4=172.217.6.198|RA4=172.217.6.230|RA4=172.217.7.6|RA4=172.217.7.134|RA4=172.217.8.166|RA4=172.217.8.198|RA4=172.217.9.6|RA4=172.217.9.38|RA4=172.217.9.70|RA4=172.217.9.166|RA4=172.217.19.6|RA4=172.217.19.38|RA4=172.217.19.230|RA4=172.217.20.38|RA4=172.217.20.70|RA4=172.217.20.166|RA4=172.217.20.198|RA4=172.217.20.230|RA4=172.217.21.230|RA4=172.217.22.6|RA4=172.217.22.38|RA4=172.217.22.70|RA4=172.217.22.102|RA4=172.217.22.134|RA4=172.217.22.166|RA4=172.217.22.198|RA4=172.217.22.230|RA4=172.217.23.6|RA4=172.217.23.38|RA4=172.217.23.134|RA4=172.217.23.166|RA4=172.217.23.198|RA4=172.217.23.230|RA4=172.217.24.38|RA4=172.217.24.70|RA4=172.217.24.134|RA4=172.217.24.198|RA4=172.217.24.230|RA4=172.217.25.6|RA4=172.217.25.70|RA4=172.217.25.102|RA4=172.217.25.134|RA4=172.217.25.166|RA4=172.217.25.198|RA4=172.217.25.230|RA4=172.217.26.6|RA4=172.217.26.38|RA4=172.217.26.70|RA4=172.217.26.134|RA4=172.217.27.38|RA4=172.217.27.70|RA4=172.217.27.102|RA4=172.217.27.134|RA4=172.217.27.230|RA4=172.217.29.70|RA4=172.217.29.166|RA4=172.217.29.198|RA4=172.217.31.102|RA4=172.224.3.100|RA4=172.224.15.135|RA4=172.224.91.35|RA4=172.224.98.191|RA4=172.224.107.68|RA4=172.224.164.205|RA4=172.224.177.235|RA4=172.224.179.30|RA4=172.224.180.34|RA4=172.224.181.233|RA4=172.224.182.193|RA4=172.224.185.21|RA4=172.224.186.96|RA4=172.224.214.87|RA4=172.224.231.98|RA4=172.224.231.213|RA4=172.225.6.238|RA4=172.225.10.73|RA4=172.225.37.205|RA4=172.225.49.216|RA4=172.225.50.201|RA4=172.225.139.115|RA4=172.225.146.26|RA4=172.225.157.103|RA4=172.225.213.96|RA4=172.225.222.161|RA4=172.225.230.41|RA4=172.225.231.160|RA4=172.225.239.48|RA4=172.226.41.63|RA4=172.226.54.238|RA4=172.226.65.45|RA4=172.226.77.80|RA4=172.226.86.111|RA4=172.226.90.90|RA4=172.226.90.101|RA4=172.226.90.234|RA4=172.226.111.240|RA4=172.226.113.108|RA4=172.226.123.76|RA4=172.226.129.37|RA4=172.226.138.66|RA4=172.226.186.87|RA4=172.226.186.148|RA4=172.226.201.246|RA4=172.226.202.201|RA4=172.226.208.49|RA4=172.226.218.37|RA4=172.226.248.2|RA4=172.226.248.112|RA4=172.226.248.190|RA4=172.226.253.94|RA4=172.227.22.69|RA4=172.227.25.6|RA4=172.227.37.8|RA4=172.227.39.73|RA4=172.227.56.60|RA4=172.227.67.209|RA4=172.227.72.103|RA4=172.227.75.196|RA4=172.227.77.97|RA4=172.227.83.201|RA4=172.227.86.43|RA4=172.227.98.9|RA4=172.227.98.173|RA4=172.227.101.195|RA4=172.227.101.198|RA4=172.227.102.72|RA4=172.227.102.201|RA4=172.227.103.47|RA4=172.227.106.64|RA4=172.227.118.93|RA4=172.227.119.135|RA4=172.227.120.25|RA4=172.227.128.37|RA4=172.227.128.121|RA4=172.227.135.175|RA4=172.227.137.123|RA4=172.227.137.249|RA4=172.227.144.207|RA4=172.227.148.83|RA4=172.227.163.92|RA4=172.227.167.119|RA4=172.227.173.163|RA4=172.227.175.106|RA4=172.227.181.118|RA4=172.227.183.37|RA4=172.227.206.226|RA4=172.227.214.123|RA4=172.228.33.164|RA4=172.228.36.38|RA4=172.228.36.245|RA4=172.228.41.183|RA4=172.228.51.51|RA4=172.228.56.178|RA4=172.228.61.183|RA4=172.228.62.87|RA4=172.228.66.12|RA4=172.228.87.104|RA4=172.228.93.164|RA4=172.228.99.169|RA4=172.228.238.60|RA4=172.228.248.35|RA4=172.229.28.164|RA4=172.229.37.187|RA4=172.229.49.131|RA4=172.229.56.52|RA4=172.229.101.216|RA4=172.229.109.122|RA4=172.229.148.106|RA4=172.229.150.242|RA4=172.229.156.22|RA4=172.229.162.179|RA4=172.229.165.73|RA4=172.229.170.208|RA4=172.229.180.112|RA4=172.229.181.199|RA4=172.229.202.221|RA4=172.229.209.164|RA4=172.229.210.247|RA4=172.229.211.244|RA4=172.229.217.39|RA4=172.229.225.27|RA4=172.229.226.177|RA4=172.229.231.70|RA4=172.229.233.146|RA4=172.229.244.107|RA4=172.229.247.89|RA4=172.229.254.48|RA4=172.230.4.12|RA4=172.230.11.171|RA4=172.230.22.172|RA4=172.230.66.75|RA4=172.230.81.155|RA4=172.230.82.6|RA4=172.230.93.20|RA4=172.230.101.71|RA4=172.230.113.199|RA4=172.230.117.221|RA4=172.230.120.21|RA4=172.230.127.211|RA4=172.230.137.46|RA4=172.230.181.28|RA4=172.230.185.76|RA4=172.230.185.215|RA4=172.230.188.96|RA4=172.230.198.92|RA4=172.230.200.144|RA4=172.230.208.115|RA4=172.230.208.217|RA4=172.230.212.129|RA4=172.230.225.159|RA4=172.231.52.24|RA4=172.231.68.38|RA4=172.231.71.5|RA4=172.231.116.116|RA4=172.231.124.130|RA4=172.231.127.166|RA4=172.231.151.166|RA4=172.231.200.241|RA4=172.231.202.122|RA4=172.231.212.246|RA4=172.231.214.71|RA4=172.231.217.132|RA4=172.231.222.121|RA4=172.231.229.152|RA4=172.231.249.11|RA4=172.231.255.230|RA4=172.232.20.161|RA4=172.232.54.8|RA4=172.232.59.13|RA4=172.232.69.238|RA4=172.232.76.90|RA4=172.232.142.56|RA4=172.232.155.49|RA4=172.232.173.208|RA4=172.232.177.105|RA4=172.232.187.126|RA4=172.232.203.155|RA4=172.232.232.231|RA4=172.232.246.153|RA4=172.232.254.182|RA4=172.233.2.215|RA4=172.233.11.155|RA4=172.233.17.153|RA4=172.233.20.137|RA4=172.233.26.202|RA4=172.233.27.227|RA4=172.233.28.211|RA4=172.233.42.209|RA4=172.233.69.125|RA4=172.233.76.80|RA4=172.233.87.139|RA4=172.233.93.197|RA4=172.233.99.26|RA4=172.233.99.207|RA4=172.233.126.224|RA4=173.194.32.155|RA4=173.194.32.156|RA4=173.194.32.187|RA4=173.194.32.188|RA4=173.194.32.219|RA4=173.194.32.220|RA4=173.194.32.251|RA4=173.194.32.252|RA4=173.194.33.91|RA4=173.194.33.92|RA4=173.194.33.123|RA4=173.194.33.124|RA4=173.194.33.155|RA4=173.194.33.156|RA4=173.194.33.187|RA4=173.194.33.188|RA4=173.194.36.91|RA4=173.194.36.92|RA4=173.194.36.123|RA4=173.194.36.124|RA4=173.194.37.59|RA4=173.194.37.60|RA4=173.194.37.91|RA4=173.194.37.92|RA4=173.194.38.219|RA4=173.194.38.220|RA4=173.194.39.27|RA4=173.194.39.28|RA4=173.194.40.27|RA4=173.194.40.28|RA4=173.194.40.59|RA4=173.194.40.60|RA4=173.194.40.91|RA4=173.194.40.92|RA4=173.194.40.123|RA4=173.194.40.124|RA4=173.194.40.155|RA4=173.194.40.156|RA4=173.194.40.251|RA4=173.194.40.252|RA4=173.194.42.27|RA4=173.194.42.28|RA4=173.194.42.59|RA4=173.194.42.60|RA4=173.194.42.91|RA4=173.194.42.92|RA4=173.194.42.123|RA4=173.194.42.124|RA4=173.194.42.155|RA4=173.194.42.156|RA4=173.194.42.187|RA4=173.194.42.188|RA4=173.194.42.219|RA4=173.194.42.220|RA4=173.194.42.251|RA4=173.194.42.252|RA4=173.194.43.91|RA4=173.194.43.92|RA4=173.194.43.123|RA4=173.194.43.124|RA4=173.194.44.27|RA4=173.194.44.28|RA4=173.194.44.59|RA4=173.194.44.60|RA4=173.194.44.91|RA4=173.194.44.92|RA4=173.194.45.59|RA4=173.194.45.60|RA4=173.194.45.91|RA4=173.194.45.92|RA4=173.194.46.59|RA4=173.194.46.60|RA4=173.194.46.91|RA4=173.194.46.92|RA4=173.194.46.123|RA4=173.194.46.124|RA4=173.194.65.148|RA4=173.194.65.149|RA4=173.194.67.148|RA4=173.194.67.149|RA4=173.194.69.148|RA4=173.194.69.149|RA4=173.194.112.27|RA4=173.194.112.28|RA4=173.194.112.59|RA4=173.194.112.60|RA4=173.194.112.91|RA4=173.194.112.92|RA4=173.194.112.123|RA4=173.194.112.124|RA4=173.194.112.155|RA4=173.194.112.156|RA4=173.194.112.187|RA4=173.194.112.188|RA4=173.194.112.219|RA4=173.194.112.220|RA4=173.194.112.251|RA4=173.194.112.252|RA4=173.194.113.27|RA4=173.194.113.28|RA4=173.194.113.59|RA4=173.194.113.60|RA4=173.194.113.91|RA4=173.194.113.92|RA4=173.194.113.123|RA4=173.194.113.124|RA4=173.194.113.155|RA4=173.194.113.156|RA4=173.194.113.187|RA4=173.194.113.188|RA4=173.194.113.219|RA4=173.194.113.220|RA4=173.194.115.27|RA4=173.194.115.28|RA4=173.194.115.59|RA4=173.194.115.60|RA4=173.194.115.91|RA4=173.194.115.92|RA4=173.194.115.187|RA4=173.194.115.188|RA4=173.194.115.219|RA4=173.194.115.220|RA4=173.194.115.251|RA4=173.194.115.252|RA4=173.194.116.59|RA4=173.194.116.60|RA4=173.194.116.91|RA4=173.194.116.92|RA4=173.194.116.123|RA4=173.194.116.124|RA4=173.194.116.155|RA4=173.194.116.156|RA4=173.194.116.187|RA4=173.194.116.188|RA4=173.194.116.219|RA4=173.194.116.220|RA4=173.194.116.251|RA4=173.194.116.252|RA4=173.194.117.27|RA4=173.194.117.28|RA4=173.194.117.59|RA4=173.194.117.60|RA4=173.194.117.91|RA4=173.194.117.92|RA4=173.194.117.123|RA4=173.194.117.124|RA4=173.194.117.155|RA4=173.194.117.156|RA4=173.194.117.187|RA4=173.194.117.188|RA4=173.194.117.219|RA4=173.194.117.220|RA4=173.194.117.251|RA4=173.194.117.252|RA4=173.194.118.27|RA4=173.194.118.28|RA4=173.194.118.59|RA4=173.194.118.60|RA4=173.194.118.91|RA4=173.194.118.92|RA4=173.194.118.123|RA4=173.194.118.124|RA4=173.194.119.27|RA4=173.194.119.28|RA4=173.194.119.59|RA4=173.194.119.60|RA4=173.194.120.91|RA4=173.194.120.92|RA4=173.194.120.123|RA4=173.194.120.124|RA4=173.194.120.155|RA4=173.194.120.156|RA4=173.194.121.27|RA4=173.194.121.28|RA4=173.194.121.59|RA4=173.194.121.60|RA4=173.194.122.27|RA4=173.194.122.28|RA4=173.194.122.219|RA4=173.194.122.220|RA4=173.194.122.251|RA4=173.194.122.252|RA4=173.194.123.27|RA4=173.194.123.28|RA4=173.194.123.59|RA4=173.194.123.60|RA4=173.194.123.91|RA4=173.194.123.92|RA4=173.194.123.123|RA4=173.194.123.124|RA4=173.194.124.27|RA4=173.194.124.28|RA4=173.194.124.59|RA4=173.194.124.60|RA4=173.194.126.27|RA4=173.194.126.28|RA4=173.194.126.59|RA4=173.194.126.60|RA4=173.194.126.91|RA4=173.194.126.92|RA4=173.194.126.123|RA4=173.194.126.124|RA4=173.194.126.155|RA4=173.194.126.156|RA4=173.194.126.187|RA4=173.194.126.188|RA4=173.194.126.219|RA4=173.194.126.220|RA4=173.194.126.251|RA4=173.194.126.252|RA4=173.194.195.148|RA4=173.194.195.149|RA4=173.194.201.148|RA4=173.194.201.149|RA4=173.194.204.148|RA4=173.194.204.149|RA4=173.194.205.148|RA4=173.194.205.149|RA4=173.194.219.148|RA4=173.194.219.149|RA4=173.194.220.148|RA4=173.194.220.149|RA4=173.194.221.148|RA4=173.194.221.149|RA4=173.194.222.148|RA4=173.194.222.149|RA4=173.194.223.148|RA4=173.194.223.149|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-5|""
""{B6AFA2E7-80C5-4F64-8116-5EE661E34FD2}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=173.194.70.148|RA4=173.194.70.149|RA4=173.194.71.148|RA4=173.194.71.149|RA4=173.194.72.148|RA4=173.194.72.149|RA4=173.194.73.148|RA4=173.194.73.149|RA4=173.194.79.148|RA4=173.194.79.149|RA4=173.205.6.98|RA4=173.205.6.145|RA4=173.205.14.98|RA4=173.205.14.114|RA4=173.205.14.115|RA4=173.205.14.120|RA4=173.205.14.219|RA4=173.205.15.11|RA4=173.205.24.168|RA4=173.205.24.171|RA4=173.205.24.184|RA4=173.205.24.186|RA4=173.205.24.192|RA4=173.205.24.193|RA4=173.205.27.217|RA4=173.205.27.218|RA4=173.205.27.219|RA4=173.205.27.224|RA4=173.222.11.192|RA4=173.222.23.21|RA4=173.222.42.158|RA4=173.222.68.108|RA4=173.222.98.253|RA4=173.222.104.218|RA4=173.222.108.121|RA4=173.222.108.131|RA4=173.222.108.162|RA4=173.222.108.203|RA4=173.222.108.209|RA4=173.222.108.219|RA4=173.222.109.8|RA4=173.222.109.10|RA4=173.222.109.16|RA4=173.222.109.18|RA4=173.222.109.19|RA4=173.222.109.24|RA4=173.222.110.101|RA4=173.222.134.141|RA4=173.222.146.161|RA4=173.222.155.2|RA4=173.222.155.14|RA4=173.222.159.247|RA4=173.222.178.2|RA4=173.222.181.253|RA4=173.222.186.161|RA4=173.222.202.113|RA4=173.222.203.78|RA4=173.222.203.99|RA4=173.222.204.232|RA4=173.222.205.42|RA4=173.222.206.35|RA4=173.222.210.251|RA4=173.222.211.11|RA4=173.222.211.49|RA4=173.222.211.50|RA4=173.222.211.65|RA4=173.222.236.238|RA4=173.223.7.20|RA4=173.223.10.104|RA4=173.223.10.123|RA4=173.223.10.137|RA4=173.223.10.145|RA4=173.223.10.153|RA4=173.223.10.169|RA4=173.223.10.171|RA4=173.223.10.177|RA4=173.223.10.192|RA4=173.223.10.225|RA4=173.223.10.232|RA4=173.223.11.9|RA4=173.223.11.11|RA4=173.223.11.27|RA4=173.223.11.49|RA4=173.223.11.80|RA4=173.223.11.97|RA4=173.223.11.112|RA4=173.223.11.114|RA4=173.223.11.120|RA4=173.223.11.123|RA4=173.223.11.142|RA4=173.223.11.143|RA4=173.223.20.163|RA4=173.223.23.43|RA4=173.223.28.168|RA4=173.223.42.161|RA4=173.223.44.63|RA4=173.223.52.202|RA4=173.223.52.210|RA4=173.223.53.8|RA4=173.223.53.9|RA4=173.223.53.16|RA4=173.223.53.17|RA4=173.223.53.19|RA4=173.223.53.24|RA4=173.223.53.35|RA4=173.223.82.4|RA4=173.223.90.210|RA4=173.223.90.215|RA4=173.223.98.181|RA4=173.223.106.139|RA4=173.223.106.147|RA4=173.223.106.163|RA4=173.223.106.169|RA4=173.223.106.194|RA4=173.223.110.161|RA4=173.223.120.207|RA4=173.223.140.67|RA4=173.223.141.128|RA4=173.223.169.134|RA4=173.223.174.169|RA4=173.223.204.43|RA4=173.223.204.74|RA4=173.223.204.80|RA4=173.223.204.82|RA4=173.223.204.88|RA4=173.223.204.128|RA4=173.223.204.131|RA4=173.223.204.136|RA4=173.223.204.145|RA4=173.223.205.41|RA4=173.223.205.43|RA4=173.223.205.48|RA4=173.223.205.106|RA4=173.223.227.17|RA4=173.223.227.27|RA4=173.223.227.32|RA4=173.223.227.34|RA4=173.223.227.49|RA4=173.223.227.51|RA4=173.223.250.221|RA4=173.252.74.21|RA4=173.252.88.73|RA4=173.252.88.160|RA4=173.252.90.1|RA4=173.252.90.192|RA4=173.252.112.17|RA4=173.252.120.5|RA4=174.34.204.99|RA4=174.34.204.107|RA4=174.34.204.113|RA4=174.34.204.114|RA4=174.69.172.57|RA4=174.69.172.58|RA4=174.76.226.9|RA4=174.76.226.17|RA4=174.76.226.32|RA4=174.76.226.38|RA4=174.76.226.46|RA4=174.76.226.64|RA4=175.45.42.201|RA4=175.45.42.209|RA4=175.45.42.216|RA4=175.45.42.217|RA4=175.45.42.219|RA4=175.99.108.93|RA4=175.126.163.136|RA4=175.126.163.138|RA4=175.126.163.139|RA4=175.126.163.144|RA4=175.126.163.162|RA4=175.126.163.168|RA4=175.126.163.179|RA4=175.126.163.184|RA4=176.10.81.8|RA4=176.10.81.9|RA4=176.10.81.10|RA4=176.126.57.200|RA4=176.126.57.202|RA4=176.126.57.208|RA4=176.126.57.211|RA4=176.126.57.225|RA4=176.126.57.227|RA4=177.43.198.20|RA4=177.43.198.26|RA4=177.43.198.27|RA4=177.43.198.28|RA4=177.43.198.35|RA4=177.43.198.69|RA4=177.43.198.84|RA4=177.43.198.92|RA4=177.43.198.98|RA4=177.43.198.99|RA4=177.43.198.101|RA4=177.43.198.106|RA4=177.84.167.137|RA4=177.84.167.139|RA4=177.84.167.145|RA4=177.84.167.147|RA4=177.84.167.152|RA4=177.84.167.155|RA4=177.124.192.8|RA4=177.124.192.9|RA4=177.124.192.10|RA4=177.152.174.72|RA4=177.152.174.73|RA4=177.152.174.74|RA4=177.155.140.9|RA4=177.155.140.10|RA4=178.18.229.136|RA4=178.18.229.139|RA4=178.18.229.144|RA4=178.18.229.155|RA4=178.18.229.160|RA4=178.18.229.163|RA4=178.18.231.73|RA4=178.18.231.75|RA4=178.18.231.89|RA4=178.18.231.96|RA4=178.19.63.62|RA4=178.19.63.126|RA4=178.19.63.190|RA4=178.19.63.254|RA4=178.59.102.136|RA4=178.59.102.138|RA4=178.59.102.145|RA4=178.59.102.147|RA4=178.251.108.234|RA4=178.251.108.235|RA4=178.251.108.240|RA4=178.251.108.241|RA4=178.253.195.41|RA4=178.253.195.42|RA4=178.253.195.43|RA4=178.253.195.48|RA4=178.253.195.49|RA4=178.253.195.50|RA4=179.60.192.10|RA4=179.60.193.10|RA4=179.60.195.3|RA4=179.127.142.6|RA4=179.127.142.7|RA4=179.127.142.8|RA4=179.127.142.9|RA4=179.184.23.9|RA4=179.184.23.10|RA4=179.184.23.19|RA4=179.184.23.26|RA4=179.184.23.32|RA4=179.184.23.35|RA4=180.149.20.8|RA4=180.149.20.9|RA4=180.149.20.10|RA4=180.149.91.224|RA4=180.149.91.226|RA4=180.149.91.232|RA4=180.149.91.233|RA4=180.149.91.234|RA4=180.178.103.10|RA4=180.180.251.16|RA4=180.180.251.33|RA4=180.180.251.164|RA4=181.30.131.17|RA4=181.30.131.19|RA4=181.30.131.24|RA4=181.30.131.32|RA4=181.30.131.33|RA4=181.30.131.35|RA4=181.30.131.88|RA4=181.30.131.89|RA4=181.49.20.210|RA4=181.49.20.217|RA4=181.49.20.225|RA4=181.198.58.28|RA4=181.198.58.29|RA4=181.198.58.30|RA4=181.198.58.31|RA4=181.198.58.36|RA4=182.18.179.72|RA4=182.18.179.73|RA4=182.18.179.75|RA4=182.19.89.104|RA4=182.19.89.105|RA4=182.19.89.107|RA4=182.19.89.113|RA4=182.19.89.114|RA4=182.162.106.10|RA4=182.162.106.25|RA4=182.162.106.27|RA4=182.162.106.42|RA4=182.176.154.138|RA4=182.176.154.139|RA4=182.176.154.144|RA4=182.176.154.145|RA4=182.176.155.40|RA4=182.176.155.42|RA4=182.176.155.48|RA4=182.176.155.50|RA4=182.176.155.51|RA4=183.60.90.112|RA4=183.60.90.114|RA4=183.60.90.115|RA4=183.60.90.116|RA4=183.60.90.118|RA4=183.60.90.119|RA4=183.60.90.120|RA4=183.60.90.121|RA4=183.60.90.123|RA4=183.60.90.124|RA4=183.111.23.35|RA4=183.111.23.41|RA4=183.111.23.49|RA4=183.111.23.64|RA4=183.111.23.65|RA4=184.24.25.89|RA4=184.24.29.132|RA4=184.24.53.159|RA4=184.24.59.88|RA4=184.24.61.16|RA4=184.24.68.44|RA4=184.24.84.168|RA4=184.24.84.200|RA4=184.24.88.35|RA4=184.24.97.9|RA4=184.24.97.17|RA4=184.24.97.25|RA4=184.24.97.43|RA4=184.24.97.50|RA4=184.24.97.58|RA4=184.24.97.72|RA4=184.24.97.136|RA4=184.24.97.139|RA4=184.24.97.161|RA4=184.24.97.187|RA4=184.24.98.98|RA4=184.24.98.104|RA4=184.24.98.115|RA4=184.24.98.121|RA4=184.24.98.128|RA4=184.24.98.138|RA4=184.24.98.210|RA4=184.24.98.226|RA4=184.24.134.117|RA4=184.24.137.13|RA4=184.24.143.54|RA4=184.24.155.52|RA4=184.24.161.9|RA4=184.24.171.88|RA4=184.24.194.136|RA4=184.24.201.63|RA4=184.24.219.147|RA4=184.24.223.145|RA4=184.25.22.154|RA4=184.25.22.173|RA4=184.25.29.217|RA4=184.25.31.214|RA4=184.25.39.92|RA4=184.25.45.17|RA4=184.25.45.47|RA4=184.25.47.193|RA4=184.25.53.174|RA4=184.25.54.33|RA4=184.25.55.172|RA4=184.25.56.83|RA4=184.25.56.84|RA4=184.25.56.85|RA4=184.25.56.91|RA4=184.25.56.93|RA4=184.25.56.99|RA4=184.25.56.100|RA4=184.25.56.125|RA4=184.25.56.156|RA4=184.25.56.157|RA4=184.25.56.165|RA4=184.25.56.178|RA4=184.25.56.179|RA4=184.25.56.194|RA4=184.25.56.202|RA4=184.25.56.213|RA4=184.25.56.220|RA4=184.25.56.221|RA4=184.25.56.243|RA4=184.25.56.250|RA4=184.25.56.251|RA4=184.25.57.8|RA4=184.25.57.17|RA4=184.25.57.19|RA4=184.25.57.26|RA4=184.25.63.18|RA4=184.25.63.25|RA4=184.25.63.49|RA4=184.25.63.56|RA4=184.25.82.32|RA4=184.25.90.17|RA4=184.25.93.15|RA4=184.25.93.236|RA4=184.25.107.40|RA4=184.25.107.49|RA4=184.25.107.152|RA4=184.25.107.158|RA4=184.25.107.175|RA4=184.25.107.177|RA4=184.25.108.33|RA4=184.25.108.51|RA4=184.25.108.75|RA4=184.25.108.81|RA4=184.25.108.121|RA4=184.25.108.187|RA4=184.25.109.90|RA4=184.25.109.98|RA4=184.25.109.106|RA4=184.25.109.114|RA4=184.25.109.233|RA4=184.25.109.249|RA4=184.25.213.5|RA4=184.25.214.142|RA4=184.25.214.161|RA4=184.25.251.104|RA4=184.25.252.11|RA4=184.25.253.148|RA4=184.25.254.42|RA4=184.25.254.51|RA4=184.25.254.64|RA4=184.25.254.65|RA4=184.26.23.142|RA4=184.26.43.178|RA4=184.26.44.95|RA4=184.26.44.97|RA4=184.26.44.105|RA4=184.26.44.106|RA4=184.26.106.161|RA4=184.26.136.66|RA4=184.26.136.74|RA4=184.26.136.89|RA4=184.26.136.96|RA4=184.26.136.105|RA4=184.26.140.9|RA4=184.26.140.189|RA4=184.26.142.34|RA4=184.26.142.43|RA4=184.26.142.50|RA4=184.26.142.82|RA4=184.26.142.98|RA4=184.26.143.121|RA4=184.26.143.129|RA4=184.26.143.136|RA4=184.26.143.146|RA4=184.26.143.147|RA4=184.26.143.153|RA4=184.26.143.155|RA4=184.26.143.170|RA4=184.26.154.2|RA4=184.26.159.20|RA4=184.26.162.19|RA4=184.26.162.32|RA4=184.26.162.35|RA4=184.26.162.49|RA4=184.26.178.161|RA4=184.26.196.227|RA4=184.26.200.152|RA4=184.26.201.198|RA4=184.26.203.125|RA4=184.26.209.183|RA4=184.26.213.155|RA4=184.26.215.9|RA4=184.26.215.150|RA4=184.26.222.171|RA4=184.26.237.180|RA4=184.26.242.185|RA4=184.26.250.111|RA4=184.150.154.35|RA4=184.150.154.43|RA4=184.150.154.56|RA4=184.150.157.105|RA4=184.150.157.121|RA4=184.150.157.122|RA4=184.150.157.160|RA4=184.150.157.162|RA4=184.150.157.163|RA4=184.150.158.9|RA4=184.150.158.11|RA4=184.150.158.16|RA4=184.150.158.17|RA4=184.150.158.18|RA4=184.150.158.19|RA4=184.150.187.72|RA4=184.150.187.73|RA4=184.150.187.80|RA4=184.150.187.82|RA4=184.150.187.83|RA4=184.150.187.89|RA4=184.150.188.253|RA4=184.150.189.253|RA4=184.168.221.104|RA4=184.180.124.57|RA4=184.180.124.64|RA4=184.180.124.72|RA4=184.180.124.73|RA4=184.180.124.115|RA4=184.180.124.138|RA4=184.180.124.163|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-6|""
""{B7668C20-497D-418A-9671-8B7A2D86FAD9}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=184.26.6.195|RA4=184.26.8.89|RA4=184.26.44.98|RA4=184.26.54.8|RA4=184.26.54.9|RA4=184.26.54.10|RA4=184.26.54.16|RA4=184.26.54.17|RA4=184.26.54.25|RA4=184.26.54.50|RA4=184.26.62.97|RA4=184.26.62.104|RA4=184.26.62.106|RA4=184.26.62.123|RA4=184.26.62.130|RA4=184.26.62.146|RA4=184.26.72.12|RA4=184.26.93.35|RA4=184.26.93.48|RA4=184.26.93.50|RA4=184.26.93.64|RA4=184.26.93.74|RA4=184.26.93.81|RA4=184.27.20.121|RA4=184.27.31.33|RA4=184.27.34.161|RA4=184.27.46.161|RA4=184.27.46.179|RA4=184.27.136.250|RA4=184.27.137.10|RA4=184.27.168.12|RA4=184.27.177.220|RA4=184.27.254.76|RA4=184.28.2.45|RA4=184.28.17.202|RA4=184.28.17.209|RA4=184.28.17.219|RA4=184.28.55.170|RA4=184.28.56.185|RA4=184.28.98.240|RA4=184.28.112.70|RA4=184.28.126.137|RA4=184.28.126.145|RA4=184.28.126.185|RA4=184.28.126.186|RA4=184.28.138.15|RA4=184.28.141.112|RA4=184.28.181.54|RA4=184.28.188.26|RA4=184.28.188.59|RA4=184.28.188.64|RA4=184.28.188.67|RA4=184.28.188.89|RA4=184.28.188.96|RA4=184.28.188.97|RA4=184.28.188.98|RA4=184.28.188.105|RA4=184.28.188.120|RA4=184.28.188.131|RA4=184.28.188.138|RA4=184.28.188.145|RA4=184.28.188.146|RA4=184.28.188.154|RA4=184.28.188.161|RA4=184.28.188.162|RA4=184.28.188.178|RA4=184.28.188.202|RA4=184.28.188.217|RA4=184.28.188.219|RA4=184.28.199.173|RA4=184.28.218.128|RA4=184.28.218.130|RA4=184.28.246.177|RA4=184.29.8.99|RA4=184.29.41.175|RA4=184.29.49.231|RA4=184.29.58.114|RA4=184.29.71.162|RA4=184.29.78.62|RA4=184.29.78.126|RA4=184.29.78.197|RA4=184.29.88.64|RA4=184.29.104.123|RA4=184.29.104.129|RA4=184.29.104.131|RA4=184.29.104.145|RA4=184.29.104.152|RA4=184.29.104.163|RA4=184.29.104.177|RA4=184.29.104.210|RA4=184.29.104.243|RA4=184.29.104.249|RA4=184.29.106.34|RA4=184.29.106.35|RA4=184.29.106.43|RA4=184.29.106.51|RA4=184.29.106.115|RA4=184.29.106.121|RA4=184.29.123.66|RA4=184.29.124.194|RA4=184.29.155.83|RA4=184.29.160.47|RA4=184.29.175.119|RA4=184.29.176.234|RA4=184.29.180.97|RA4=184.29.187.52|RA4=184.30.23.82|RA4=184.30.29.182|RA4=184.30.48.41|RA4=184.30.50.32|RA4=184.30.53.111|RA4=184.30.54.102|RA4=184.30.62.2|RA4=184.30.104.12|RA4=184.30.146.240|RA4=184.30.155.189|RA4=184.30.156.192|RA4=184.30.192.77|RA4=184.30.193.76|RA4=184.30.209.245|RA4=184.30.213.217|RA4=184.30.215.50|RA4=184.30.215.154|RA4=184.30.219.154|RA4=184.31.46.42|RA4=184.31.53.119|RA4=184.31.84.43|RA4=184.31.84.78|RA4=184.31.86.248|RA4=184.31.124.164|RA4=184.31.176.219|RA4=184.31.181.47|RA4=184.31.195.215|RA4=184.31.200.142|RA4=184.31.216.43|RA4=184.31.216.74|RA4=184.31.218.195|RA4=184.31.221.20|RA4=184.31.234.223|RA4=184.31.237.230|RA4=184.31.250.42|RA4=184.50.8.144|RA4=184.50.22.161|RA4=184.50.87.24|RA4=184.50.87.25|RA4=184.50.87.40|RA4=184.50.87.49|RA4=184.50.87.51|RA4=184.50.87.64|RA4=184.50.87.96|RA4=184.50.87.114|RA4=184.50.87.136|RA4=184.50.87.139|RA4=184.50.87.187|RA4=184.50.90.70|RA4=184.50.92.219|RA4=184.50.123.47|RA4=184.50.151.71|RA4=184.50.162.136|RA4=184.50.169.63|RA4=184.50.183.68|RA4=184.50.186.97|RA4=184.50.201.197|RA4=184.50.205.199|RA4=184.50.208.196|RA4=184.50.229.159|RA4=184.50.229.167|RA4=184.50.229.174|RA4=184.50.229.177|RA4=184.50.232.65|RA4=184.50.232.66|RA4=184.50.232.89|RA4=184.50.232.90|RA4=184.50.232.113|RA4=184.50.232.136|RA4=184.50.232.153|RA4=184.50.237.11|RA4=184.50.237.26|RA4=184.50.237.49|RA4=184.50.237.57|RA4=184.50.237.66|RA4=184.50.237.81|RA4=184.50.237.90|RA4=184.50.238.170|RA4=184.50.238.171|RA4=184.50.238.193|RA4=184.50.238.217|RA4=184.50.238.219|RA4=184.50.238.225|RA4=184.50.239.73|RA4=184.50.239.80|RA4=184.50.239.89|RA4=184.50.239.107|RA4=184.50.244.13|RA4=184.50.250.108|RA4=184.50.253.115|RA4=184.51.0.8|RA4=184.51.0.16|RA4=184.51.0.32|RA4=184.51.0.33|RA4=184.51.0.34|RA4=184.51.0.51|RA4=184.51.0.66|RA4=184.51.0.72|RA4=184.51.0.74|RA4=184.51.0.91|RA4=184.51.0.123|RA4=184.51.0.136|RA4=184.51.1.26|RA4=184.51.1.35|RA4=184.51.1.59|RA4=184.51.1.80|RA4=184.51.7.16|RA4=184.51.15.166|RA4=184.51.15.191|RA4=184.51.17.51|RA4=184.51.40.8|RA4=184.51.40.9|RA4=184.51.46.161|RA4=184.51.89.56|RA4=184.51.90.66|RA4=184.51.93.17|RA4=184.51.102.18|RA4=184.51.102.40|RA4=184.51.102.41|RA4=184.51.102.42|RA4=184.51.102.48|RA4=184.51.102.72|RA4=184.51.112.72|RA4=184.51.112.73|RA4=184.51.112.136|RA4=184.51.112.147|RA4=184.51.112.169|RA4=184.51.113.153|RA4=184.51.113.160|RA4=184.51.114.250|RA4=184.51.115.9|RA4=184.51.115.16|RA4=184.51.115.17|RA4=184.51.115.19|RA4=184.51.115.24|RA4=184.51.116.123|RA4=184.51.119.137|RA4=184.51.126.10|RA4=184.51.126.24|RA4=184.51.126.33|RA4=184.51.126.51|RA4=184.51.126.59|RA4=184.51.126.74|RA4=184.51.126.80|RA4=184.51.126.99|RA4=184.51.126.105|RA4=184.51.126.112|RA4=184.51.128.106|RA4=184.51.142.138|RA4=184.51.144.56|RA4=184.51.144.65|RA4=184.51.144.91|RA4=184.51.144.96|RA4=184.51.144.232|RA4=184.51.144.234|RA4=184.51.146.8|RA4=184.51.146.16|RA4=184.51.147.49|RA4=184.51.147.51|RA4=184.51.147.57|RA4=184.51.147.59|RA4=184.51.147.76|RA4=184.51.147.92|RA4=184.51.147.100|RA4=184.51.147.146|RA4=184.51.147.169|RA4=184.51.148.75|RA4=184.51.148.83|RA4=184.51.148.121|RA4=184.51.148.122|RA4=184.51.148.131|RA4=184.51.148.145|RA4=184.51.150.17|RA4=184.51.150.27|RA4=184.51.150.74|RA4=184.51.150.83|RA4=184.51.150.114|RA4=184.51.150.122|RA4=184.51.150.145|RA4=184.51.159.106|RA4=184.51.159.191|RA4=184.51.159.215|RA4=184.51.159.236|RA4=184.51.184.12|RA4=184.51.198.107|RA4=184.51.198.113|RA4=184.51.198.130|RA4=184.51.198.136|RA4=184.51.198.139|RA4=184.51.198.144|RA4=184.51.198.154|RA4=184.51.198.155|RA4=184.51.198.163|RA4=184.51.232.227|RA4=184.51.234.39|RA4=184.84.8.12|RA4=184.84.32.195|RA4=184.84.36.208|RA4=184.84.45.124|RA4=184.84.47.16|RA4=184.84.49.68|RA4=184.84.52.127|RA4=184.84.53.237|RA4=184.84.60.193|RA4=184.84.65.129|RA4=184.84.75.33|RA4=184.84.112.51|RA4=184.84.115.243|RA4=184.84.116.41|RA4=184.84.120.42|RA4=184.84.129.235|RA4=184.84.141.139|RA4=184.84.170.70|RA4=184.84.183.26|RA4=184.84.183.89|RA4=184.84.187.208|RA4=184.84.195.94|RA4=184.84.198.161|RA4=184.84.205.74|RA4=184.84.207.221|RA4=184.84.221.10|RA4=184.84.221.17|RA4=184.84.234.24|RA4=184.84.234.25|RA4=184.84.243.33|RA4=184.84.243.41|RA4=184.84.243.193|RA4=184.84.243.202|RA4=184.84.243.209|RA4=184.84.243.210|RA4=184.84.243.225|RA4=184.84.243.233|RA4=184.84.243.234|RA4=184.84.244.96|RA4=184.84.244.121|RA4=184.84.244.146|RA4=184.84.244.163|RA4=184.85.35.83|RA4=184.85.75.186|RA4=184.85.76.170|RA4=184.85.78.208|RA4=184.85.99.237|RA4=184.85.104.167|RA4=184.85.106.237|RA4=184.85.109.87|RA4=184.85.114.123|RA4=184.85.128.168|RA4=184.85.134.231|RA4=184.85.136.117|RA4=184.85.141.210|RA4=184.85.145.125|RA4=184.85.147.31|RA4=184.85.155.30|RA4=184.85.223.139|RA4=184.85.223.155|RA4=184.85.223.171|RA4=184.85.223.219|RA4=184.85.242.218|RA4=184.86.1.122|RA4=184.86.40.12|RA4=184.86.56.12|RA4=184.86.80.185|RA4=184.86.82.170|RA4=184.86.83.160|RA4=184.86.86.65|RA4=184.86.88.62|RA4=184.86.88.202|RA4=184.86.89.221|RA4=184.86.104.34|RA4=184.86.120.161|RA4=184.86.144.81|RA4=184.86.193.156|RA4=184.86.216.22|RA4=184.86.223.176|RA4=184.86.223.195|RA4=184.86.223.225|RA4=184.86.224.90|RA4=184.86.225.153|RA4=184.86.226.161|RA4=184.86.235.23|RA4=184.86.240.73|RA4=184.86.240.80|RA4=184.86.240.179|RA4=184.86.240.187|RA4=184.86.240.211|RA4=184.86.250.9|RA4=184.86.250.10|RA4=184.86.250.11|RA4=184.86.250.17|RA4=184.86.250.19|RA4=184.86.250.33|RA4=184.86.250.43|RA4=184.87.57.63|RA4=184.87.96.157|RA4=184.87.97.162|RA4=184.87.98.37|RA4=184.87.101.129|RA4=184.87.118.22|RA4=184.87.124.38|RA4=184.87.127.45|RA4=184.87.134.161|RA4=184.87.135.118|RA4=184.87.160.193|RA4=184.87.193.186|RA4=184.87.194.168|RA4=184.87.194.216|RA4=184.87.199.55|RA4=184.87.199.238|RA4=184.87.208.14|RA4=184.87.218.241|RA4=184.87.220.94|RA4=184.87.220.110|RA4=184.87.232.12|RA4=185.4.81.73|RA4=185.4.81.74|RA4=185.4.81.75|RA4=185.4.81.80|RA4=185.4.81.81|RA4=185.11.245.137|RA4=185.11.245.138|RA4=185.11.245.139|RA4=185.11.245.144|RA4=185.13.160.61|RA4=185.13.160.189|RA4=185.13.160.253|RA4=185.27.16.8|RA4=185.27.16.10|RA4=185.27.16.16|RA4=185.27.16.18|RA4=185.27.16.27|RA4=185.27.16.32|RA4=185.33.220.5|RA4=185.33.220.10|RA4=185.33.220.26|RA4=185.33.220.27|RA4=185.33.220.38|RA4=185.33.220.39|RA4=185.33.220.58|RA4=185.33.220.59|RA4=185.33.220.197|RA4=185.33.220.199|RA4=185.33.220.210|RA4=185.33.220.215|RA4=185.33.221.58|RA4=185.33.222.5|RA4=185.33.222.8|RA4=185.33.222.16|RA4=185.33.222.20|RA4=185.33.222.23|RA4=185.33.222.60|RA4=185.33.222.61|RA4=185.33.222.62|RA4=185.33.222.77|RA4=185.33.222.93|RA4=185.33.222.94|RA4=185.33.222.153|RA4=185.33.222.170|RA4=185.33.222.187|RA4=185.33.222.210|RA4=185.33.222.236|RA4=185.33.222.249|RA4=185.33.223.10|RA4=185.33.223.11|RA4=185.33.223.45|RA4=185.33.223.80|RA4=185.33.223.83|RA4=185.33.223.197|RA4=185.33.223.198|RA4=185.33.223.200|RA4=185.33.223.202|RA4=185.33.223.203|RA4=185.33.223.204|RA4=185.33.223.206|RA4=185.33.223.208|RA4=185.33.223.209|RA4=185.33.223.210|RA4=185.33.223.215|RA4=185.33.223.216|RA4=185.33.223.218|RA4=185.33.223.220|RA4=185.33.223.221|RA4=185.43.180.144|RA4=185.43.180.147|RA4=185.43.180.154|RA4=185.43.180.168|RA4=185.43.180.176|RA4=185.43.180.179|RA4=185.43.181.25|RA4=185.43.181.187|RA4=185.43.181.193|RA4=185.43.181.194|RA4=185.43.181.203|RA4=185.43.181.208|RA4=185.43.181.232|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-7|""
""{73057EF9-D63E-4CCA-A12A-2A517B8CDD7A}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=185.5.160.24|RA4=185.5.160.25|RA4=185.5.160.27|RA4=185.5.160.33|RA4=185.5.160.35|RA4=185.5.160.137|RA4=185.5.160.138|RA4=185.5.160.139|RA4=185.5.160.144|RA4=185.5.160.145|RA4=185.5.160.146|RA4=185.5.160.147|RA4=185.8.148.231|RA4=185.8.148.233|RA4=185.8.148.238|RA4=185.8.148.239|RA4=185.43.181.8|RA4=185.43.181.50|RA4=185.43.181.51|RA4=185.43.181.250|RA4=185.43.182.8|RA4=185.43.182.10|RA4=185.43.182.26|RA4=185.43.182.32|RA4=185.43.182.35|RA4=185.43.182.41|RA4=185.43.182.48|RA4=185.43.182.50|RA4=185.43.182.51|RA4=185.43.182.56|RA4=185.43.182.57|RA4=185.43.182.67|RA4=185.43.182.82|RA4=185.52.170.8|RA4=185.52.170.10|RA4=185.52.170.11|RA4=185.52.170.16|RA4=185.52.170.19|RA4=185.52.170.24|RA4=185.52.170.26|RA4=185.60.216.6|RA4=185.60.218.7|RA4=186.16.15.74|RA4=186.16.15.81|RA4=186.16.15.82|RA4=186.16.15.88|RA4=186.46.140.201|RA4=186.46.140.203|RA4=186.46.140.216|RA4=186.46.140.218|RA4=186.46.140.219|RA4=186.46.140.224|RA4=186.46.141.200|RA4=186.46.141.202|RA4=186.46.141.210|RA4=186.46.141.216|RA4=186.46.141.224|RA4=186.151.236.136|RA4=186.151.236.144|RA4=186.151.236.152|RA4=186.151.236.153|RA4=186.151.236.161|RA4=186.151.236.169|RA4=186.151.236.170|RA4=186.151.236.171|RA4=186.208.224.72|RA4=186.208.224.73|RA4=186.208.224.74|RA4=186.208.224.80|RA4=186.215.111.64|RA4=186.215.111.72|RA4=186.215.111.75|RA4=186.215.111.81|RA4=186.215.111.83|RA4=186.215.111.90|RA4=186.215.111.91|RA4=186.225.49.200|RA4=186.225.49.201|RA4=187.1.87.200|RA4=187.1.87.201|RA4=187.1.87.202|RA4=187.18.184.137|RA4=187.18.184.138|RA4=187.44.150.104|RA4=187.44.150.105|RA4=187.44.150.106|RA4=187.59.4.67|RA4=187.59.4.74|RA4=187.59.4.81|RA4=187.59.4.82|RA4=187.59.4.83|RA4=187.59.4.89|RA4=187.72.248.72|RA4=187.72.248.74|RA4=187.72.248.82|RA4=187.72.248.97|RA4=187.87.196.74|RA4=187.108.174.8|RA4=187.108.174.9|RA4=187.108.174.10|RA4=187.141.1.127|RA4=187.141.1.128|RA4=187.157.63.105|RA4=187.157.63.107|RA4=187.157.63.112|RA4=187.157.63.113|RA4=187.210.45.16|RA4=187.210.45.17|RA4=187.210.45.33|RA4=187.210.45.35|RA4=187.210.45.67|RA4=187.210.45.75|RA4=187.210.208.58|RA4=187.210.208.59|RA4=187.210.208.65|RA4=187.210.208.96|RA4=187.210.208.97|RA4=188.43.72.2|RA4=188.43.72.19|RA4=188.43.72.32|RA4=188.43.72.48|RA4=188.43.72.83|RA4=188.43.72.107|RA4=188.43.72.113|RA4=188.43.72.120|RA4=188.43.72.254|RA4=188.43.73.0|RA4=188.43.73.48|RA4=188.43.73.51|RA4=188.43.73.72|RA4=188.43.73.89|RA4=188.43.73.90|RA4=188.43.73.104|RA4=188.43.74.32|RA4=188.43.74.35|RA4=188.43.74.41|RA4=188.43.74.48|RA4=188.43.74.49|RA4=188.43.74.72|RA4=188.43.74.74|RA4=188.43.74.80|RA4=188.43.74.83|RA4=188.43.74.99|RA4=188.43.74.110|RA4=188.43.74.125|RA4=188.43.74.137|RA4=188.43.74.138|RA4=188.43.74.152|RA4=188.43.74.163|RA4=188.43.74.184|RA4=188.43.74.185|RA4=188.43.74.186|RA4=188.43.74.187|RA4=188.43.74.238|RA4=188.43.74.240|RA4=188.43.74.246|RA4=188.43.74.248|RA4=188.43.74.249|RA4=188.43.75.10|RA4=188.43.75.18|RA4=188.43.75.24|RA4=188.43.75.34|RA4=188.43.75.47|RA4=188.43.75.55|RA4=188.43.75.73|RA4=188.43.75.75|RA4=188.43.75.80|RA4=188.43.75.81|RA4=188.43.75.88|RA4=188.43.75.89|RA4=188.43.75.90|RA4=188.43.75.97|RA4=188.43.75.104|RA4=188.43.75.137|RA4=188.43.75.139|RA4=188.43.75.144|RA4=188.43.75.147|RA4=188.43.76.66|RA4=188.43.76.74|RA4=188.93.174.136|RA4=188.93.174.137|RA4=188.93.174.138|RA4=188.93.174.139|RA4=188.93.174.144|RA4=188.111.53.34|RA4=188.111.53.40|RA4=188.111.53.43|RA4=188.111.53.48|RA4=188.111.53.50|RA4=188.111.53.51|RA4=188.111.53.58|RA4=188.234.142.189|RA4=189.11.250.41|RA4=189.11.250.49|RA4=189.11.250.137|RA4=189.11.250.138|RA4=189.198.250.75|RA4=189.198.250.80|RA4=189.198.250.81|RA4=189.198.250.82|RA4=189.198.250.83|RA4=189.198.250.88|RA4=189.247.164.11|RA4=189.247.164.50|RA4=189.247.165.136|RA4=189.247.165.160|RA4=189.247.165.163|RA4=189.247.165.168|RA4=189.254.81.27|RA4=189.254.81.33|RA4=189.254.81.89|RA4=189.254.81.106|RA4=189.254.81.114|RA4=189.254.81.120|RA4=189.254.81.122|RA4=189.254.81.123|RA4=189.254.81.128|RA4=190.2.175.8|RA4=190.2.175.9|RA4=190.2.175.10|RA4=190.2.175.11|RA4=190.2.175.16|RA4=190.55.60.168|RA4=190.55.60.169|RA4=190.85.253.16|RA4=190.85.253.17|RA4=190.85.253.26|RA4=190.85.253.32|RA4=190.85.253.34|RA4=190.91.253.136|RA4=190.91.253.146|RA4=190.91.253.153|RA4=190.91.253.154|RA4=190.91.253.161|RA4=190.91.253.162|RA4=190.94.187.8|RA4=190.94.187.9|RA4=190.94.187.10|RA4=190.96.8.146|RA4=190.96.8.147|RA4=190.96.8.162|RA4=190.96.8.168|RA4=190.96.8.171|RA4=190.96.87.73|RA4=190.96.87.81|RA4=190.96.87.82|RA4=190.96.87.83|RA4=190.96.87.88|RA4=190.96.87.90|RA4=190.98.130.170|RA4=190.98.130.171|RA4=190.98.130.177|RA4=190.98.140.9|RA4=190.98.140.10|RA4=190.98.140.89|RA4=190.98.140.97|RA4=190.98.140.105|RA4=190.98.140.114|RA4=190.98.140.120|RA4=190.98.140.123|RA4=190.98.140.137|RA4=190.98.142.24|RA4=190.98.142.32|RA4=190.98.142.35|RA4=190.98.142.42|RA4=190.98.142.169|RA4=190.98.142.186|RA4=190.98.142.192|RA4=190.98.142.252|RA4=190.98.142.254|RA4=190.98.144.41|RA4=190.98.144.43|RA4=190.98.144.138|RA4=190.98.144.147|RA4=190.98.144.161|RA4=190.98.144.177|RA4=190.98.144.193|RA4=190.98.146.10|RA4=190.98.146.24|RA4=190.98.146.25|RA4=190.98.146.27|RA4=190.98.146.56|RA4=190.98.152.18|RA4=190.98.152.27|RA4=190.98.152.34|RA4=190.98.152.35|RA4=190.98.161.152|RA4=190.98.161.155|RA4=190.98.161.161|RA4=190.98.161.162|RA4=190.98.161.163|RA4=190.98.161.169|RA4=190.98.161.177|RA4=190.121.104.138|RA4=190.121.104.144|RA4=190.121.104.146|RA4=190.121.104.154|RA4=190.121.104.168|RA4=190.121.104.176|RA4=190.167.241.73|RA4=190.167.241.75|RA4=190.167.241.81|RA4=190.167.241.83|RA4=190.167.241.88|RA4=190.208.14.144|RA4=190.208.14.152|RA4=190.208.14.202|RA4=190.208.14.219|RA4=190.210.62.9|RA4=190.210.62.10|RA4=190.210.62.11|RA4=190.210.62.16|RA4=190.210.62.17|RA4=190.221.164.232|RA4=190.221.164.235|RA4=190.248.95.145|RA4=190.248.95.153|RA4=190.248.95.160|RA4=190.248.95.168|RA4=190.248.95.169|RA4=190.248.95.170|RA4=190.248.95.179|RA4=190.248.95.187|RA4=191.32.13.8|RA4=191.32.13.10|RA4=191.32.13.16|RA4=191.32.13.17|RA4=191.32.13.19|RA4=191.32.13.32|RA4=191.32.13.34|RA4=191.32.13.35|RA4=191.32.13.40|RA4=191.32.13.41|RA4=191.32.13.42|RA4=191.32.13.66|RA4=191.32.13.74|RA4=191.34.33.136|RA4=191.34.33.144|RA4=191.34.33.147|RA4=191.34.33.152|RA4=191.34.33.160|RA4=191.34.33.176|RA4=191.232.139.253|RA4=191.232.139.254|RA4=191.232.140.76|RA4=191.238.35.163|RA4=191.239.6.111|RA4=191.239.8.15|RA4=192.67.191.126|RA4=192.70.187.40|RA4=192.70.187.41|RA4=192.70.187.42|RA4=192.91.244.229|RA4=192.91.244.231|RA4=192.122.184.144|RA4=192.122.184.146|RA4=192.122.184.152|RA4=192.122.184.154|RA4=192.122.184.200|RA4=192.122.184.201|RA4=192.204.26.51|RA4=192.204.26.57|RA4=192.204.82.51|RA4=192.204.82.64|RA4=192.221.77.253|RA4=192.221.78.125|RA4=192.221.97.126|RA4=192.221.99.253|RA4=192.221.100.253|RA4=192.221.101.254|RA4=192.221.105.254|RA4=192.221.106.126|RA4=192.221.108.126|RA4=192.221.111.252|RA4=192.221.112.253|RA4=192.221.113.253|RA4=192.221.116.253|RA4=192.221.118.253|RA4=192.221.123.126|RA4=192.221.124.126|RA4=192.221.126.126|RA4=192.221.126.254|RA4=192.221.127.126|RA4=192.221.127.253|RA4=192.229.145.200|RA4=192.229.163.249|RA4=192.229.233.249|RA4=192.229.237.249|RA4=192.232.17.137|RA4=192.232.17.160|RA4=192.232.17.200|RA4=192.232.17.202|RA4=192.232.17.208|RA4=192.232.17.210|RA4=193.4.144.72|RA4=193.4.144.82|RA4=193.4.144.83|RA4=193.4.144.88|RA4=193.45.10.138|RA4=193.45.10.144|RA4=193.45.10.185|RA4=193.45.15.161|RA4=193.45.15.169|RA4=193.45.15.171|RA4=193.45.15.178|RA4=193.51.224.6|RA4=193.51.224.8|RA4=193.51.224.14|RA4=193.51.224.22|RA4=193.51.224.30|RA4=193.77.14.138|RA4=193.77.14.146|RA4=193.77.14.147|RA4=193.77.14.152|RA4=193.77.14.155|RA4=193.77.14.161|RA4=193.120.1.9|RA4=193.120.1.27|RA4=193.120.1.32|RA4=193.120.1.33|RA4=193.120.1.34|RA4=193.120.1.41|RA4=193.140.13.73|RA4=193.140.13.81|RA4=193.140.13.82|RA4=193.140.13.88|RA4=193.140.13.97|RA4=193.170.140.70|RA4=193.170.140.78|RA4=193.170.140.79|RA4=193.170.140.80|RA4=193.170.140.86|RA4=193.170.140.87|RA4=193.184.164.136|RA4=193.184.164.139|RA4=193.184.164.176|RA4=193.184.164.191|RA4=193.212.170.73|RA4=193.212.170.75|RA4=193.212.170.81|RA4=193.212.170.160|RA4=193.212.170.161|RA4=193.212.178.50|RA4=193.212.178.56|RA4=193.212.178.59|RA4=193.212.178.72|RA4=193.212.178.73|RA4=193.212.178.74|RA4=193.221.113.53|RA4=193.225.13.230|RA4=193.225.13.232|RA4=193.225.13.233|RA4=193.229.109.90|RA4=193.229.109.106|RA4=193.240.112.254|RA4=193.240.113.126|RA4=193.240.120.124|RA4=193.247.41.40|RA4=193.247.41.41|RA4=193.247.41.42|RA4=193.247.41.136|RA4=193.247.41.137|RA4=193.247.41.138|RA4=193.247.41.146|RA4=193.247.41.147|RA4=193.247.41.154|RA4=193.247.41.160|RA4=193.247.41.161|RA4=193.247.90.8|RA4=193.247.90.9|RA4=193.247.90.11|RA4=193.247.90.18|RA4=193.247.90.24|RA4=193.247.90.25|RA4=193.247.90.32|RA4=193.247.90.58|RA4=193.247.90.65|RA4=193.247.90.67|RA4=193.247.167.9|RA4=193.247.167.10|RA4=193.247.167.11|RA4=193.247.167.17|RA4=193.247.167.136|RA4=193.247.167.137|RA4=193.247.167.139|RA4=193.247.167.144|RA4=193.247.167.145|RA4=193.247.167.146|RA4=194.100.35.136|RA4=194.100.35.142|RA4=194.100.35.152|RA4=194.100.35.159|RA4=194.146.191.105|RA4=194.146.191.106|RA4=194.146.191.107|RA4=194.146.191.115|RA4=194.176.144.125|RA4=194.176.144.253|RA4=194.177.211.136|RA4=194.177.211.137|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-8|""
""{FEF96FE2-0B15-4C83-BD7A-EB5289E1F5DF}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=2.16.3.140|RA4=2.16.4.8|RA4=2.16.4.19|RA4=2.16.4.139|RA4=2.16.4.155|RA4=2.16.4.168|RA4=2.16.4.176|RA4=2.16.4.178|RA4=2.16.4.194|RA4=2.16.4.209|RA4=2.16.4.210|RA4=2.16.4.217|RA4=2.16.10.17|RA4=2.16.10.19|RA4=2.16.10.33|RA4=2.16.10.49|RA4=2.16.10.66|RA4=2.16.10.73|RA4=2.16.10.83|RA4=2.16.10.88|RA4=2.16.10.90|RA4=2.16.10.105|RA4=2.16.10.130|RA4=2.16.18.106|RA4=2.16.19.230|RA4=2.16.23.38|RA4=2.16.31.120|RA4=2.16.43.81|RA4=2.16.47.84|RA4=2.16.63.59|RA4=2.16.63.64|RA4=2.16.63.227|RA4=2.16.64.170|RA4=2.16.64.176|RA4=2.16.64.178|RA4=2.16.64.179|RA4=2.16.69.57|RA4=2.16.69.187|RA4=2.16.73.59|RA4=2.16.100.51|RA4=2.16.100.56|RA4=2.16.100.57|RA4=2.16.100.58|RA4=2.16.100.73|RA4=2.16.100.74|RA4=2.16.100.75|RA4=2.16.100.160|RA4=2.16.100.169|RA4=2.16.100.170|RA4=2.16.100.179|RA4=2.16.106.48|RA4=2.16.106.120|RA4=2.16.115.234|RA4=2.16.117.113|RA4=2.16.117.114|RA4=2.16.117.115|RA4=2.16.117.120|RA4=2.16.117.121|RA4=2.16.117.123|RA4=2.16.117.128|RA4=2.16.117.130|RA4=2.16.117.137|RA4=2.16.117.138|RA4=2.16.117.144|RA4=2.16.117.145|RA4=2.16.117.146|RA4=2.16.117.147|RA4=2.16.117.152|RA4=2.16.117.153|RA4=2.16.117.155|RA4=2.16.117.161|RA4=2.16.117.168|RA4=2.16.117.169|RA4=2.16.117.170|RA4=2.16.117.171|RA4=2.16.117.176|RA4=2.16.117.177|RA4=2.16.117.179|RA4=2.16.117.184|RA4=2.16.144.192|RA4=2.16.147.109|RA4=2.16.153.50|RA4=2.16.153.73|RA4=2.16.153.81|RA4=2.16.153.97|RA4=2.16.153.105|RA4=2.16.155.10|RA4=2.16.155.17|RA4=2.16.155.33|RA4=2.16.155.42|RA4=2.16.162.10|RA4=2.16.162.19|RA4=2.16.162.40|RA4=2.16.162.43|RA4=2.16.162.48|RA4=2.16.162.49|RA4=2.16.171.154|RA4=2.16.178.134|RA4=2.16.191.70|RA4=2.16.195.203|RA4=2.16.216.32|RA4=2.16.216.41|RA4=2.16.216.43|RA4=2.16.216.65|RA4=2.16.216.176|RA4=2.16.216.178|RA4=2.16.216.185|RA4=2.16.216.200|RA4=2.16.217.74|RA4=2.16.217.82|RA4=2.16.217.88|RA4=2.16.217.91|RA4=2.16.217.112|RA4=2.16.235.172|RA4=2.17.24.174|RA4=2.17.25.6|RA4=2.17.41.63|RA4=2.17.42.65|RA4=2.17.42.81|RA4=2.17.42.91|RA4=2.17.42.105|RA4=2.17.44.254|RA4=2.17.46.213|RA4=2.17.68.188|RA4=2.17.98.68|RA4=2.17.100.108|RA4=2.17.103.173|RA4=2.17.106.128|RA4=2.17.107.50|RA4=2.17.116.57|RA4=2.17.121.25|RA4=2.17.121.33|RA4=2.17.123.50|RA4=2.17.123.83|RA4=2.17.123.209|RA4=2.17.124.105|RA4=2.17.132.90|RA4=2.17.133.43|RA4=2.17.152.16|RA4=2.17.156.89|RA4=2.17.157.48|RA4=2.17.162.15|RA4=2.17.170.75|RA4=2.17.171.237|RA4=2.17.185.228|RA4=2.17.191.2|RA4=2.17.193.157|RA4=2.17.194.120|RA4=2.17.212.15|RA4=2.17.212.35|RA4=2.17.213.43|RA4=2.17.213.217|RA4=2.17.214.99|RA4=2.17.232.53|RA4=2.17.233.63|RA4=2.17.235.20|RA4=2.17.244.84|RA4=2.17.245.79|RA4=2.17.246.48|RA4=2.17.249.26|RA4=2.17.249.32|RA4=2.17.249.35|RA4=2.17.249.40|RA4=2.17.254.161|RA4=2.18.36.42|RA4=2.18.72.34|RA4=2.18.72.83|RA4=2.18.73.223|RA4=2.18.116.14|RA4=2.18.122.78|RA4=2.18.139.3|RA4=2.18.171.163|RA4=2.18.172.46|RA4=2.18.177.18|RA4=2.18.201.63|RA4=2.18.203.20|RA4=2.18.212.10|RA4=2.18.212.32|RA4=2.18.212.40|RA4=2.18.212.50|RA4=2.18.213.49|RA4=2.18.213.65|RA4=2.18.213.97|RA4=2.18.213.99|RA4=2.18.213.105|RA4=2.18.213.112|RA4=2.18.213.115|RA4=2.18.213.128|RA4=2.18.213.129|RA4=2.18.213.201|RA4=2.18.213.210|RA4=2.18.213.226|RA4=2.18.232.99|RA4=2.18.233.81|RA4=2.18.240.49|RA4=2.18.240.58|RA4=2.18.240.138|RA4=2.18.240.144|RA4=2.18.240.153|RA4=2.18.240.161|RA4=2.18.244.48|RA4=2.18.244.59|RA4=2.18.244.168|RA4=2.18.244.203|RA4=2.18.244.210|RA4=2.18.244.211|RA4=2.18.245.81|RA4=2.18.245.97|RA4=2.18.254.161|RA4=194.25.94.139|RA4=194.25.94.147|RA4=194.25.94.163|RA4=194.25.94.195|RA4=194.25.95.121|RA4=194.25.95.129|RA4=194.25.95.130|RA4=194.25.95.137|RA4=194.44.4.200|RA4=194.44.4.202|RA4=194.44.4.203|RA4=194.44.4.208|RA4=194.177.211.139|RA4=194.177.211.145|RA4=194.177.211.146|RA4=194.221.65.15|RA4=194.221.65.32|RA4=194.221.65.38|RA4=194.221.65.54|RA4=194.221.65.71|RA4=194.221.65.73|RA4=194.221.65.79|RA4=194.221.65.80|RA4=194.221.65.87|RA4=194.230.42.136|RA4=194.230.42.162|RA4=194.230.42.163|RA4=194.230.42.202|RA4=194.230.42.203|RA4=194.230.42.209|RA4=194.230.42.216|RA4=194.230.42.227|RA4=194.230.42.241|RA4=195.8.11.154|RA4=195.8.11.155|RA4=195.8.11.170|RA4=195.8.22.42|RA4=195.8.22.57|RA4=195.8.22.58|RA4=195.8.22.59|RA4=195.8.22.137|RA4=195.8.22.138|RA4=195.8.22.161|RA4=195.8.22.163|RA4=195.8.22.169|RA4=195.8.22.170|RA4=195.8.22.177|RA4=195.8.22.179|RA4=195.12.179.26|RA4=195.12.179.27|RA4=195.12.179.33|RA4=195.12.179.42|RA4=195.12.179.43|RA4=195.12.225.184|RA4=195.12.225.185|RA4=195.43.73.182|RA4=195.43.73.184|RA4=195.43.73.185|RA4=195.43.73.190|RA4=195.59.44.10|RA4=195.59.44.33|RA4=195.59.44.42|RA4=195.59.44.43|RA4=195.59.150.154|RA4=195.59.150.155|RA4=195.95.193.11|RA4=195.95.193.71|RA4=195.95.193.93|RA4=195.95.193.95|RA4=195.113.232.73|RA4=195.113.232.75|RA4=195.113.232.82|RA4=195.113.232.88|RA4=195.113.232.90|RA4=195.113.232.91|RA4=195.138.255.8|RA4=195.138.255.10|RA4=195.138.255.17|RA4=195.138.255.19|RA4=195.138.255.24|RA4=195.138.255.32|RA4=195.138.255.34|RA4=195.145.147.59|RA4=195.145.147.65|RA4=195.145.147.67|RA4=195.145.147.74|RA4=195.145.147.88|RA4=195.167.195.42|RA4=195.167.195.43|RA4=195.167.195.48|RA4=195.167.195.50|RA4=195.167.195.56|RA4=195.167.195.57|RA4=195.175.112.104|RA4=195.175.112.123|RA4=195.175.112.138|RA4=195.175.112.145|RA4=195.175.112.203|RA4=195.175.112.218|RA4=195.175.112.219|RA4=195.175.112.227|RA4=195.175.114.171|RA4=195.175.114.184|RA4=195.175.114.200|RA4=195.175.114.201|RA4=195.175.114.203|RA4=195.175.114.211|RA4=195.175.115.32|RA4=195.175.115.48|RA4=195.175.115.51|RA4=195.175.116.58|RA4=195.175.116.66|RA4=195.175.116.67|RA4=195.175.116.73|RA4=195.191.238.198|RA4=195.191.238.200|RA4=195.191.238.206|RA4=195.191.238.207|RA4=195.191.238.209|RA4=195.215.37.6|RA4=195.215.37.9|RA4=195.215.37.15|RA4=195.215.37.16|RA4=195.215.37.24|RA4=195.215.37.39|RA4=195.215.37.78|RA4=195.215.37.88|RA4=195.215.37.89|RA4=195.215.37.97|RA4=195.215.247.9|RA4=195.215.247.11|RA4=195.215.247.16|RA4=195.215.247.17|RA4=195.215.247.27|RA4=195.215.247.56|RA4=195.215.247.58|RA4=195.215.247.59|RA4=195.215.247.67|RA4=195.215.247.73|RA4=195.215.247.74|RA4=195.215.247.80|RA4=195.219.16.138|RA4=195.219.16.155|RA4=195.219.216.18|RA4=195.219.216.25|RA4=195.219.216.34|RA4=195.219.216.40|RA4=195.219.217.74|RA4=195.219.217.76|RA4=195.219.217.83|RA4=195.219.217.99|RA4=195.219.217.100|RA4=195.249.26.35|RA4=195.249.26.49|RA4=195.249.26.59|RA4=195.249.26.66|RA4=195.249.27.67|RA4=195.249.27.73|RA4=195.249.27.80|RA4=196.12.213.56|RA4=196.12.213.57|RA4=196.12.213.58|RA4=196.14.9.9|RA4=196.14.9.18|RA4=196.14.9.41|RA4=196.14.9.43|RA4=196.14.182.139|RA4=196.14.182.145|RA4=196.14.182.153|RA4=196.24.45.8|RA4=196.24.45.10|RA4=196.24.45.16|RA4=196.24.45.19|RA4=196.24.45.25|RA4=196.26.223.17|RA4=196.26.223.25|RA4=196.26.223.26|RA4=196.27.66.9|RA4=196.27.66.11|RA4=196.27.66.16|RA4=196.27.66.17|RA4=196.41.99.9|RA4=196.41.99.10|RA4=197.80.129.125|RA4=197.80.130.9|RA4=197.80.130.24|RA4=197.80.130.25|RA4=197.80.130.27|RA4=197.80.130.35|RA4=197.80.130.41|RA4=197.80.130.43|RA4=197.80.131.138|RA4=197.80.131.146|RA4=197.84.129.125|RA4=197.84.130.11|RA4=197.84.130.18|RA4=197.84.130.24|RA4=197.84.130.27|RA4=197.84.130.48|RA4=198.7.237.72|RA4=198.7.237.74|RA4=198.7.237.79|RA4=198.7.237.81|RA4=198.7.237.87|RA4=198.7.237.88|RA4=198.32.233.9|RA4=198.32.233.11|RA4=198.47.108.32|RA4=198.47.108.91|RA4=198.70.66.9|RA4=198.70.66.11|RA4=198.70.66.17|RA4=198.70.66.19|RA4=198.70.66.24|RA4=198.70.66.26|RA4=198.70.66.34|RA4=198.70.66.35|RA4=198.70.66.49|RA4=198.70.66.137|RA4=198.70.66.139|RA4=198.70.66.147|RA4=198.70.66.152|RA4=198.70.66.160|RA4=198.70.68.138|RA4=198.70.68.144|RA4=198.70.68.163|RA4=198.70.68.177|RA4=198.70.68.179|RA4=198.78.194.252|RA4=198.78.195.126|RA4=198.78.197.254|RA4=198.78.201.253|RA4=198.78.206.253|RA4=198.78.208.254|RA4=198.78.209.253|RA4=198.78.210.126|RA4=198.78.211.254|RA4=198.78.212.126|RA4=198.78.216.253|RA4=198.78.218.126|RA4=198.78.223.126|RA4=198.105.244.74|RA4=198.105.254.74|RA4=198.142.179.126|RA4=198.142.181.126|RA4=198.144.98.89|RA4=198.144.98.96|RA4=198.144.99.180|RA4=198.144.112.17|RA4=198.144.112.24|RA4=198.144.112.26|RA4=198.144.112.32|RA4=198.144.127.88|RA4=198.144.127.107|RA4=198.144.127.154|RA4=198.144.127.160|RA4=198.144.127.162|RA4=198.164.26.136|RA4=198.164.26.137|RA4=198.164.26.139|RA4=198.164.26.160|RA4=198.164.26.161|RA4=198.164.26.162|RA4=198.189.255.138|RA4=198.189.255.139|RA4=198.189.255.140|RA4=198.189.255.199|RA4=198.189.255.201|RA4=198.189.255.207|RA4=198.189.255.222|RA4=198.189.255.224|RA4=199.93.33.254|RA4=199.93.41.126|RA4=199.93.41.253|RA4=199.93.44.126|RA4=199.93.46.126|RA4=199.93.49.253|RA4=199.93.52.126|RA4=199.93.52.252|RA4=199.93.55.126|RA4=199.93.56.121|RA4=199.93.57.254|RA4=199.93.60.254|RA4=199.93.62.126|RA4=199.117.103.122|RA4=199.117.103.128|RA4=199.117.103.130|RA4=199.117.103.146|RA4=199.117.103.153|RA4=199.117.103.154|RA4=199.117.103.176|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-9|""
""{A1D49452-B4A1-478E-ACEB-B327369BDC44}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=2.18.80.169|RA4=2.18.80.239|RA4=2.18.87.127|RA4=2.18.88.110|RA4=2.19.16.144|RA4=2.19.19.34|RA4=2.19.20.30|RA4=2.19.21.79|RA4=2.19.22.183|RA4=2.19.31.24|RA4=2.19.48.214|RA4=2.19.55.126|RA4=2.19.60.16|RA4=2.19.60.46|RA4=2.19.61.13|RA4=2.19.61.194|RA4=2.19.63.182|RA4=2.19.71.191|RA4=2.19.74.230|RA4=2.19.89.63|RA4=2.19.91.31|RA4=2.19.102.238|RA4=2.19.106.73|RA4=2.19.112.246|RA4=2.19.115.149|RA4=2.19.121.252|RA4=2.19.151.57|RA4=2.19.155.62|RA4=2.19.172.129|RA4=2.19.182.238|RA4=2.19.186.73|RA4=2.19.197.239|RA4=2.19.225.53|RA4=2.19.236.184|RA4=2.19.240.10|RA4=2.19.240.21|RA4=2.19.240.92|RA4=2.19.241.27|RA4=2.19.252.82|RA4=2.19.252.241|RA4=2.20.10.161|RA4=2.20.14.128|RA4=2.20.19.117|RA4=2.20.26.161|RA4=2.20.39.68|RA4=2.20.42.161|RA4=2.20.43.160|RA4=2.20.44.25|RA4=2.20.44.26|RA4=2.20.44.169|RA4=2.20.64.128|RA4=2.20.84.73|RA4=2.20.85.5|RA4=2.20.85.171|RA4=2.20.88.83|RA4=2.20.89.38|RA4=2.20.102.246|RA4=2.20.105.223|RA4=2.20.107.176|RA4=2.20.113.251|RA4=2.20.142.236|RA4=2.20.143.5|RA4=2.20.143.129|RA4=2.20.143.136|RA4=2.20.176.62|RA4=2.20.182.25|RA4=2.20.182.26|RA4=2.20.182.32|RA4=2.20.182.34|RA4=2.20.182.43|RA4=2.20.182.208|RA4=2.20.182.214|RA4=2.20.182.237|RA4=2.20.188.220|RA4=2.20.188.251|RA4=2.20.189.28|RA4=2.20.189.42|RA4=2.20.189.49|RA4=2.20.189.57|RA4=2.20.189.60|RA4=2.20.189.76|RA4=2.20.192.214|RA4=2.20.193.194|RA4=2.20.204.28|RA4=2.20.204.223|RA4=2.20.208.96|RA4=2.20.216.34|RA4=2.20.220.109|RA4=2.20.221.56|RA4=2.20.223.164|RA4=2.20.224.178|RA4=2.20.239.247|RA4=2.20.244.113|RA4=2.20.244.115|RA4=2.20.249.25|RA4=2.20.249.35|RA4=2.20.250.48|RA4=2.20.250.49|RA4=2.20.250.50|RA4=2.20.250.99|RA4=2.20.250.123|RA4=2.20.250.137|RA4=2.20.250.160|RA4=2.20.251.18|RA4=2.20.251.24|RA4=2.20.251.27|RA4=2.20.251.33|RA4=2.20.251.42|RA4=2.20.251.43|RA4=2.20.251.56|RA4=2.20.252.170|RA4=2.20.252.171|RA4=2.20.252.177|RA4=2.20.254.91|RA4=2.20.254.160|RA4=2.20.254.187|RA4=2.20.255.9|RA4=2.20.255.47|RA4=2.20.255.73|RA4=2.20.255.95|RA4=2.20.255.168|RA4=2.21.7.17|RA4=2.21.7.35|RA4=2.21.7.48|RA4=2.21.7.59|RA4=2.21.7.75|RA4=2.21.17.72|RA4=2.21.26.75|RA4=2.21.26.143|RA4=2.21.29.175|RA4=2.21.30.10|RA4=2.21.41.63|RA4=2.21.59.20|RA4=2.21.66.80|RA4=2.21.67.65|RA4=2.21.67.67|RA4=2.21.84.170|RA4=2.21.84.184|RA4=2.21.89.25|RA4=2.21.89.41|RA4=2.21.89.98|RA4=2.21.89.99|RA4=2.21.96.200|RA4=2.21.103.101|RA4=2.21.198.68|RA4=2.21.228.129|RA4=2.21.228.187|RA4=2.21.229.9|RA4=2.21.229.42|RA4=2.21.229.51|RA4=2.21.229.65|RA4=2.21.229.72|RA4=2.21.229.83|RA4=2.21.231.8|RA4=2.21.231.24|RA4=2.21.231.25|RA4=2.21.231.26|RA4=2.21.231.27|RA4=2.21.231.34|RA4=2.21.231.35|RA4=2.21.231.41|RA4=2.21.231.43|RA4=2.21.231.57|RA4=2.21.231.67|RA4=2.21.231.96|RA4=2.21.231.98|RA4=2.21.231.106|RA4=2.21.231.131|RA4=2.21.231.138|RA4=2.21.231.144|RA4=2.21.238.161|RA4=2.21.240.99|RA4=2.21.242.8|RA4=2.21.242.9|RA4=2.21.242.11|RA4=2.21.242.189|RA4=2.21.242.228|RA4=2.21.243.67|RA4=2.21.243.73|RA4=2.21.246.8|RA4=2.21.246.10|RA4=2.21.246.42|RA4=2.21.246.58|RA4=2.21.249.19|RA4=2.21.250.195|RA4=2.21.251.109|RA4=2.22.8.11|RA4=2.22.8.51|RA4=2.22.8.75|RA4=2.22.9.83|RA4=2.22.9.104|RA4=2.22.9.106|RA4=2.22.9.112|RA4=2.22.9.122|RA4=2.22.9.224|RA4=2.22.10.19|RA4=2.22.22.75|RA4=2.22.22.99|RA4=2.22.22.106|RA4=2.22.22.114|RA4=2.22.22.130|RA4=2.22.22.137|RA4=2.22.22.209|RA4=2.22.22.216|RA4=2.22.22.217|RA4=2.22.22.219|RA4=2.22.22.224|RA4=2.22.22.225|RA4=2.22.23.24|RA4=2.22.23.50|RA4=2.22.23.99|RA4=2.22.30.161|RA4=2.22.34.139|RA4=2.22.38.161|RA4=2.22.42.205|RA4=2.22.48.26|RA4=2.22.48.42|RA4=2.22.50.65|RA4=2.22.50.90|RA4=2.22.50.91|RA4=2.22.50.96|RA4=2.22.50.98|RA4=2.22.52.8|RA4=2.22.52.10|RA4=2.22.52.18|RA4=2.22.52.19|RA4=2.22.61.11|RA4=2.22.61.43|RA4=2.22.61.50|RA4=2.22.61.66|RA4=2.22.61.82|RA4=2.22.61.83|RA4=2.22.62.107|RA4=2.22.62.114|RA4=2.22.62.121|RA4=2.22.62.123|RA4=2.22.74.243|RA4=2.22.96.34|RA4=2.22.97.27|RA4=2.22.100.41|RA4=2.22.103.62|RA4=2.22.109.129|RA4=2.22.110.240|RA4=2.22.119.49|RA4=2.22.119.65|RA4=2.22.119.139|RA4=2.22.119.152|RA4=2.22.119.169|RA4=2.22.126.19|RA4=2.22.126.59|RA4=2.22.129.85|RA4=2.22.133.121|RA4=2.22.134.181|RA4=2.22.136.17|RA4=2.22.141.166|RA4=2.22.146.56|RA4=2.22.146.97|RA4=2.22.146.106|RA4=2.22.146.107|RA4=2.22.152.104|RA4=2.22.179.135|RA4=2.22.187.144|RA4=2.22.189.85|RA4=2.22.192.52|RA4=2.22.219.138|RA4=2.22.228.10|RA4=2.22.228.19|RA4=2.22.234.50|RA4=2.22.234.113|RA4=2.22.240.190|RA4=2.22.242.9|RA4=2.22.242.20|RA4=2.22.242.35|RA4=2.22.242.52|RA4=2.22.247.38|RA4=2.23.7.170|RA4=2.23.10.203|RA4=2.23.11.129|RA4=2.23.24.219|RA4=2.23.41.95|RA4=2.23.44.205|RA4=2.23.49.151|RA4=2.23.52.230|RA4=2.23.57.224|RA4=2.23.81.58|RA4=2.23.82.20|RA4=2.23.104.83|RA4=2.23.105.38|RA4=2.23.107.117|RA4=2.23.107.131|RA4=2.23.108.99|RA4=2.23.109.81|RA4=2.23.119.72|RA4=2.23.130.102|RA4=2.23.132.37|RA4=2.23.133.38|RA4=2.23.136.14|RA4=2.23.139.123|RA4=2.23.139.150|RA4=2.23.140.233|RA4=2.23.145.221|RA4=2.23.189.122|RA4=2.228.46.104|RA4=2.228.46.106|RA4=2.228.46.107|RA4=2.228.46.112|RA4=2.228.46.113|RA4=2.228.46.114|RA4=2.228.46.115|RA4=2.228.46.122|RA4=200.9.157.73|RA4=200.9.157.75|RA4=200.9.157.152|RA4=200.9.157.153|RA4=200.9.157.154|RA4=200.14.44.135|RA4=200.14.44.136|RA4=200.14.44.139|RA4=200.14.44.142|RA4=200.28.95.25|RA4=200.28.95.35|RA4=200.28.95.48|RA4=200.28.95.57|RA4=200.31.210.10|RA4=200.31.210.16|RA4=200.31.210.25|RA4=200.31.210.32|RA4=200.31.210.33|RA4=200.31.210.43|RA4=200.31.210.48|RA4=200.31.210.56|RA4=200.40.28.19|RA4=200.40.28.44|RA4=200.40.28.45|RA4=200.40.28.51|RA4=200.40.28.152|RA4=200.40.28.160|RA4=200.40.28.163|RA4=200.40.28.168|RA4=200.40.28.177|RA4=200.40.28.178|RA4=200.42.33.50|RA4=200.42.33.64|RA4=200.42.33.72|RA4=200.42.33.75|RA4=200.60.190.24|RA4=200.60.190.33|RA4=200.60.190.92|RA4=200.60.190.100|RA4=200.60.190.101|RA4=200.60.190.108|RA4=200.61.25.104|RA4=200.61.25.106|RA4=200.61.25.112|RA4=200.61.25.113|RA4=200.61.25.114|RA4=200.61.25.115|RA4=200.69.125.136|RA4=200.69.125.137|RA4=200.69.125.138|RA4=200.69.125.139|RA4=200.69.125.145|RA4=200.69.125.152|RA4=200.75.200.199|RA4=200.75.200.200|RA4=200.75.200.205|RA4=200.75.200.207|RA4=200.81.125.200|RA4=200.81.125.201|RA4=200.91.22.10|RA4=200.91.22.11|RA4=200.91.22.17|RA4=200.91.22.24|RA4=200.91.22.26|RA4=200.91.22.27|RA4=200.105.130.12|RA4=200.105.130.13|RA4=200.105.130.14|RA4=200.110.126.9|RA4=200.110.126.10|RA4=200.110.126.11|RA4=200.110.126.17|RA4=200.110.126.33|RA4=200.110.126.34|RA4=200.110.216.121|RA4=200.110.216.122|RA4=200.114.43.65|RA4=200.114.43.74|RA4=200.115.194.105|RA4=200.115.194.113|RA4=200.123.194.16|RA4=200.123.194.19|RA4=200.123.194.32|RA4=200.123.194.35|RA4=200.123.194.40|RA4=200.123.194.56|RA4=200.123.194.146|RA4=200.123.194.147|RA4=200.123.194.152|RA4=200.123.194.178|RA4=200.123.194.187|RA4=200.123.194.192|RA4=200.123.194.193|RA4=200.123.195.17|RA4=200.123.195.18|RA4=200.123.195.27|RA4=200.123.195.34|RA4=200.123.195.155|RA4=200.123.195.170|RA4=200.123.195.176|RA4=200.123.195.177|RA4=200.123.197.145|RA4=200.123.197.161|RA4=200.123.197.163|RA4=200.123.197.171|RA4=200.123.197.177|RA4=200.123.198.136|RA4=200.123.198.147|RA4=200.123.198.153|RA4=200.123.198.155|RA4=200.123.201.137|RA4=200.123.201.138|RA4=200.123.201.139|RA4=200.123.201.185|RA4=200.123.201.186|RA4=200.123.201.192|RA4=200.123.201.195|RA4=200.123.201.210|RA4=200.142.191.70|RA4=200.142.191.71|RA4=200.142.191.72|RA4=200.149.150.200|RA4=200.149.150.208|RA4=200.149.150.209|RA4=200.149.150.210|RA4=200.149.150.225|RA4=200.152.250.201|RA4=200.152.250.202|RA4=200.152.250.203|RA4=200.152.250.209|RA4=200.152.250.210|RA4=200.157.208.234|RA4=200.157.208.235|RA4=200.157.208.240|RA4=200.157.208.241|RA4=200.157.208.242|RA4=200.174.107.9|RA4=200.174.107.11|RA4=200.174.107.16|RA4=200.174.107.17|RA4=200.174.107.18|RA4=200.174.107.19|RA4=200.174.107.26|RA4=200.174.107.34|RA4=200.174.148.17|RA4=200.174.148.18|RA4=200.174.148.33|RA4=200.174.148.40|RA4=200.174.148.41|RA4=200.182.35.137|RA4=200.182.35.163|RA4=200.188.128.136|RA4=200.188.128.137|RA4=200.188.128.138|RA4=200.188.128.139|RA4=200.188.128.144|RA4=200.195.140.8|RA4=200.195.140.9|RA4=200.195.140.10|RA4=200.195.140.18|RA4=200.216.8.67|RA4=200.216.8.73|RA4=200.216.8.75|RA4=200.216.8.82|RA4=200.216.8.89|RA4=201.16.134.42|RA4=201.16.134.48|RA4=201.16.134.56|RA4=201.16.134.57|RA4=201.16.134.58|RA4=201.16.134.137|RA4=201.16.134.139|RA4=201.16.134.147|RA4=201.16.134.152|RA4=201.16.134.153|RA4=201.16.134.154|RA4=201.144.215.17|RA4=201.144.215.35|RA4=201.148.67.9|RA4=201.148.67.17|RA4=201.148.67.34|RA4=201.148.67.56|RA4=201.148.67.57|RA4=201.159.158.155|RA4=201.159.158.160|RA4=201.159.158.161|RA4=201.159.158.162|RA4=201.159.158.168|RA4=201.159.158.169|RA4=201.163.0.136|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-10|""
""{EF48DAE3-F103-4B82-BAAD-FA96DCC53479}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=201.6.5.23|RA4=201.6.5.31|RA4=201.6.5.32|RA4=201.6.5.40|RA4=201.6.5.50|RA4=201.6.5.56|RA4=201.6.5.65|RA4=201.6.5.80|RA4=201.49.97.200|RA4=201.49.97.201|RA4=201.49.97.202|RA4=201.54.66.8|RA4=201.54.66.9|RA4=201.54.66.10|RA4=201.54.66.11|RA4=201.163.0.138|RA4=202.7.177.27|RA4=202.7.177.41|RA4=202.7.187.8|RA4=202.7.187.16|RA4=202.7.187.35|RA4=202.7.187.41|RA4=202.7.187.50|RA4=202.43.51.11|RA4=202.43.58.50|RA4=202.43.60.133|RA4=202.43.187.136|RA4=202.43.187.144|RA4=202.43.187.146|RA4=202.43.187.152|RA4=202.43.187.153|RA4=202.43.190.232|RA4=202.43.190.240|RA4=202.76.239.8|RA4=202.76.239.9|RA4=202.76.239.10|RA4=202.76.239.11|RA4=202.76.239.17|RA4=202.76.239.18|RA4=202.78.83.24|RA4=202.78.83.33|RA4=202.79.210.117|RA4=202.79.210.118|RA4=202.79.210.121|RA4=202.83.21.233|RA4=202.83.22.201|RA4=202.83.22.202|RA4=202.83.22.203|RA4=202.83.22.209|RA4=202.83.22.210|RA4=202.83.22.216|RA4=202.89.233.101|RA4=202.94.142.72|RA4=202.94.142.73|RA4=202.94.142.74|RA4=202.94.142.82|RA4=202.124.116.9|RA4=202.124.116.10|RA4=202.124.116.11|RA4=202.124.116.17|RA4=202.124.127.104|RA4=202.124.127.106|RA4=202.124.127.111|RA4=202.124.127.112|RA4=202.126.168.189|RA4=202.126.168.253|RA4=202.152.1.200|RA4=202.152.192.200|RA4=202.152.192.201|RA4=202.152.192.203|RA4=202.152.192.208|RA4=202.158.0.105|RA4=202.167.242.166|RA4=202.175.5.97|RA4=202.175.5.178|RA4=202.177.203.124|RA4=202.177.203.125|RA4=202.183.253.16|RA4=202.183.253.17|RA4=202.183.253.19|RA4=202.183.253.25|RA4=202.208.170.40|RA4=202.208.170.41|RA4=202.208.170.42|RA4=202.208.170.43|RA4=202.229.2.81|RA4=202.229.2.91|RA4=202.229.2.96|RA4=202.229.2.113|RA4=202.229.2.115|RA4=202.229.2.128|RA4=202.229.2.130|RA4=202.229.2.139|RA4=203.5.76.9|RA4=203.5.76.11|RA4=203.5.76.16|RA4=203.5.76.17|RA4=203.26.28.137|RA4=203.26.28.138|RA4=203.26.28.152|RA4=203.26.28.160|RA4=203.29.143.34|RA4=203.29.143.40|RA4=203.29.143.43|RA4=203.29.143.51|RA4=203.29.143.96|RA4=203.29.143.98|RA4=203.29.143.105|RA4=203.29.143.106|RA4=203.29.143.120|RA4=203.29.143.121|RA4=203.29.143.122|RA4=203.69.81.9|RA4=203.69.81.11|RA4=203.69.81.18|RA4=203.69.81.19|RA4=203.69.81.24|RA4=203.69.81.25|RA4=203.69.81.26|RA4=203.69.81.43|RA4=203.69.81.49|RA4=203.69.81.58|RA4=203.69.81.90|RA4=203.69.81.106|RA4=203.69.138.18|RA4=203.69.138.25|RA4=203.69.138.76|RA4=203.69.138.83|RA4=203.69.138.92|RA4=203.69.138.139|RA4=203.69.138.149|RA4=203.69.138.156|RA4=203.69.138.157|RA4=203.69.138.166|RA4=203.69.138.172|RA4=203.69.138.173|RA4=203.69.141.40|RA4=203.69.141.41|RA4=203.69.141.48|RA4=203.69.141.58|RA4=203.69.141.72|RA4=203.80.97.9|RA4=203.80.97.11|RA4=203.80.97.16|RA4=203.80.97.17|RA4=203.80.97.18|RA4=203.80.97.26|RA4=203.80.97.27|RA4=203.80.97.41|RA4=203.80.97.42|RA4=203.80.97.91|RA4=203.80.97.97|RA4=203.80.97.121|RA4=203.80.97.123|RA4=203.92.67.200|RA4=203.92.67.201|RA4=203.92.67.202|RA4=203.94.209.11|RA4=203.94.209.24|RA4=203.94.209.26|RA4=203.94.209.33|RA4=203.94.209.34|RA4=203.94.209.43|RA4=203.106.50.11|RA4=203.106.50.17|RA4=203.106.50.24|RA4=203.106.50.27|RA4=203.106.85.43|RA4=203.106.85.50|RA4=203.106.85.56|RA4=203.109.179.24|RA4=203.109.179.25|RA4=203.109.179.32|RA4=203.109.179.138|RA4=203.109.179.145|RA4=203.109.255.8|RA4=203.109.255.16|RA4=203.109.255.34|RA4=203.113.63.90|RA4=203.113.63.96|RA4=203.113.63.98|RA4=203.113.63.104|RA4=203.113.63.105|RA4=203.117.152.136|RA4=203.117.152.139|RA4=203.117.152.177|RA4=203.117.152.179|RA4=203.117.152.193|RA4=203.117.152.194|RA4=203.117.152.195|RA4=203.117.152.202|RA4=203.117.152.203|RA4=203.133.9.41|RA4=203.133.9.42|RA4=203.133.9.43|RA4=203.133.9.96|RA4=203.133.9.105|RA4=203.144.145.19|RA4=203.144.145.33|RA4=203.151.116.10|RA4=203.153.50.210|RA4=203.153.50.217|RA4=203.153.50.235|RA4=203.153.50.248|RA4=203.165.6.8|RA4=203.165.6.9|RA4=203.165.6.11|RA4=203.165.6.16|RA4=203.165.6.32|RA4=203.165.6.34|RA4=203.165.11.201|RA4=203.165.11.203|RA4=203.165.11.210|RA4=203.165.11.211|RA4=203.165.11.217|RA4=203.172.118.137|RA4=203.172.118.145|RA4=203.179.83.10|RA4=203.179.83.18|RA4=203.179.83.19|RA4=203.179.83.20|RA4=203.179.83.21|RA4=203.186.47.176|RA4=203.186.47.187|RA4=203.186.47.208|RA4=203.186.47.222|RA4=203.186.47.230|RA4=203.186.47.231|RA4=203.186.47.240|RA4=203.198.20.9|RA4=203.198.20.33|RA4=203.198.20.50|RA4=203.198.20.56|RA4=203.198.20.73|RA4=203.198.20.89|RA4=203.198.20.106|RA4=203.198.20.113|RA4=203.208.40.59|RA4=203.208.40.60|RA4=203.208.40.155|RA4=203.208.40.156|RA4=203.208.41.155|RA4=203.208.41.156|RA4=203.208.43.91|RA4=203.208.43.92|RA4=203.208.43.123|RA4=203.208.43.124|RA4=203.208.48.91|RA4=203.208.48.92|RA4=203.208.48.155|RA4=203.208.48.156|RA4=203.208.49.187|RA4=203.208.49.188|RA4=203.208.50.155|RA4=203.208.50.156|RA4=203.208.51.59|RA4=203.208.51.60|RA4=203.208.52.155|RA4=203.208.52.156|RA4=203.211.2.35|RA4=203.211.2.41|RA4=203.211.2.56|RA4=203.211.2.83|RA4=203.211.2.98|RA4=203.211.2.99|RA4=203.211.4.17|RA4=203.211.4.24|RA4=203.211.4.26|RA4=203.211.153.9|RA4=203.211.153.17|RA4=203.211.153.24|RA4=203.211.153.27|RA4=203.213.33.42|RA4=203.213.33.56|RA4=203.213.73.16|RA4=203.213.73.24|RA4=203.213.73.114|RA4=203.213.73.120|RA4=204.0.3.91|RA4=204.0.3.153|RA4=204.0.5.16|RA4=204.0.5.27|RA4=204.0.5.43|RA4=204.0.5.49|RA4=204.0.5.50|RA4=204.0.5.51|RA4=204.0.5.59|RA4=204.0.55.138|RA4=204.0.55.147|RA4=204.2.132.41|RA4=204.2.132.51|RA4=204.2.148.138|RA4=204.2.148.147|RA4=204.2.171.74|RA4=204.2.171.82|RA4=204.2.171.97|RA4=204.2.171.106|RA4=204.2.178.235|RA4=204.2.178.248|RA4=204.2.193.145|RA4=204.2.193.146|RA4=204.2.193.153|RA4=204.2.193.187|RA4=204.2.215.8|RA4=204.2.215.10|RA4=204.13.192.177|RA4=204.13.192.211|RA4=204.13.193.176|RA4=204.17.140.9|RA4=204.17.140.17|RA4=204.17.140.27|RA4=204.17.140.33|RA4=204.79.197.1|RA4=204.79.197.200|RA4=204.79.197.203|RA4=204.79.197.222|RA4=204.93.43.27|RA4=204.93.43.35|RA4=204.93.43.40|RA4=204.93.43.50|RA4=204.93.63.59|RA4=204.93.63.64|RA4=204.102.114.40|RA4=204.102.114.42|RA4=204.102.114.50|RA4=204.160.96.125|RA4=204.160.100.253|RA4=204.160.105.254|RA4=204.160.107.126|RA4=204.160.109.254|RA4=204.160.111.253|RA4=204.160.119.126|RA4=204.160.119.254|RA4=204.160.123.126|RA4=204.160.123.254|RA4=204.160.124.125|RA4=204.160.125.254|RA4=204.160.126.126|RA4=204.160.126.253|RA4=204.186.16.168|RA4=204.186.16.169|RA4=204.186.34.139|RA4=204.186.34.145|RA4=204.186.34.146|RA4=204.186.34.168|RA4=204.245.190.10|RA4=204.245.190.11|RA4=204.245.190.33|RA4=204.245.190.50|RA4=205.128.64.125|RA4=205.128.66.126|RA4=205.128.67.126|RA4=205.128.71.253|RA4=205.128.73.126|RA4=205.128.73.252|RA4=205.128.74.252|RA4=205.128.75.252|RA4=205.128.79.254|RA4=205.128.82.126|RA4=205.128.83.126|RA4=205.128.83.254|RA4=205.128.88.125|RA4=205.128.90.126|RA4=205.128.91.126|RA4=205.177.240.11|RA4=205.177.240.25|RA4=205.177.240.34|RA4=205.177.240.35|RA4=205.213.110.136|RA4=205.213.110.137|RA4=205.213.110.138|RA4=205.213.110.139|RA4=205.213.114.136|RA4=205.213.114.146|RA4=205.213.114.155|RA4=205.213.114.168|RA4=205.213.114.176|RA4=205.213.114.178|RA4=205.237.69.81|RA4=205.237.69.82|RA4=205.237.69.83|RA4=205.237.69.88|RA4=205.237.69.90|RA4=206.33.32.126|RA4=206.33.34.125|RA4=206.33.35.125|RA4=206.33.36.126|RA4=206.33.36.253|RA4=206.33.40.253|RA4=206.33.41.253|RA4=206.33.42.126|RA4=206.33.44.126|RA4=206.33.44.254|RA4=206.33.47.253|RA4=206.33.50.126|RA4=206.33.50.253|RA4=206.33.51.125|RA4=206.33.52.253|RA4=206.33.55.254|RA4=206.33.56.126|RA4=206.33.58.254|RA4=206.40.110.246|RA4=206.40.110.247|RA4=206.40.110.248|RA4=206.53.239.22|RA4=206.53.239.23|RA4=206.53.239.24|RA4=206.74.87.19|RA4=206.167.78.14|RA4=206.167.78.16|RA4=206.167.78.22|RA4=206.167.78.25|RA4=206.190.79.200|RA4=206.190.79.202|RA4=206.190.79.203|RA4=206.190.79.208|RA4=206.190.79.211|RA4=206.248.168.137|RA4=206.248.168.139|RA4=206.248.168.145|RA4=206.248.168.152|RA4=206.248.168.162|RA4=206.248.168.168|RA4=206.248.168.170|RA4=206.248.168.171|RA4=206.248.168.176|RA4=206.248.168.177|RA4=206.248.168.178|RA4=206.248.168.184|RA4=206.248.168.185|RA4=207.34.231.8|RA4=207.34.231.32|RA4=207.34.231.42|RA4=207.34.231.57|RA4=207.34.231.58|RA4=207.46.7.252|RA4=207.46.11.151|RA4=207.46.11.152|RA4=207.46.101.8|RA4=207.46.101.12|RA4=207.46.101.29|RA4=207.46.114.61|RA4=207.46.194.8|RA4=207.46.194.10|RA4=207.46.194.14|RA4=207.46.194.25|RA4=207.46.223.94|RA4=207.63.109.137|RA4=207.63.109.138|RA4=207.63.109.144|RA4=207.63.109.145|RA4=207.63.109.147|RA4=207.63.109.160|RA4=207.68.166.254|RA4=207.109.73.19|RA4=207.109.73.48|RA4=207.109.111.32|RA4=207.109.111.40|RA4=207.109.111.59|RA4=207.109.111.64|RA4=207.123.33.126|RA4=207.123.34.126|RA4=207.123.38.253|RA4=207.123.39.126|RA4=207.123.39.254|RA4=207.123.46.126|RA4=207.123.46.253|RA4=207.123.48.126|RA4=207.123.48.254|RA4=207.123.52.125|RA4=207.123.53.253|RA4=207.123.54.253|RA4=207.123.55.252|RA4=207.123.56.126|RA4=207.123.56.252|RA4=207.123.59.254|RA4=207.123.60.254|RA4=207.166.120.10|RA4=207.166.120.18|RA4=207.228.83.27|RA4=207.228.83.40|RA4=207.228.83.49|RA4=207.228.83.50|RA4=207.228.83.56|RA4=207.228.83.59|RA4=208.31.254.8|RA4=208.31.254.33|RA4=208.31.254.43|RA4=208.46.17.25|RA4=208.110.149.54|RA4=208.110.149.55|RA4=208.110.149.56|RA4=208.178.29.254|RA4=208.178.167.254|RA4=208.185.115.40|RA4=208.185.115.66|RA4=208.185.115.90|RA4=208.185.115.96|RA4=208.185.115.122|RA4=208.185.115.129|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-11|""
""{169DFB10-38CB-4F5A-87A4-25594688C318}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=208.46.17.35|RA4=208.46.17.41|RA4=208.46.17.42|RA4=208.46.17.49|RA4=208.46.17.66|RA4=208.76.45.53|RA4=208.84.0.53|RA4=208.84.2.53|RA4=208.98.171.102|RA4=208.98.171.105|RA4=208.98.171.110|RA4=209.84.0.254|RA4=209.84.3.254|RA4=209.84.10.126|RA4=209.84.17.254|RA4=209.84.20.126|RA4=209.84.23.126|RA4=209.84.26.253|RA4=209.84.29.126|RA4=209.84.29.253|RA4=209.84.31.126|RA4=209.85.145.148|RA4=209.85.145.149|RA4=209.85.147.148|RA4=209.85.147.149|RA4=209.85.201.148|RA4=209.85.201.149|RA4=209.85.203.148|RA4=209.85.203.149|RA4=209.85.232.148|RA4=209.85.232.149|RA4=209.85.234.148|RA4=209.85.234.149|RA4=209.91.216.42|RA4=209.91.216.43|RA4=209.91.216.48|RA4=209.95.152.83|RA4=209.95.152.104|RA4=209.95.152.112|RA4=209.107.203.57|RA4=209.107.203.65|RA4=209.107.203.66|RA4=209.107.203.74|RA4=209.107.203.82|RA4=209.107.203.90|RA4=209.107.217.128|RA4=209.107.217.137|RA4=209.124.184.135|RA4=209.124.184.136|RA4=209.124.184.137|RA4=209.124.184.143|RA4=209.124.184.152|RA4=209.124.184.153|RA4=209.133.80.91|RA4=209.133.80.105|RA4=209.166.161.41|RA4=209.166.161.42|RA4=209.166.161.43|RA4=209.166.161.48|RA4=209.170.79.18|RA4=209.170.79.33|RA4=209.170.79.65|RA4=209.191.222.247|RA4=209.191.222.248|RA4=210.0.146.17|RA4=210.0.146.32|RA4=210.0.146.154|RA4=210.0.146.155|RA4=210.0.146.160|RA4=210.0.146.161|RA4=210.0.146.193|RA4=210.0.146.200|RA4=210.7.43.73|RA4=210.7.43.74|RA4=210.7.43.75|RA4=210.7.43.81|RA4=210.23.4.200|RA4=210.23.4.201|RA4=210.23.4.202|RA4=210.48.65.200|RA4=210.48.65.201|RA4=210.48.65.202|RA4=210.55.204.217|RA4=210.55.204.219|RA4=210.55.204.236|RA4=210.55.204.237|RA4=210.55.204.239|RA4=210.61.248.25|RA4=210.61.248.42|RA4=210.61.248.89|RA4=210.61.248.98|RA4=210.61.248.104|RA4=210.61.248.106|RA4=210.61.248.114|RA4=210.61.248.129|RA4=210.61.248.131|RA4=210.61.248.137|RA4=210.61.248.152|RA4=210.61.248.176|RA4=210.61.248.186|RA4=210.61.248.203|RA4=210.61.248.210|RA4=210.61.248.219|RA4=210.61.248.224|RA4=210.61.248.232|RA4=210.61.248.233|RA4=210.61.248.235|RA4=210.61.248.240|RA4=210.61.248.241|RA4=210.86.141.32|RA4=210.86.141.42|RA4=210.86.141.75|RA4=210.86.141.107|RA4=210.143.147.136|RA4=210.143.147.137|RA4=210.143.147.139|RA4=210.143.147.147|RA4=210.143.147.155|RA4=210.143.147.163|RA4=210.149.5.8|RA4=210.149.5.10|RA4=210.149.5.25|RA4=210.149.5.26|RA4=210.149.5.35|RA4=210.149.5.40|RA4=210.149.135.23|RA4=210.149.135.29|RA4=210.149.135.30|RA4=210.149.135.53|RA4=210.149.135.92|RA4=210.149.135.94|RA4=210.155.101.137|RA4=210.155.101.139|RA4=210.155.101.158|RA4=210.155.101.198|RA4=210.155.101.205|RA4=210.157.235.10|RA4=210.157.235.17|RA4=210.158.145.19|RA4=210.158.145.27|RA4=210.158.145.33|RA4=210.158.145.35|RA4=210.158.145.40|RA4=210.158.145.42|RA4=210.166.56.16|RA4=210.166.56.17|RA4=210.166.56.19|RA4=210.166.56.25|RA4=210.166.56.27|RA4=210.166.56.32|RA4=210.166.56.34|RA4=210.201.31.104|RA4=210.201.31.112|RA4=210.201.31.114|RA4=210.239.30.200|RA4=210.239.30.201|RA4=210.239.30.202|RA4=210.239.30.203|RA4=210.252.57.233|RA4=210.252.57.234|RA4=210.252.57.235|RA4=210.252.57.241|RA4=210.252.57.242|RA4=210.252.57.248|RA4=211.9.96.138|RA4=211.9.96.144|RA4=211.9.96.145|RA4=211.9.96.161|RA4=211.125.114.152|RA4=211.125.114.153|RA4=211.125.114.155|RA4=211.131.224.8|RA4=211.131.224.10|RA4=211.131.224.18|RA4=211.131.224.24|RA4=211.131.224.27|RA4=211.131.224.32|RA4=211.131.224.34|RA4=211.131.226.17|RA4=211.131.226.40|RA4=211.131.226.55|RA4=211.131.226.57|RA4=211.137.56.69|RA4=211.137.56.71|RA4=211.137.56.72|RA4=211.137.56.73|RA4=211.137.56.75|RA4=211.137.56.76|RA4=211.137.56.77|RA4=211.137.56.78|RA4=211.137.57.65|RA4=211.137.57.66|RA4=211.137.57.99|RA4=211.239.236.8|RA4=211.239.236.10|RA4=211.239.236.11|RA4=211.239.236.18|RA4=212.24.165.147|RA4=212.24.165.152|RA4=212.24.165.153|RA4=212.24.165.160|RA4=212.24.165.163|RA4=212.25.69.153|RA4=212.25.69.154|RA4=212.30.4.137|RA4=212.30.4.139|RA4=212.30.4.145|RA4=212.30.4.147|RA4=212.30.4.155|RA4=212.30.134.161|RA4=212.30.134.176|RA4=212.30.134.177|RA4=212.30.134.183|RA4=212.30.134.188|RA4=212.30.134.204|RA4=212.30.134.205|RA4=212.36.206.72|RA4=212.36.206.73|RA4=212.36.206.75|RA4=212.36.206.80|RA4=212.56.132.72|RA4=212.56.132.74|RA4=212.56.132.80|RA4=212.56.132.82|RA4=212.56.132.83|RA4=212.60.53.8|RA4=212.60.53.9|RA4=212.60.53.10|RA4=212.60.53.16|RA4=212.60.53.18|RA4=212.60.53.24|RA4=212.95.165.10|RA4=212.95.165.18|RA4=212.95.165.19|RA4=212.95.165.25|RA4=212.106.208.42|RA4=212.106.208.48|RA4=212.106.219.130|RA4=212.106.219.161|RA4=212.106.219.168|RA4=212.106.219.193|RA4=212.113.165.8|RA4=212.113.165.10|RA4=212.113.165.17|RA4=212.113.165.84|RA4=212.113.165.85|RA4=212.113.184.32|RA4=212.113.184.42|RA4=212.118.14.38|RA4=212.118.14.39|RA4=212.118.14.40|RA4=212.118.14.45|RA4=212.147.10.197|RA4=212.147.10.198|RA4=212.147.10.199|RA4=212.188.32.57|RA4=212.188.32.59|RA4=212.188.32.66|RA4=212.188.32.68|RA4=212.188.32.161|RA4=212.188.32.163|RA4=212.188.32.168|RA4=212.188.32.169|RA4=212.188.32.170|RA4=212.188.75.126|RA4=212.191.241.9|RA4=212.191.241.11|RA4=212.191.241.18|RA4=212.191.241.24|RA4=212.191.241.25|RA4=212.191.241.26|RA4=212.199.202.11|RA4=212.199.202.18|RA4=212.199.202.26|RA4=212.199.202.27|RA4=212.199.202.34|RA4=212.199.202.50|RA4=212.199.202.66|RA4=212.199.202.67|RA4=212.199.202.68|RA4=212.201.100.151|RA4=212.201.100.157|RA4=212.201.100.168|RA4=212.201.100.176|RA4=212.201.100.178|RA4=212.201.100.184|RA4=212.201.100.185|RA4=212.201.100.187|RA4=212.205.126.9|RA4=212.205.126.11|RA4=212.205.126.16|RA4=212.205.126.17|RA4=212.205.126.18|RA4=212.205.126.19|RA4=212.205.126.24|RA4=212.230.26.112|RA4=212.230.26.115|RA4=212.245.45.9|RA4=212.245.45.10|RA4=212.245.45.16|RA4=212.245.45.40|RA4=212.245.45.42|RA4=212.245.45.48|RA4=212.245.45.49|RA4=212.247.14.9|RA4=212.247.14.18|RA4=212.247.14.19|RA4=212.247.20.9|RA4=212.247.20.17|RA4=212.247.20.32|RA4=212.247.20.43|RA4=212.251.12.137|RA4=212.251.12.138|RA4=212.251.12.178|RA4=212.252.126.24|RA4=212.252.126.33|RA4=212.252.126.50|RA4=212.252.126.59|RA4=212.252.126.80|RA4=212.252.126.82|RA4=213.94.75.137|RA4=213.94.75.144|RA4=213.104.143.178|RA4=213.104.143.186|RA4=213.104.143.211|RA4=213.104.143.217|RA4=213.120.161.144|RA4=213.120.161.146|RA4=213.120.161.163|RA4=213.120.161.169|RA4=213.120.161.211|RA4=213.120.161.242|RA4=213.120.161.250|RA4=213.120.162.185|RA4=213.120.162.187|RA4=213.120.163.208|RA4=213.120.163.214|RA4=213.120.163.215|RA4=213.123.84.81|RA4=213.123.84.88|RA4=213.123.84.90|RA4=213.123.84.97|RA4=213.123.85.11|RA4=213.123.85.83|RA4=213.123.85.106|RA4=213.132.237.105|RA4=213.132.237.106|RA4=213.132.237.112|RA4=213.132.237.120|RA4=213.133.184.105|RA4=213.133.184.107|RA4=213.133.184.113|RA4=213.133.184.114|RA4=213.133.184.115|RA4=213.144.137.136|RA4=213.144.137.137|RA4=213.144.137.138|RA4=213.147.96.184|RA4=213.147.96.185|RA4=213.152.6.89|RA4=213.152.6.91|RA4=213.152.6.96|RA4=213.152.6.97|RA4=213.155.152.154|RA4=213.155.152.160|RA4=213.155.152.163|RA4=213.155.152.170|RA4=213.155.152.233|RA4=213.155.158.19|RA4=213.158.112.136|RA4=213.158.112.137|RA4=213.158.112.138|RA4=213.162.21.134|RA4=213.162.21.135|RA4=213.162.21.136|RA4=213.191.147.214|RA4=213.191.147.215|RA4=213.191.147.216|RA4=213.197.182.250|RA4=213.198.96.75|RA4=213.198.96.82|RA4=213.198.96.90|RA4=213.198.96.91|RA4=213.198.96.185|RA4=213.198.96.201|RA4=213.248.113.18|RA4=213.248.113.67|RA4=213.249.233.200|RA4=213.249.233.224|RA4=213.249.233.225|RA4=213.249.233.227|RA4=213.253.9.9|RA4=213.253.9.11|RA4=213.253.9.33|RA4=213.253.9.34|RA4=213.253.9.48|RA4=213.254.15.231|RA4=213.254.15.239|RA4=213.254.15.240|RA4=213.254.15.246|RA4=213.254.15.248|RA4=213.254.17.32|RA4=213.254.17.56|RA4=213.254.17.57|RA4=213.254.17.64|RA4=213.254.17.73|RA4=213.254.17.158|RA4=213.254.17.168|RA4=213.254.17.169|RA4=213.254.17.198|RA4=213.254.17.200|RA4=213.254.17.224|RA4=213.254.248.161|RA4=213.254.248.170|RA4=213.254.248.177|RA4=213.254.248.187|RA4=216.3.50.40|RA4=216.3.50.73|RA4=216.23.154.72|RA4=216.23.154.73|RA4=216.23.154.81|RA4=216.23.154.82|RA4=216.23.154.83|RA4=216.23.154.88|RA4=216.38.160.128|RA4=216.38.162.128|RA4=216.38.163.128|RA4=216.38.164.128|RA4=216.38.170.128|RA4=216.38.172.128|RA4=216.58.192.6|RA4=216.58.192.38|RA4=216.58.192.70|RA4=216.58.192.102|RA4=216.58.192.134|RA4=216.58.192.166|RA4=216.58.192.198|RA4=216.58.192.230|RA4=216.58.193.70|RA4=216.58.193.102|RA4=216.58.193.134|RA4=216.58.193.166|RA4=216.58.194.38|RA4=216.58.194.70|RA4=216.58.194.102|RA4=216.58.194.134|RA4=216.58.194.166|RA4=216.58.195.38|RA4=216.58.195.70|RA4=216.58.195.134|RA4=216.58.196.102|RA4=216.58.196.134|RA4=216.58.196.166|RA4=216.58.196.198|RA4=216.58.196.230|RA4=216.147.185.8|RA4=216.147.185.10|RA4=216.147.185.11|RA4=216.147.185.16|RA4=216.156.199.19|RA4=216.156.199.25|RA4=216.156.225.83|RA4=216.156.225.107|RA4=216.156.225.167|RA4=216.156.225.174|RA4=216.165.156.8|RA4=216.165.156.16|RA4=216.165.156.18|RA4=216.165.156.19|RA4=216.165.156.24|RA4=216.165.156.26|RA4=216.191.211.200|RA4=216.191.211.201|RA4=216.191.211.203|RA4=216.191.211.208|RA4=216.191.211.210|RA4=216.206.30.9|RA4=216.206.30.11|RA4=216.206.30.17|RA4=216.206.30.19|RA4=216.206.30.24|RA4=216.206.30.59|RA4=216.206.30.80|RA4=216.206.30.83|RA4=216.206.30.97|RA4=216.234.192.230|RA4=216.234.192.231|RA4=216.241.39.168|RA4=216.241.39.169|RA4=216.241.39.170|RA4=216.243.197.245|RA4=216.243.197.246|RA4=216.243.197.247|RA4=216.246.75.154|RA4=216.246.75.155|RA4=216.246.75.160|RA4=216.254.134.6|RA4=216.254.134.7|RA4=216.254.134.8|RA4=216.254.134.9|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-12|""
""{3BF5FF1E-1961-4329-98D8-2211B1CAEDDE}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=23.0.0.96|RA4=23.0.12.235|RA4=23.0.20.210|RA4=23.0.21.72|RA4=23.0.22.33|RA4=23.0.26.90|RA4=23.0.89.63|RA4=23.0.98.67|RA4=23.0.102.101|RA4=23.0.102.221|RA4=23.0.160.8|RA4=23.0.160.18|RA4=23.0.160.33|RA4=23.0.160.59|RA4=23.0.160.72|RA4=23.0.160.73|RA4=23.0.160.90|RA4=23.0.160.91|RA4=23.0.160.98|RA4=23.0.160.99|RA4=23.0.162.30|RA4=23.0.162.31|RA4=23.0.169.245|RA4=23.0.170.161|RA4=23.0.174.26|RA4=23.0.174.34|RA4=23.0.178.100|RA4=23.0.198.161|RA4=23.0.202.161|RA4=23.0.202.180|RA4=23.0.216.140|RA4=23.0.224.17|RA4=23.0.246.66|RA4=23.0.250.76|RA4=23.0.253.48|RA4=23.1.8.226|RA4=23.1.18.161|RA4=23.1.22.39|RA4=23.1.22.203|RA4=23.1.67.136|RA4=23.1.69.48|RA4=23.1.69.205|RA4=23.1.71.188|RA4=23.1.77.241|RA4=23.1.80.94|RA4=23.1.81.60|RA4=23.1.84.215|RA4=23.1.117.207|RA4=23.1.118.238|RA4=23.1.122.73|RA4=23.1.128.51|RA4=23.1.137.189|RA4=23.1.187.45|RA4=23.1.240.114|RA4=23.1.240.122|RA4=23.1.240.128|RA4=23.1.240.130|RA4=23.1.240.136|RA4=23.1.240.139|RA4=23.1.253.122|RA4=23.10.2.176|RA4=23.10.32.7|RA4=23.10.56.215|RA4=23.10.88.12|RA4=23.10.120.12|RA4=23.10.138.58|RA4=23.10.162.48|RA4=23.10.165.135|RA4=23.10.165.211|RA4=23.10.178.133|RA4=23.10.233.55|RA4=23.10.240.139|RA4=23.10.240.144|RA4=23.10.240.178|RA4=23.10.240.211|RA4=23.10.245.54|RA4=23.10.245.219|RA4=23.10.246.113|RA4=23.10.249.17|RA4=23.10.249.43|RA4=23.10.249.48|RA4=23.10.249.50|RA4=23.11.28.177|RA4=23.11.31.158|RA4=23.11.51.222|RA4=23.11.59.83|RA4=23.11.67.89|RA4=23.11.91.83|RA4=23.11.121.63|RA4=23.11.135.199|RA4=23.11.139.209|RA4=23.11.153.230|RA4=23.11.156.198|RA4=23.11.157.177|RA4=23.11.200.9|RA4=23.11.200.16|RA4=23.11.200.24|RA4=23.11.200.33|RA4=23.11.203.21|RA4=23.11.227.250|RA4=23.12.22.238|RA4=23.12.33.9|RA4=23.12.33.10|RA4=23.12.33.11|RA4=23.12.41.8|RA4=23.12.41.9|RA4=23.12.41.10|RA4=23.12.41.11|RA4=23.12.41.16|RA4=23.12.42.17|RA4=23.12.45.201|RA4=23.12.47.34|RA4=23.12.50.88|RA4=23.12.62.10|RA4=23.12.70.249|RA4=23.12.72.158|RA4=23.12.76.134|RA4=23.12.82.152|RA4=23.12.87.79|RA4=23.12.93.96|RA4=23.12.109.157|RA4=23.12.113.55|RA4=23.12.128.205|RA4=23.12.150.39|RA4=23.12.154.161|RA4=23.12.158.252|RA4=23.12.160.180|RA4=23.12.161.117|RA4=23.12.167.35|RA4=23.12.173.103|RA4=23.12.174.219|RA4=23.12.185.104|RA4=23.12.188.216|RA4=23.12.189.196|RA4=23.12.209.236|RA4=23.12.220.86|RA4=23.12.221.56|RA4=23.12.224.158|RA4=23.12.232.140|RA4=23.12.233.39|RA4=23.12.236.239|RA4=23.12.240.50|RA4=23.12.253.31|RA4=23.13.38.238|RA4=23.13.42.73|RA4=23.13.43.190|RA4=23.13.78.27|RA4=23.13.100.157|RA4=23.13.104.104|RA4=23.13.115.211|RA4=23.13.116.216|RA4=23.13.117.227|RA4=23.13.132.17|RA4=23.13.153.63|RA4=23.13.166.238|RA4=23.13.170.73|RA4=23.13.178.161|RA4=23.13.181.249|RA4=23.13.183.38|RA4=23.13.186.150|RA4=23.13.189.44|RA4=23.13.194.91|RA4=23.13.195.30|RA4=23.13.195.229|RA4=23.13.200.37|RA4=23.13.201.55|RA4=23.13.225.212|RA4=23.13.226.75|RA4=23.13.227.164|RA4=23.13.232.89|RA4=23.13.245.130|RA4=23.13.246.247|RA4=23.13.255.80|RA4=23.14.25.249|RA4=23.14.27.117|RA4=23.14.27.220|RA4=23.14.64.141|RA4=23.14.72.51|RA4=23.14.75.131|RA4=23.14.83.180|RA4=23.14.84.16|RA4=23.14.84.18|RA4=23.14.84.19|RA4=23.14.84.24|RA4=23.14.84.27|RA4=23.14.84.32|RA4=23.14.84.43|RA4=23.14.84.49|RA4=23.14.84.58|RA4=23.14.84.83|RA4=23.14.84.162|RA4=23.14.84.163|RA4=23.14.84.168|RA4=23.14.84.170|RA4=23.14.84.179|RA4=23.14.84.200|RA4=23.14.92.8|RA4=23.14.92.24|RA4=23.14.92.51|RA4=23.14.92.67|RA4=23.14.92.72|RA4=23.14.92.122|RA4=23.14.92.145|RA4=23.14.92.170|RA4=23.14.97.16|RA4=23.14.108.198|RA4=23.14.109.70|RA4=23.14.116.96|RA4=23.14.152.12|RA4=23.14.168.12|RA4=23.14.184.12|RA4=23.14.210.48|RA4=23.14.216.243|RA4=23.14.233.230|RA4=23.15.14.10|RA4=23.15.14.17|RA4=23.15.14.19|RA4=23.15.133.123|RA4=23.15.135.8|RA4=23.15.135.9|RA4=23.15.135.10|RA4=23.15.135.11|RA4=23.15.135.17|RA4=23.101.196.141|RA4=23.102.21.4|RA4=216.58.196.6|RA4=216.58.196.38|RA4=216.58.196.70|RA4=216.58.197.6|RA4=216.58.197.38|RA4=216.58.197.70|RA4=216.58.197.102|RA4=216.58.197.134|RA4=216.58.197.166|RA4=216.58.197.198|RA4=216.58.197.230|RA4=216.58.198.38|RA4=216.58.198.102|RA4=216.58.198.134|RA4=216.58.198.166|RA4=216.58.198.198|RA4=216.58.199.6|RA4=216.58.199.38|RA4=216.58.199.70|RA4=216.58.199.102|RA4=216.58.199.198|RA4=216.58.200.6|RA4=216.58.200.166|RA4=216.58.200.198|RA4=216.58.200.230|RA4=216.58.201.38|RA4=216.58.201.70|RA4=216.58.201.102|RA4=216.58.201.134|RA4=216.58.201.166|RA4=216.58.201.198|RA4=216.58.201.230|RA4=216.58.202.6|RA4=216.58.202.38|RA4=216.58.202.102|RA4=216.58.203.6|RA4=216.58.203.38|RA4=216.58.203.70|RA4=216.58.204.38|RA4=216.58.204.70|RA4=216.58.204.134|RA4=216.58.205.6|RA4=216.58.205.38|RA4=216.58.205.70|RA4=216.58.205.166|RA4=216.58.205.198|RA4=216.58.205.230|RA4=216.58.206.38|RA4=216.58.206.166|RA4=216.58.206.198|RA4=216.58.206.230|RA4=216.58.207.38|RA4=216.58.207.70|RA4=216.58.207.134|RA4=216.58.207.166|RA4=216.58.208.6|RA4=216.58.208.38|RA4=216.58.208.70|RA4=216.58.208.102|RA4=216.58.208.166|RA4=216.58.208.198|RA4=216.58.208.230|RA4=216.58.209.6|RA4=216.58.209.38|RA4=216.58.209.70|RA4=216.58.209.102|RA4=216.58.209.134|RA4=216.58.209.166|RA4=216.58.209.198|RA4=216.58.209.230|RA4=216.58.210.6|RA4=216.58.210.38|RA4=216.58.210.70|RA4=216.58.210.102|RA4=216.58.210.134|RA4=216.58.210.166|RA4=216.58.210.198|RA4=216.58.210.230|RA4=216.58.211.6|RA4=216.58.211.38|RA4=216.58.211.70|RA4=216.58.211.102|RA4=216.58.211.134|RA4=216.58.211.166|RA4=216.58.211.198|RA4=216.58.211.230|RA4=216.58.212.6|RA4=216.58.212.38|RA4=216.58.212.70|RA4=216.58.212.102|RA4=216.58.212.134|RA4=216.58.213.6|RA4=216.58.213.38|RA4=216.58.213.102|RA4=216.58.213.134|RA4=216.58.213.166|RA4=216.58.213.198|RA4=216.58.213.230|RA4=216.58.214.6|RA4=216.58.214.38|RA4=216.58.214.70|RA4=216.58.214.102|RA4=216.58.214.134|RA4=216.58.214.166|RA4=216.58.214.198|RA4=216.58.214.230|RA4=216.58.216.6|RA4=216.58.216.38|RA4=216.58.216.70|RA4=216.58.216.102|RA4=216.58.216.134|RA4=216.58.216.166|RA4=216.58.216.198|RA4=216.58.216.230|RA4=216.58.217.6|RA4=216.58.217.38|RA4=216.58.217.102|RA4=216.58.217.134|RA4=216.58.217.198|RA4=216.58.217.230|RA4=216.58.218.102|RA4=216.58.218.134|RA4=216.58.218.166|RA4=216.58.218.198|RA4=216.58.219.6|RA4=216.58.219.38|RA4=216.58.219.70|RA4=216.58.219.102|RA4=216.58.219.134|RA4=216.58.219.166|RA4=216.58.219.198|RA4=216.58.219.230|RA4=216.58.220.6|RA4=216.58.220.38|RA4=216.58.220.102|RA4=216.58.220.134|RA4=216.58.220.166|RA4=216.58.220.198|RA4=216.58.220.230|RA4=216.58.221.6|RA4=216.58.221.38|RA4=216.58.221.70|RA4=216.58.221.102|RA4=216.58.221.134|RA4=216.58.221.166|RA4=216.58.221.198|RA4=216.58.221.230|RA4=216.58.222.6|RA4=216.58.222.38|RA4=216.58.222.70|RA4=216.58.222.102|RA4=216.58.222.134|RA4=216.58.222.230|RA4=216.58.223.6|RA4=216.58.223.38|RA4=217.7.48.161|RA4=217.7.48.198|RA4=217.9.235.136|RA4=217.9.235.137|RA4=217.9.235.138|RA4=217.9.235.139|RA4=217.9.235.144|RA4=217.9.235.145|RA4=217.9.235.147|RA4=217.9.235.152|RA4=217.19.146.198|RA4=217.19.146.199|RA4=217.19.146.200|RA4=217.27.50.197|RA4=217.32.24.144|RA4=217.32.24.168|RA4=217.32.26.73|RA4=217.32.26.97|RA4=217.32.28.49|RA4=217.32.28.176|RA4=217.32.28.222|RA4=217.32.28.224|RA4=217.32.28.230|RA4=217.32.28.232|RA4=217.65.198.72|RA4=217.65.198.73|RA4=217.65.198.74|RA4=217.75.209.201|RA4=217.75.209.203|RA4=217.75.209.209|RA4=217.75.209.216|RA4=217.75.209.224|RA4=217.89.105.139|RA4=217.89.105.147|RA4=217.89.106.104|RA4=217.89.106.113|RA4=217.146.165.138|RA4=217.146.165.139|RA4=217.153.56.72|RA4=217.153.56.73|RA4=217.153.56.86|RA4=217.153.56.87|RA4=217.212.238.24|RA4=217.212.238.27|RA4=217.212.252.70|RA4=217.212.252.72|RA4=217.212.252.78|RA4=217.212.252.88|RA4=217.212.252.94|RA4=217.212.252.97|RA4=218.28.144.37|RA4=218.93.250.18|RA4=219.76.10.8|RA4=219.76.10.33|RA4=219.76.10.34|RA4=219.76.10.35|RA4=219.76.10.58|RA4=219.76.10.59|RA4=219.76.10.209|RA4=219.76.10.211|RA4=219.76.10.217|RA4=219.76.10.225|RA4=219.76.10.226|RA4=219.83.126.58|RA4=219.83.126.59|RA4=219.88.185.49|RA4=219.88.186.91|RA4=219.88.207.11|RA4=219.88.207.16|RA4=219.88.207.17|RA4=219.88.207.24|RA4=219.93.34.24|RA4=219.93.34.48|RA4=219.93.34.57|RA4=219.93.34.59|RA4=219.93.34.66|RA4=219.93.37.88|RA4=219.93.37.90|RA4=219.93.37.104|RA4=219.93.37.105|RA4=219.93.37.112|RA4=219.93.37.115|RA4=219.109.49.248|RA4=219.109.49.249|RA4=219.109.49.250|RA4=219.109.49.251|RA4=219.117.32.73|RA4=219.117.32.74|RA4=219.117.32.83|RA4=219.117.32.89|RA4=219.117.33.155|RA4=219.117.33.161|RA4=220.90.198.66|RA4=220.90.198.72|RA4=220.90.198.73|RA4=220.90.198.74|RA4=220.90.198.75|RA4=220.90.198.80|RA4=220.208.109.10|RA4=220.208.109.32|RA4=220.208.109.33|RA4=220.208.109.48|RA4=220.208.109.55|RA4=221.135.111.120|RA4=221.135.111.121|RA4=222.239.118.11|RA4=222.239.118.26|RA4=222.239.118.33|RA4=222.239.118.35|RA4=222.239.118.40|RA4=222.239.118.43|RA4=222.251.135.8|RA4=222.251.135.10|RA4=222.251.135.16|RA4=222.251.135.19|RA4=222.251.135.25|RA4=222.251.135.26|RA4=223.27.232.8|RA4=223.27.232.9|RA4=223.27.232.10|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-13|""
""{70C3E48C-2CE8-412F-8895-A650138FFF55}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=23.2.16.9|RA4=23.2.16.10|RA4=23.2.16.11|RA4=23.2.16.17|RA4=23.2.16.25|RA4=23.2.16.34|RA4=23.2.16.41|RA4=23.2.16.42|RA4=23.2.16.56|RA4=23.2.16.80|RA4=23.2.16.82|RA4=23.2.16.88|RA4=23.2.16.98|RA4=23.2.16.99|RA4=23.2.16.106|RA4=23.2.16.200|RA4=23.2.16.201|RA4=23.2.16.202|RA4=23.2.16.203|RA4=23.2.16.219|RA4=23.2.17.35|RA4=23.2.17.65|RA4=23.2.24.215|RA4=23.2.36.78|RA4=23.2.38.107|RA4=23.2.38.161|RA4=23.2.39.2|RA4=23.2.58.85|RA4=23.2.68.77|RA4=23.2.108.70|RA4=23.2.109.137|RA4=23.2.117.207|RA4=23.2.118.238|RA4=23.2.122.73|RA4=23.2.133.172|RA4=23.2.142.48|RA4=23.2.231.13|RA4=23.2.236.52|RA4=23.15.4.8|RA4=23.15.4.9|RA4=23.15.4.10|RA4=23.15.4.16|RA4=23.15.4.17|RA4=23.15.4.18|RA4=23.15.4.24|RA4=23.15.4.25|RA4=23.15.7.96|RA4=23.15.7.98|RA4=23.15.7.99|RA4=23.15.7.115|RA4=23.15.7.121|RA4=23.15.7.129|RA4=23.15.7.131|RA4=23.15.7.136|RA4=23.15.7.144|RA4=23.15.7.145|RA4=23.15.8.19|RA4=23.15.8.58|RA4=23.15.8.67|RA4=23.15.8.82|RA4=23.15.8.104|RA4=23.15.8.122|RA4=23.15.9.9|RA4=23.15.9.17|RA4=23.15.9.40|RA4=23.15.9.41|RA4=23.15.9.48|RA4=23.15.9.51|RA4=23.15.9.67|RA4=23.15.9.81|RA4=23.15.9.171|RA4=23.15.9.177|RA4=23.15.14.8|RA4=23.15.14.25|RA4=23.15.14.32|RA4=23.15.38.67|RA4=23.15.38.90|RA4=23.15.52.204|RA4=23.15.54.176|RA4=23.15.67.142|RA4=23.15.74.246|RA4=23.15.79.238|RA4=23.15.145.60|RA4=23.15.150.175|RA4=23.15.152.172|RA4=23.15.152.203|RA4=23.15.180.127|RA4=23.15.182.161|RA4=23.15.183.47|RA4=23.15.242.201|RA4=23.15.250.6|RA4=23.15.255.214|RA4=23.192.7.7|RA4=23.192.34.11|RA4=23.192.162.41|RA4=23.192.162.106|RA4=23.192.162.200|RA4=23.192.162.217|RA4=23.192.202.53|RA4=23.192.242.112|RA4=23.193.5.209|RA4=23.193.23.53|RA4=23.193.28.49|RA4=23.193.58.161|RA4=23.193.119.197|RA4=23.193.132.54|RA4=23.193.148.38|RA4=23.193.160.102|RA4=23.193.184.125|RA4=23.193.187.83|RA4=23.193.187.123|RA4=23.193.196.180|RA4=23.193.202.163|RA4=23.193.218.19|RA4=23.193.237.195|RA4=23.193.238.162|RA4=23.193.243.216|RA4=23.193.248.21|RA4=23.193.251.170|RA4=23.194.12.97|RA4=23.194.21.9|RA4=23.194.33.169|RA4=23.194.35.153|RA4=23.194.69.133|RA4=23.194.71.91|RA4=23.194.75.9|RA4=23.194.80.131|RA4=23.194.101.51|RA4=23.194.101.246|RA4=23.194.128.80|RA4=23.194.129.11|RA4=23.194.131.114|RA4=23.194.137.155|RA4=23.194.224.141|RA4=23.194.233.164|RA4=23.195.0.72|RA4=23.195.1.105|RA4=23.195.3.85|RA4=23.195.10.24|RA4=23.195.14.161|RA4=23.195.48.143|RA4=23.195.49.70|RA4=23.195.59.30|RA4=23.195.77.220|RA4=23.195.103.51|RA4=23.195.106.154|RA4=23.195.108.163|RA4=23.195.109.221|RA4=23.195.132.243|RA4=23.195.156.223|RA4=23.195.226.222|RA4=23.195.234.163|RA4=23.195.236.82|RA4=23.195.241.113|RA4=23.195.242.101|RA4=23.195.248.136|RA4=23.195.255.4|RA4=23.196.0.238|RA4=23.196.14.161|RA4=23.196.19.89|RA4=23.196.27.121|RA4=23.196.38.44|RA4=23.196.45.67|RA4=23.196.51.78|RA4=23.196.51.165|RA4=23.196.58.99|RA4=23.196.64.49|RA4=23.196.75.83|RA4=23.196.87.19|RA4=23.196.87.245|RA4=23.196.91.34|RA4=23.196.96.50|RA4=23.196.96.52|RA4=23.196.102.238|RA4=23.196.106.73|RA4=23.196.117.78|RA4=23.196.123.83|RA4=23.196.125.213|RA4=23.196.126.185|RA4=23.196.164.228|RA4=23.196.165.49|RA4=23.196.186.88|RA4=23.196.230.140|RA4=23.196.234.132|RA4=23.196.236.61|RA4=23.196.245.134|RA4=23.196.255.139|RA4=23.197.0.141|RA4=23.197.15.166|RA4=23.197.16.56|RA4=23.197.17.94|RA4=23.197.30.80|RA4=23.197.36.136|RA4=23.197.39.250|RA4=23.197.42.156|RA4=23.197.106.161|RA4=23.197.123.68|RA4=23.197.132.29|RA4=23.197.139.57|RA4=23.197.150.91|RA4=23.197.176.175|RA4=23.197.209.7|RA4=23.197.218.34|RA4=23.197.226.137|RA4=23.197.240.227|RA4=23.197.246.177|RA4=23.197.254.161|RA4=23.198.24.12|RA4=23.198.91.76|RA4=23.198.106.52|RA4=23.198.108.36|RA4=23.198.108.174|RA4=23.198.109.53|RA4=23.198.118.60|RA4=23.198.124.174|RA4=23.198.146.93|RA4=23.198.148.247|RA4=23.198.158.61|RA4=23.198.164.14|RA4=23.198.165.103|RA4=23.198.165.174|RA4=23.198.167.152|RA4=23.198.171.39|RA4=23.198.200.132|RA4=23.198.202.249|RA4=23.198.244.104|RA4=23.198.250.243|RA4=23.198.253.113|RA4=23.199.39.111|RA4=23.199.51.105|RA4=23.199.59.83|RA4=23.199.65.19|RA4=23.199.89.141|RA4=23.199.133.217|RA4=23.199.135.98|RA4=23.199.142.153|RA4=23.199.193.247|RA4=23.199.196.125|RA4=23.199.200.12|RA4=23.199.212.10|RA4=23.199.215.129|RA4=23.199.237.59|RA4=23.200.50.59|RA4=23.200.54.28|RA4=23.200.59.83|RA4=23.200.68.63|RA4=23.200.72.61|RA4=23.200.75.231|RA4=23.200.85.9|RA4=23.200.85.17|RA4=23.200.85.18|RA4=23.200.85.32|RA4=23.200.86.143|RA4=23.200.86.145|RA4=23.200.86.151|RA4=23.200.86.152|RA4=23.200.86.153|RA4=23.200.87.140|RA4=23.200.87.167|RA4=23.200.87.172|RA4=23.200.87.223|RA4=23.200.99.90|RA4=23.200.103.76|RA4=23.200.104.153|RA4=23.200.135.172|RA4=23.200.138.63|RA4=23.200.142.161|RA4=23.200.178.144|RA4=23.200.182.132|RA4=23.200.185.20|RA4=23.200.200.137|RA4=23.200.201.74|RA4=23.200.229.35|RA4=23.200.230.65|RA4=23.200.230.99|RA4=23.200.233.117|RA4=23.200.234.87|RA4=23.201.22.200|RA4=23.201.24.241|RA4=23.201.27.195|RA4=23.201.29.6|RA4=23.201.43.90|RA4=23.201.54.238|RA4=23.201.58.73|RA4=23.201.60.13|RA4=23.201.81.215|RA4=23.201.83.26|RA4=23.201.102.9|RA4=23.201.102.11|RA4=23.201.102.16|RA4=23.201.102.17|RA4=23.201.102.25|RA4=23.201.102.26|RA4=23.201.102.41|RA4=23.201.102.48|RA4=23.201.102.50|RA4=23.201.103.16|RA4=23.201.103.18|RA4=23.201.103.58|RA4=23.201.103.89|RA4=23.201.103.131|RA4=23.201.103.147|RA4=23.201.153.169|RA4=23.201.155.7|RA4=23.201.162.234|RA4=23.201.169.242|RA4=23.201.173.93|RA4=23.201.177.26|RA4=23.201.177.78|RA4=23.201.177.133|RA4=23.201.182.38|RA4=23.201.182.91|RA4=23.201.184.16|RA4=23.201.188.176|RA4=23.201.204.248|RA4=23.201.211.68|RA4=23.201.213.52|RA4=23.201.234.86|RA4=23.201.240.69|RA4=23.201.240.115|RA4=23.201.241.125|RA4=23.201.248.220|RA4=23.201.255.238|RA4=23.202.42.161|RA4=23.202.51.220|RA4=23.202.61.139|RA4=23.202.76.241|RA4=23.202.89.63|RA4=23.202.102.238|RA4=23.202.106.73|RA4=23.202.114.161|RA4=23.202.123.184|RA4=23.202.139.56|RA4=23.202.154.162|RA4=23.202.156.79|RA4=23.202.163.184|RA4=23.202.167.171|RA4=23.202.168.90|RA4=23.202.201.63|RA4=23.202.214.238|RA4=23.202.218.73|RA4=23.202.226.161|RA4=23.203.18.124|RA4=23.203.19.16|RA4=23.203.27.83|RA4=23.203.34.152|RA4=23.203.36.114|RA4=23.203.45.98|RA4=23.203.48.159|RA4=23.203.60.148|RA4=23.203.74.166|RA4=23.203.78.164|RA4=23.203.88.75|RA4=23.203.100.74|RA4=23.203.108.99|RA4=23.203.112.151|RA4=23.203.115.85|RA4=23.203.117.61|RA4=23.203.122.120|RA4=23.203.123.23|RA4=23.203.131.147|RA4=23.203.131.207|RA4=23.203.145.202|RA4=23.203.148.203|RA4=23.203.153.3|RA4=23.203.155.64|RA4=23.203.173.112|RA4=23.203.178.54|RA4=23.203.184.174|RA4=23.203.187.112|RA4=23.203.197.102|RA4=23.203.219.68|RA4=23.203.225.95|RA4=23.203.228.76|RA4=23.203.231.71|RA4=23.203.240.232|RA4=23.203.243.67|RA4=23.203.246.161|RA4=23.203.252.221|RA4=23.203.253.123|RA4=23.204.6.129|RA4=23.204.16.117|RA4=23.204.19.169|RA4=23.204.65.204|RA4=23.204.93.177|RA4=23.204.108.40|RA4=23.204.108.41|RA4=23.204.108.42|RA4=23.204.108.43|RA4=23.204.108.48|RA4=23.204.108.49|RA4=23.204.108.51|RA4=23.204.108.56|RA4=23.204.109.16|RA4=23.204.109.18|RA4=23.204.109.25|RA4=23.204.109.33|RA4=23.204.109.35|RA4=23.204.109.40|RA4=23.204.109.48|RA4=23.204.148.151|RA4=23.204.156.133|RA4=23.204.156.143|RA4=23.204.171.90|RA4=23.204.181.208|RA4=23.204.182.238|RA4=23.204.186.73|RA4=23.204.187.16|RA4=23.204.188.127|RA4=23.204.225.47|RA4=23.204.230.208|RA4=23.204.232.93|RA4=23.204.239.198|RA4=23.204.240.92|RA4=23.205.49.166|RA4=23.205.50.94|RA4=23.205.63.81|RA4=23.205.63.229|RA4=23.205.66.185|RA4=23.205.81.55|RA4=23.205.88.114|RA4=23.205.106.217|RA4=23.205.107.143|RA4=23.205.115.155|RA4=23.205.115.161|RA4=23.205.115.185|RA4=23.205.115.211|RA4=23.205.115.218|RA4=23.205.116.63|RA4=23.205.116.71|RA4=23.205.116.103|RA4=23.205.116.105|RA4=23.205.116.120|RA4=23.205.116.128|RA4=23.205.116.137|RA4=23.205.116.162|RA4=23.205.116.176|RA4=23.205.116.191|RA4=23.205.118.16|RA4=23.205.118.33|RA4=23.205.118.35|RA4=23.205.118.42|RA4=23.205.119.8|RA4=23.205.119.10|RA4=23.205.119.16|RA4=23.205.119.18|RA4=23.205.119.19|RA4=23.205.120.146|RA4=23.205.120.152|RA4=23.205.120.154|RA4=23.205.168.25|RA4=23.205.168.51|RA4=23.205.168.59|RA4=23.205.168.64|RA4=23.205.168.65|RA4=23.205.168.74|RA4=23.205.168.88|RA4=23.205.168.96|RA4=23.205.168.114|RA4=23.205.168.122|RA4=23.205.169.26|RA4=23.205.169.33|RA4=23.205.169.48|RA4=23.205.169.56|RA4=23.205.169.57|RA4=23.205.169.75|RA4=23.205.175.30|RA4=23.205.177.139|RA4=23.205.178.71|RA4=23.205.181.34|RA4=23.205.185.69|RA4=23.205.201.251|RA4=23.205.212.23|RA4=23.205.212.66|RA4=23.205.212.231|RA4=23.205.213.86|RA4=23.205.214.168|RA4=23.205.214.214|RA4=23.205.220.11|RA4=23.205.220.25|RA4=23.205.220.35|RA4=23.205.220.75|RA4=23.205.220.99|RA4=23.205.226.19|RA4=23.205.232.176|RA4=23.205.242.107|RA4=23.206.13.85|RA4=23.206.102.197|RA4=23.206.121.121|RA4=23.206.133.9|RA4=23.206.142.34|RA4=23.206.144.110|RA4=23.206.145.53|RA4=23.206.166.114|RA4=23.206.176.107|RA4=23.206.179.164|RA4=23.206.180.16|RA4=23.206.192.69|RA4=23.206.217.63|RA4=23.206.219.29|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-14|""
""{62975276-DED7-46A0-8C29-4C0587B0D98B}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=23.206.33.187|RA4=23.206.35.141|RA4=23.206.38.245|RA4=23.206.39.87|RA4=23.206.39.237|RA4=23.206.42.56|RA4=23.206.69.146|RA4=23.206.82.227|RA4=23.206.86.152|RA4=23.206.90.13|RA4=23.206.224.91|RA4=23.206.224.205|RA4=23.206.226.66|RA4=23.206.230.238|RA4=23.206.234.73|RA4=23.206.242.161|RA4=23.206.244.114|RA4=23.206.246.204|RA4=23.207.3.81|RA4=23.207.6.120|RA4=23.207.11.116|RA4=23.207.13.110|RA4=23.207.17.234|RA4=23.207.29.45|RA4=23.207.33.191|RA4=23.207.34.132|RA4=23.207.36.22|RA4=23.207.47.18|RA4=23.207.52.24|RA4=23.207.53.7|RA4=23.207.60.116|RA4=23.207.68.77|RA4=23.207.71.109|RA4=23.207.92.92|RA4=23.207.129.191|RA4=23.207.134.44|RA4=23.207.139.166|RA4=23.207.169.5|RA4=23.207.183.188|RA4=23.207.185.160|RA4=23.207.232.122|RA4=23.208.4.203|RA4=23.208.46.70|RA4=23.208.49.58|RA4=23.208.60.145|RA4=23.208.65.153|RA4=23.208.67.196|RA4=23.208.70.161|RA4=23.208.71.246|RA4=23.208.81.111|RA4=23.208.84.24|RA4=23.208.87.25|RA4=23.208.96.37|RA4=23.208.97.190|RA4=23.208.106.58|RA4=23.208.183.91|RA4=23.208.190.63|RA4=23.208.210.161|RA4=23.208.214.161|RA4=23.208.218.161|RA4=23.208.240.24|RA4=23.208.247.37|RA4=23.209.22.238|RA4=23.209.26.73|RA4=23.209.80.83|RA4=23.209.83.52|RA4=23.209.85.217|RA4=23.209.91.90|RA4=23.209.92.30|RA4=23.209.106.185|RA4=23.209.180.8|RA4=23.209.180.9|RA4=23.209.183.11|RA4=23.209.183.16|RA4=23.209.183.17|RA4=23.209.183.19|RA4=23.209.183.74|RA4=23.209.183.79|RA4=23.209.183.82|RA4=23.209.183.90|RA4=23.209.183.103|RA4=23.209.183.112|RA4=23.209.225.134|RA4=23.209.227.161|RA4=23.209.239.192|RA4=23.210.2.161|RA4=23.210.13.25|RA4=23.210.32.158|RA4=23.210.38.24|RA4=23.210.74.51|RA4=23.210.89.7|RA4=23.210.89.210|RA4=23.210.96.95|RA4=23.210.98.197|RA4=23.210.100.142|RA4=23.210.116.96|RA4=23.210.117.184|RA4=23.210.121.62|RA4=23.210.132.198|RA4=23.210.141.114|RA4=23.210.144.233|RA4=23.210.147.142|RA4=23.210.153.165|RA4=23.210.164.242|RA4=23.210.176.17|RA4=23.210.202.127|RA4=23.210.204.107|RA4=23.210.204.215|RA4=23.210.205.64|RA4=23.210.209.156|RA4=23.210.222.23|RA4=23.210.225.248|RA4=23.210.241.124|RA4=23.210.247.73|RA4=23.210.248.73|RA4=23.210.249.5|RA4=23.211.0.100|RA4=23.211.0.166|RA4=23.211.1.81|RA4=23.211.2.23|RA4=23.211.4.73|RA4=23.211.5.4|RA4=23.211.8.73|RA4=23.211.8.175|RA4=23.211.9.4|RA4=23.211.21.188|RA4=23.211.27.133|RA4=23.211.30.238|RA4=23.211.43.210|RA4=23.211.44.208|RA4=23.211.48.107|RA4=23.211.129.66|RA4=23.211.130.161|RA4=23.211.135.8|RA4=23.211.135.9|RA4=23.211.135.11|RA4=23.211.135.25|RA4=23.211.135.32|RA4=23.211.135.34|RA4=23.211.135.40|RA4=23.211.135.49|RA4=23.211.135.102|RA4=23.211.141.6|RA4=23.211.148.126|RA4=23.211.151.79|RA4=23.211.156.74|RA4=23.211.159.37|RA4=23.211.163.34|RA4=23.211.166.9|RA4=23.211.167.86|RA4=23.211.171.249|RA4=23.211.188.48|RA4=23.211.203.104|RA4=23.211.204.250|RA4=23.211.212.244|RA4=23.211.234.102|RA4=23.211.236.175|RA4=23.211.238.232|RA4=23.212.30.205|RA4=23.212.39.146|RA4=23.212.52.32|RA4=23.212.52.34|RA4=23.212.52.175|RA4=23.212.52.177|RA4=23.212.53.175|RA4=23.212.53.181|RA4=23.212.53.190|RA4=23.212.53.191|RA4=23.212.53.214|RA4=23.212.53.230|RA4=23.212.98.216|RA4=23.212.108.87|RA4=23.212.108.95|RA4=23.212.108.96|RA4=23.212.108.110|RA4=23.212.108.121|RA4=23.212.108.161|RA4=23.212.109.137|RA4=23.212.109.145|RA4=23.212.109.146|RA4=23.212.109.161|RA4=23.212.123.151|RA4=23.212.127.141|RA4=23.212.134.42|RA4=23.212.157.87|RA4=23.212.169.236|RA4=23.212.182.161|RA4=23.212.192.44|RA4=23.212.193.3|RA4=23.212.198.82|RA4=23.212.211.151|RA4=23.212.212.185|RA4=23.212.215.187|RA4=23.212.241.170|RA4=23.213.22.69|RA4=23.213.35.245|RA4=23.213.37.96|RA4=23.213.43.104|RA4=23.213.50.137|RA4=23.213.77.228|RA4=23.213.81.149|RA4=23.213.84.115|RA4=23.213.89.233|RA4=23.213.93.146|RA4=23.213.97.96|RA4=23.213.99.45|RA4=23.213.113.17|RA4=23.213.120.97|RA4=23.213.120.219|RA4=23.213.136.39|RA4=23.213.141.175|RA4=23.213.225.199|RA4=23.213.240.64|RA4=23.214.35.145|RA4=23.214.43.126|RA4=23.214.44.215|RA4=23.214.49.232|RA4=23.214.66.123|RA4=23.214.93.216|RA4=23.214.105.11|RA4=23.214.105.152|RA4=23.214.108.77|RA4=23.214.109.59|RA4=23.214.124.29|RA4=23.214.126.66|RA4=23.214.126.242|RA4=23.214.136.14|RA4=23.214.138.200|RA4=23.214.140.238|RA4=23.214.142.180|RA4=23.214.143.30|RA4=23.214.143.127|RA4=23.214.150.152|RA4=23.214.156.52|RA4=23.214.157.183|RA4=23.214.157.194|RA4=23.214.162.149|RA4=23.214.172.186|RA4=23.214.176.31|RA4=23.214.177.92|RA4=23.214.177.198|RA4=23.214.184.194|RA4=23.214.188.102|RA4=23.214.231.91|RA4=23.215.2.161|RA4=23.215.31.219|RA4=23.215.33.69|RA4=23.215.35.225|RA4=23.215.37.73|RA4=23.215.38.170|RA4=23.215.39.13|RA4=23.215.39.231|RA4=23.215.40.15|RA4=23.215.48.83|RA4=23.215.52.111|RA4=23.215.63.8|RA4=23.215.63.56|RA4=23.215.63.67|RA4=23.215.63.96|RA4=23.215.63.97|RA4=23.215.98.195|RA4=23.215.98.209|RA4=23.215.99.17|RA4=23.215.99.32|RA4=23.215.102.16|RA4=23.215.102.59|RA4=23.215.102.65|RA4=23.215.104.114|RA4=23.215.105.98|RA4=23.215.130.154|RA4=23.215.130.179|RA4=23.215.130.209|RA4=23.215.130.234|RA4=23.215.135.9|RA4=23.215.135.10|RA4=23.215.135.17|RA4=23.215.137.112|RA4=23.215.162.95|RA4=23.215.167.22|RA4=23.215.171.110|RA4=23.215.177.131|RA4=23.215.179.226|RA4=23.215.186.33|RA4=23.215.192.145|RA4=23.215.210.12|RA4=23.215.217.33|RA4=23.215.228.150|RA4=23.215.231.56|RA4=23.215.248.14|RA4=23.215.253.83|RA4=23.216.10.96|RA4=23.216.10.98|RA4=23.216.10.105|RA4=23.216.10.112|RA4=23.216.10.113|RA4=23.216.10.123|RA4=23.216.10.155|RA4=23.216.10.163|RA4=23.216.10.195|RA4=23.216.10.210|RA4=23.216.10.224|RA4=23.216.10.226|RA4=23.216.11.10|RA4=23.216.11.25|RA4=23.216.11.50|RA4=23.216.11.56|RA4=23.216.11.81|RA4=23.216.11.98|RA4=23.216.11.105|RA4=23.216.11.120|RA4=23.216.54.13|RA4=23.216.121.220|RA4=23.216.140.29|RA4=23.216.145.199|RA4=23.216.147.38|RA4=23.216.151.82|RA4=23.216.207.158|RA4=23.216.209.145|RA4=23.216.219.55|RA4=23.216.223.11|RA4=23.216.227.234|RA4=23.216.241.236|RA4=23.216.245.57|RA4=23.217.60.118|RA4=23.217.103.164|RA4=23.217.110.197|RA4=23.217.111.128|RA4=23.217.138.81|RA4=23.217.138.91|RA4=23.217.144.196|RA4=23.217.150.148|RA4=23.217.152.9|RA4=23.217.162.96|RA4=23.217.167.219|RA4=23.217.169.125|RA4=23.217.186.161|RA4=23.217.238.252|RA4=23.217.246.238|RA4=23.217.250.73|RA4=23.217.251.96|RA4=23.217.255.118|RA4=23.218.2.100|RA4=23.218.14.111|RA4=23.218.26.184|RA4=23.218.28.71|RA4=23.218.46.141|RA4=23.218.93.109|RA4=23.218.94.75|RA4=23.218.102.25|RA4=23.218.106.160|RA4=23.218.112.81|RA4=23.218.118.158|RA4=23.218.134.143|RA4=23.218.140.65|RA4=23.218.141.237|RA4=23.218.149.115|RA4=23.218.156.17|RA4=23.218.156.24|RA4=23.218.156.32|RA4=23.218.156.41|RA4=23.218.156.42|RA4=23.218.156.43|RA4=23.218.156.58|RA4=23.218.156.64|RA4=23.218.156.66|RA4=23.218.156.99|RA4=23.218.156.107|RA4=23.218.157.42|RA4=23.218.157.56|RA4=23.218.157.59|RA4=23.218.157.106|RA4=23.218.179.58|RA4=23.218.184.224|RA4=23.218.195.39|RA4=23.218.212.69|RA4=23.219.132.30|RA4=23.219.132.76|RA4=23.219.132.161|RA4=23.219.133.248|RA4=23.219.160.48|RA4=23.219.160.82|RA4=23.219.162.82|RA4=23.219.162.105|RA4=23.219.162.107|RA4=23.219.162.113|RA4=23.219.162.123|RA4=23.219.162.129|RA4=23.219.162.138|RA4=23.219.162.146|RA4=23.219.163.17|RA4=23.219.163.19|RA4=23.219.163.43|RA4=23.220.6.18|RA4=23.220.19.114|RA4=23.220.21.216|RA4=23.220.60.182|RA4=23.220.86.241|RA4=23.220.87.137|RA4=23.220.91.115|RA4=23.220.100.9|RA4=23.220.100.10|RA4=23.220.100.11|RA4=23.220.100.19|RA4=23.220.100.177|RA4=23.220.100.178|RA4=23.220.100.185|RA4=23.220.106.36|RA4=23.220.119.102|RA4=23.220.130.162|RA4=23.220.148.9|RA4=23.220.148.27|RA4=23.220.148.32|RA4=23.220.148.35|RA4=23.220.148.59|RA4=23.220.149.98|RA4=23.220.149.107|RA4=23.220.149.147|RA4=23.220.149.152|RA4=23.220.149.163|RA4=23.220.153.26|RA4=23.220.153.32|RA4=23.220.153.34|RA4=23.220.153.35|RA4=23.220.153.40|RA4=23.220.180.94|RA4=23.220.193.177|RA4=23.220.196.249|RA4=23.220.198.146|RA4=23.220.203.10|RA4=23.220.203.16|RA4=23.220.203.18|RA4=23.220.203.24|RA4=23.220.203.42|RA4=23.220.203.50|RA4=23.220.203.57|RA4=23.220.215.70|RA4=23.220.247.203|RA4=23.220.250.140|RA4=23.220.254.61|RA4=23.221.8.199|RA4=23.221.28.31|RA4=23.221.30.47|RA4=23.221.32.88|RA4=23.221.33.158|RA4=23.221.41.51|RA4=23.221.43.42|RA4=23.221.44.131|RA4=23.221.49.97|RA4=23.221.54.217|RA4=23.221.99.136|RA4=23.221.108.49|RA4=23.221.116.175|RA4=23.221.119.149|RA4=23.221.121.121|RA4=23.221.130.57|RA4=23.221.147.104|RA4=23.221.154.243|RA4=23.221.156.148|RA4=23.221.185.13|RA4=23.221.192.114|RA4=23.221.208.142|RA4=23.221.216.108|RA4=23.221.216.150|RA4=23.221.223.99|RA4=23.221.224.104|RA4=23.221.229.116|RA4=23.221.233.26|RA4=23.221.233.242|RA4=23.221.245.67|RA4=23.221.248.21|RA4=23.222.12.161|RA4=23.222.25.7|RA4=23.222.27.242|RA4=23.222.35.27|RA4=23.222.39.107|RA4=23.222.44.94|RA4=23.222.64.145|RA4=23.222.74.215|RA4=23.222.98.126|RA4=23.222.103.103|RA4=23.222.108.155|RA4=23.222.113.200|RA4=23.222.123.56|RA4=23.222.135.76|RA4=23.222.136.101|RA4=23.222.136.104|RA4=23.222.152.60|RA4=23.222.157.191|RA4=23.222.160.125|RA4=23.222.161.117|RA4=23.222.166.121|RA4=23.222.167.68|RA4=23.222.169.232|RA4=23.222.170.100|RA4=23.222.171.70|RA4=23.222.203.229|RA4=23.222.205.109|RA4=23.222.226.72|RA4=23.222.251.141|RA4=23.223.102.75|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-15|""
""{43F9862F-8F79-426F-B906-A9F1A749DD6F}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=23.3.10.57|RA4=23.3.10.59|RA4=23.3.10.73|RA4=23.3.10.74|RA4=23.3.10.80|RA4=23.3.10.96|RA4=23.3.13.192|RA4=23.3.13.209|RA4=23.3.37.246|RA4=23.3.38.142|RA4=23.3.42.126|RA4=23.3.42.232|RA4=23.3.57.219|RA4=23.3.59.68|RA4=23.3.66.178|RA4=23.3.68.99|RA4=23.3.68.105|RA4=23.3.68.107|RA4=23.3.68.115|RA4=23.3.69.33|RA4=23.3.69.35|RA4=23.3.70.16|RA4=23.3.70.17|RA4=23.3.74.8|RA4=23.3.74.16|RA4=23.3.74.18|RA4=23.3.74.49|RA4=23.3.74.81|RA4=23.3.74.88|RA4=23.3.75.50|RA4=23.3.75.57|RA4=23.3.75.73|RA4=23.3.81.240|RA4=23.3.90.168|RA4=23.3.90.169|RA4=23.3.90.187|RA4=23.3.90.200|RA4=23.3.96.18|RA4=23.3.96.25|RA4=23.3.96.27|RA4=23.3.96.33|RA4=23.3.96.35|RA4=23.3.96.64|RA4=23.3.96.97|RA4=23.3.96.98|RA4=23.3.96.106|RA4=23.3.96.129|RA4=23.3.96.131|RA4=23.3.96.138|RA4=23.3.96.147|RA4=23.3.96.161|RA4=23.3.96.168|RA4=23.3.96.169|RA4=23.3.96.179|RA4=23.3.96.184|RA4=23.3.96.224|RA4=23.3.96.227|RA4=23.3.97.16|RA4=23.3.97.59|RA4=23.3.98.11|RA4=23.3.98.19|RA4=23.3.98.25|RA4=23.3.98.33|RA4=23.3.98.49|RA4=23.3.98.51|RA4=23.3.98.56|RA4=23.3.98.65|RA4=23.3.98.89|RA4=23.3.105.11|RA4=23.3.105.17|RA4=23.3.105.19|RA4=23.3.105.27|RA4=23.3.105.32|RA4=23.3.105.129|RA4=23.3.105.136|RA4=23.3.105.162|RA4=23.3.105.184|RA4=23.3.105.193|RA4=23.3.105.201|RA4=23.3.105.202|RA4=23.3.106.11|RA4=23.3.106.34|RA4=23.3.106.35|RA4=23.3.106.51|RA4=23.3.131.77|RA4=23.3.208.86|RA4=23.3.217.25|RA4=23.3.219.192|RA4=23.3.232.119|RA4=23.3.234.140|RA4=23.3.241.227|RA4=23.3.242.246|RA4=23.3.243.72|RA4=23.4.5.138|RA4=23.4.17.46|RA4=23.4.27.83|RA4=23.4.27.164|RA4=23.4.37.110|RA4=23.4.42.162|RA4=23.4.48.89|RA4=23.4.50.167|RA4=23.4.89.210|RA4=23.4.92.8|RA4=23.4.92.10|RA4=23.4.92.27|RA4=23.4.99.20|RA4=23.4.103.147|RA4=23.4.117.95|RA4=23.4.120.179|RA4=23.4.130.9|RA4=23.4.156.200|RA4=23.4.174.135|RA4=23.4.189.84|RA4=23.4.189.252|RA4=23.4.210.199|RA4=23.4.214.76|RA4=23.4.219.57|RA4=23.4.221.207|RA4=23.4.252.125|RA4=23.32.2.163|RA4=23.32.11.93|RA4=23.32.17.209|RA4=23.32.52.88|RA4=23.32.53.41|RA4=23.32.92.90|RA4=23.32.98.233|RA4=23.32.104.170|RA4=23.32.105.63|RA4=23.32.106.146|RA4=23.32.114.63|RA4=23.32.119.83|RA4=23.32.137.63|RA4=23.32.146.161|RA4=23.32.150.161|RA4=23.32.169.63|RA4=23.32.192.241|RA4=23.32.199.192|RA4=23.32.202.67|RA4=23.32.210.161|RA4=23.32.223.95|RA4=23.32.230.127|RA4=23.32.241.24|RA4=23.32.241.40|RA4=23.32.241.42|RA4=23.32.241.48|RA4=23.32.241.49|RA4=23.32.241.65|RA4=23.32.241.67|RA4=23.32.241.73|RA4=23.32.241.74|RA4=23.32.241.80|RA4=23.32.241.89|RA4=23.32.247.149|RA4=23.32.248.10|RA4=23.32.248.18|RA4=23.32.248.25|RA4=23.32.248.40|RA4=23.32.248.42|RA4=23.32.248.43|RA4=23.32.248.59|RA4=23.32.248.65|RA4=23.32.248.66|RA4=23.32.248.79|RA4=23.32.248.89|RA4=23.32.248.91|RA4=23.32.248.97|RA4=23.32.248.104|RA4=23.32.248.105|RA4=23.32.248.114|RA4=23.33.1.183|RA4=23.33.4.198|RA4=23.33.10.184|RA4=23.33.14.62|RA4=23.33.14.163|RA4=23.33.17.183|RA4=23.33.20.26|RA4=23.33.58.194|RA4=23.33.62.63|RA4=23.33.71.67|RA4=23.33.71.239|RA4=23.33.102.216|RA4=23.33.105.176|RA4=23.33.111.231|RA4=23.33.146.156|RA4=23.33.148.144|RA4=23.33.152.241|RA4=23.33.153.192|RA4=23.33.157.249|RA4=23.33.161.124|RA4=23.33.162.46|RA4=23.33.187.8|RA4=23.33.187.16|RA4=23.33.187.33|RA4=23.33.187.35|RA4=23.33.224.190|RA4=23.33.246.251|RA4=23.33.248.151|RA4=23.34.18.157|RA4=23.34.20.111|RA4=23.34.28.139|RA4=23.34.37.86|RA4=23.34.37.151|RA4=23.34.40.81|RA4=23.34.50.161|RA4=23.34.54.161|RA4=23.34.69.21|RA4=23.34.77.185|RA4=23.34.85.145|RA4=23.34.88.18|RA4=23.34.105.194|RA4=23.34.106.114|RA4=23.34.111.45|RA4=23.34.157.74|RA4=23.34.160.74|RA4=23.34.181.207|RA4=23.34.182.238|RA4=23.34.186.73|RA4=23.34.195.101|RA4=23.34.199.119|RA4=23.34.230.208|RA4=23.34.232.64|RA4=23.34.237.215|RA4=23.34.251.230|RA4=23.34.252.111|RA4=23.34.252.177|RA4=23.35.24.138|RA4=23.35.27.105|RA4=23.35.29.234|RA4=23.35.33.83|RA4=23.35.52.220|RA4=23.35.56.35|RA4=23.35.56.190|RA4=23.35.58.210|RA4=23.35.74.162|RA4=23.35.76.215|RA4=23.35.96.155|RA4=23.35.103.107|RA4=23.35.104.71|RA4=23.35.108.190|RA4=23.35.109.58|RA4=23.35.109.244|RA4=23.35.117.207|RA4=23.35.118.238|RA4=23.35.122.73|RA4=23.35.129.115|RA4=23.35.130.153|RA4=23.35.200.82|RA4=23.35.201.78|RA4=23.35.203.62|RA4=23.35.208.192|RA4=23.35.213.77|RA4=23.35.220.89|RA4=23.35.221.32|RA4=23.35.240.227|RA4=23.35.241.10|RA4=23.35.242.117|RA4=23.35.243.137|RA4=23.35.245.123|RA4=23.36.32.18|RA4=23.36.32.51|RA4=23.36.86.238|RA4=23.36.90.73|RA4=23.36.115.11|RA4=23.36.117.44|RA4=23.36.126.238|RA4=23.36.159.184|RA4=23.36.177.190|RA4=23.36.183.190|RA4=23.36.185.196|RA4=23.36.235.104|RA4=23.36.236.19|RA4=23.37.1.144|RA4=23.37.11.92|RA4=23.37.24.155|RA4=23.37.26.175|RA4=23.37.35.125|RA4=23.37.49.192|RA4=23.37.58.231|RA4=23.37.59.50|RA4=23.37.60.150|RA4=23.37.73.63|RA4=23.37.86.238|RA4=23.37.90.73|RA4=23.37.112.243|RA4=23.37.113.90|RA4=23.37.116.170|RA4=23.37.117.196|RA4=23.37.119.25|RA4=23.37.119.179|RA4=23.37.123.121|RA4=23.37.126.67|RA4=23.37.131.130|RA4=23.37.132.68|RA4=23.37.133.237|RA4=23.37.136.181|RA4=23.37.141.71|RA4=23.37.155.69|RA4=23.37.164.189|RA4=23.37.168.79|RA4=23.37.170.131|RA4=23.37.180.163|RA4=23.37.182.105|RA4=23.37.184.118|RA4=23.37.188.108|RA4=23.37.200.80|RA4=23.37.209.32|RA4=23.38.9.63|RA4=23.38.20.210|RA4=23.38.23.212|RA4=23.38.27.211|RA4=23.38.34.144|RA4=23.38.34.156|RA4=23.38.40.85|RA4=23.38.70.238|RA4=23.38.74.73|RA4=23.38.80.97|RA4=23.38.89.129|RA4=23.38.98.161|RA4=23.38.105.107|RA4=23.38.109.144|RA4=23.38.131.165|RA4=23.38.149.46|RA4=23.38.163.111|RA4=23.38.167.135|RA4=23.38.210.136|RA4=23.38.232.12|RA4=23.38.246.35|RA4=23.38.247.69|RA4=23.39.8.12|RA4=23.39.73.91|RA4=23.39.76.38|RA4=23.39.88.245|RA4=23.39.92.204|RA4=23.39.96.66|RA4=23.39.102.55|RA4=23.39.116.112|RA4=23.39.119.56|RA4=23.39.124.202|RA4=23.39.129.214|RA4=23.39.141.40|RA4=23.39.175.115|RA4=23.39.192.204|RA4=23.39.200.207|RA4=23.39.249.2|RA4=23.40.4.243|RA4=23.40.11.66|RA4=23.40.16.53|RA4=23.40.16.100|RA4=23.40.17.81|RA4=23.40.25.95|RA4=23.40.29.157|RA4=23.40.54.167|RA4=23.40.61.98|RA4=23.40.72.12|RA4=23.40.91.16|RA4=23.40.115.100|RA4=23.40.115.102|RA4=23.40.117.130|RA4=23.40.123.162|RA4=23.40.130.144|RA4=23.40.136.141|RA4=23.40.136.225|RA4=23.40.136.244|RA4=23.40.137.123|RA4=23.40.146.248|RA4=23.40.165.203|RA4=23.40.167.170|RA4=23.40.189.42|RA4=23.40.216.228|RA4=23.40.219.124|RA4=23.40.225.44|RA4=23.40.230.208|RA4=23.40.245.244|RA4=23.40.247.147|RA4=23.40.251.237|RA4=23.41.3.129|RA4=23.41.4.50|RA4=23.41.20.157|RA4=23.41.23.250|RA4=23.41.27.164|RA4=23.41.27.189|RA4=23.41.37.234|RA4=23.41.51.106|RA4=23.41.51.141|RA4=23.41.53.103|RA4=23.41.55.28|RA4=23.41.60.48|RA4=23.41.70.238|RA4=23.41.73.243|RA4=23.41.74.73|RA4=23.41.87.99|RA4=23.41.97.162|RA4=23.41.100.59|RA4=23.41.106.89|RA4=23.41.132.123|RA4=23.41.138.38|RA4=23.41.138.224|RA4=23.41.150.85|RA4=23.41.151.59|RA4=23.41.155.237|RA4=23.41.173.57|RA4=23.42.25.19|RA4=23.42.25.240|RA4=23.42.27.58|RA4=23.42.29.231|RA4=23.42.43.55|RA4=23.42.49.171|RA4=23.42.68.132|RA4=23.42.77.64|RA4=23.42.82.136|RA4=23.42.104.42|RA4=23.42.136.12|RA4=23.42.148.128|RA4=23.42.155.83|RA4=23.42.178.175|RA4=23.42.207.200|RA4=23.42.208.196|RA4=23.42.223.144|RA4=23.42.233.16|RA4=23.43.0.180|RA4=23.43.2.164|RA4=23.43.6.161|RA4=23.43.7.8|RA4=23.43.8.36|RA4=23.43.9.202|RA4=23.43.10.35|RA4=23.43.24.17|RA4=23.43.31.221|RA4=23.43.36.49|RA4=23.43.39.4|RA4=23.43.55.70|RA4=23.43.57.137|RA4=23.43.94.236|RA4=23.43.118.242|RA4=23.43.120.38|RA4=23.43.120.82|RA4=23.43.120.141|RA4=23.43.120.186|RA4=23.43.124.124|RA4=23.43.133.207|RA4=23.43.134.238|RA4=23.43.138.73|RA4=23.43.181.207|RA4=23.43.208.23|RA4=23.43.214.232|RA4=23.43.221.36|RA4=23.43.246.238|RA4=23.43.250.73|RA4=23.44.2.208|RA4=23.44.11.183|RA4=23.44.101.180|RA4=23.44.104.95|RA4=23.44.104.195|RA4=23.44.105.68|RA4=23.44.109.171|RA4=23.44.145.122|RA4=23.44.160.15|RA4=23.44.160.39|RA4=23.44.166.238|RA4=23.44.169.4|RA4=23.44.170.73|RA4=23.44.170.216|RA4=23.44.176.87|RA4=23.44.184.218|RA4=23.44.192.81|RA4=23.44.207.153|RA4=23.44.217.237|RA4=23.44.231.181|RA4=23.44.234.67|RA4=23.45.103.95|RA4=23.45.106.144|RA4=23.45.108.39|RA4=23.45.132.86|RA4=23.45.132.186|RA4=23.45.133.40|RA4=23.45.135.154|RA4=23.45.139.189|RA4=23.45.196.18|RA4=23.45.196.50|RA4=23.45.196.86|RA4=23.223.5.185|RA4=23.223.18.92|RA4=23.223.21.92|RA4=23.223.27.202|RA4=23.223.29.38|RA4=23.223.32.33|RA4=23.223.36.189|RA4=23.223.41.92|RA4=23.223.63.37|RA4=23.223.66.153|RA4=23.223.91.235|RA4=23.223.117.195|RA4=23.223.215.115|RA4=23.223.217.2|RA4=23.223.223.39|RA4=23.223.229.146|RA4=23.223.232.171|RA4=23.223.233.76|RA4=23.223.236.240|RA4=23.246.226.98|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-16|""
""{2862795C-C80E-4033-B5BE-DFC1A747F88E}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=23.5.35.122|RA4=23.5.45.70|RA4=23.5.60.131|RA4=23.5.123.247|RA4=23.5.153.63|RA4=23.5.165.147|RA4=23.5.165.155|RA4=23.5.165.156|RA4=23.5.165.189|RA4=23.5.165.196|RA4=23.5.173.50|RA4=23.5.173.182|RA4=23.5.173.238|RA4=23.5.215.233|RA4=23.5.241.70|RA4=23.6.21.207|RA4=23.6.37.138|RA4=23.6.72.12|RA4=23.6.112.80|RA4=23.6.112.82|RA4=23.6.112.90|RA4=23.6.112.91|RA4=23.6.112.121|RA4=23.6.112.144|RA4=23.6.116.84|RA4=23.6.117.40|RA4=23.6.118.132|RA4=23.6.123.200|RA4=23.6.170.177|RA4=23.6.171.155|RA4=23.6.175.9|RA4=23.6.229.71|RA4=23.6.237.237|RA4=23.45.9.55|RA4=23.45.25.63|RA4=23.45.35.20|RA4=23.45.42.129|RA4=23.45.45.252|RA4=23.45.70.161|RA4=23.45.74.161|RA4=23.45.75.22|RA4=23.45.86.161|RA4=23.45.90.161|RA4=23.45.96.63|RA4=23.45.197.8|RA4=23.45.203.20|RA4=23.46.27.142|RA4=23.46.88.161|RA4=23.46.92.206|RA4=23.46.103.6|RA4=23.46.117.67|RA4=23.46.134.238|RA4=23.46.138.73|RA4=23.46.149.62|RA4=23.46.157.14|RA4=23.46.167.118|RA4=23.46.170.141|RA4=23.46.181.167|RA4=23.46.196.106|RA4=23.46.210.128|RA4=23.46.212.63|RA4=23.46.247.176|RA4=23.47.35.191|RA4=23.47.53.210|RA4=23.47.87.76|RA4=23.47.102.238|RA4=23.47.106.73|RA4=23.47.137.63|RA4=23.47.182.238|RA4=23.47.186.73|RA4=23.47.226.165|RA4=23.47.233.145|RA4=23.48.6.115|RA4=23.48.26.161|RA4=23.48.29.132|RA4=23.48.41.63|RA4=23.48.56.36|RA4=23.48.59.88|RA4=23.48.67.74|RA4=23.48.67.86|RA4=23.48.74.239|RA4=23.48.88.129|RA4=23.48.88.193|RA4=23.48.118.219|RA4=23.48.128.228|RA4=23.48.132.101|RA4=23.48.156.22|RA4=23.48.156.71|RA4=23.48.185.217|RA4=23.48.196.172|RA4=23.48.212.44|RA4=23.48.241.32|RA4=23.48.251.83|RA4=23.49.3.57|RA4=23.49.10.161|RA4=23.49.10.236|RA4=23.49.12.174|RA4=23.49.14.226|RA4=23.49.24.132|RA4=23.49.52.100|RA4=23.49.72.239|RA4=23.49.112.128|RA4=23.49.120.99|RA4=23.49.120.170|RA4=23.49.124.191|RA4=23.49.146.44|RA4=23.49.148.225|RA4=23.49.152.217|RA4=23.49.216.33|RA4=23.49.233.113|RA4=23.49.241.115|RA4=23.49.242.26|RA4=23.49.243.223|RA4=23.49.251.68|RA4=23.50.25.63|RA4=23.50.74.40|RA4=23.50.75.189|RA4=23.50.83.164|RA4=23.50.91.45|RA4=23.50.128.146|RA4=23.50.135.221|RA4=23.50.140.237|RA4=23.50.149.164|RA4=23.50.156.142|RA4=23.50.164.203|RA4=23.50.168.107|RA4=23.50.183.59|RA4=23.50.188.16|RA4=23.50.209.213|RA4=23.50.218.182|RA4=23.51.32.188|RA4=23.51.33.20|RA4=23.51.37.209|RA4=23.51.38.105|RA4=23.51.54.73|RA4=23.51.59.131|RA4=23.51.61.63|RA4=23.51.74.204|RA4=23.51.76.46|RA4=23.51.129.244|RA4=23.51.131.20|RA4=23.51.136.229|RA4=23.51.137.102|RA4=23.51.138.137|RA4=23.51.140.25|RA4=23.51.141.134|RA4=23.51.148.111|RA4=23.51.153.124|RA4=23.51.182.238|RA4=23.51.186.73|RA4=23.51.192.13|RA4=23.51.195.189|RA4=23.51.200.28|RA4=23.51.210.63|RA4=23.51.218.222|RA4=23.51.225.122|RA4=23.51.240.221|RA4=23.52.6.235|RA4=23.52.12.21|RA4=23.52.20.175|RA4=23.52.42.161|RA4=23.52.61.205|RA4=23.52.144.182|RA4=23.52.153.228|RA4=23.52.160.99|RA4=23.52.161.81|RA4=23.52.179.241|RA4=23.52.197.146|RA4=23.52.202.76|RA4=23.52.215.81|RA4=23.52.217.118|RA4=23.53.1.206|RA4=23.53.1.246|RA4=23.53.2.62|RA4=23.53.4.93|RA4=23.53.6.221|RA4=23.53.33.20|RA4=23.53.33.225|RA4=23.53.35.46|RA4=23.53.40.227|RA4=23.53.48.169|RA4=23.53.52.155|RA4=23.53.61.119|RA4=23.53.67.92|RA4=23.53.81.233|RA4=23.53.82.18|RA4=23.53.85.14|RA4=23.53.87.242|RA4=23.53.88.13|RA4=23.53.89.54|RA4=23.53.109.88|RA4=23.53.112.17|RA4=23.53.120.200|RA4=23.53.122.91|RA4=23.53.144.107|RA4=23.53.146.5|RA4=23.53.176.58|RA4=23.53.178.150|RA4=23.53.186.244|RA4=23.53.200.12|RA4=23.53.209.189|RA4=23.53.212.162|RA4=23.53.213.126|RA4=23.53.225.35|RA4=23.53.225.64|RA4=23.54.3.247|RA4=23.54.8.240|RA4=23.54.18.27|RA4=23.54.18.67|RA4=23.54.98.5|RA4=23.54.132.213|RA4=23.54.134.114|RA4=23.54.148.10|RA4=23.54.155.43|RA4=23.54.185.159|RA4=23.54.205.138|RA4=23.54.216.12|RA4=23.54.226.236|RA4=23.54.227.37|RA4=23.54.237.151|RA4=23.54.237.190|RA4=23.54.242.97|RA4=23.54.246.238|RA4=23.54.249.39|RA4=23.54.250.73|RA4=23.54.253.175|RA4=23.55.11.9|RA4=23.55.59.169|RA4=23.55.102.238|RA4=23.55.125.3|RA4=23.55.137.112|RA4=23.55.143.21|RA4=23.55.181.186|RA4=23.55.218.29|RA4=23.55.221.171|RA4=23.55.232.96|RA4=23.55.246.159|RA4=23.55.247.156|RA4=23.56.2.95|RA4=23.56.66.4|RA4=23.56.75.168|RA4=23.56.82.248|RA4=23.56.90.4|RA4=23.56.96.231|RA4=23.56.101.23|RA4=23.56.136.159|RA4=23.56.166.238|RA4=23.56.170.73|RA4=23.56.171.190|RA4=23.56.177.222|RA4=23.56.182.198|RA4=23.56.184.7|RA4=23.56.184.224|RA4=23.56.203.122|RA4=23.56.214.229|RA4=23.56.221.210|RA4=23.56.230.238|RA4=23.56.234.73|RA4=23.57.10.129|RA4=23.57.12.140|RA4=23.57.16.192|RA4=23.57.19.92|RA4=23.57.20.7|RA4=23.57.21.156|RA4=23.57.27.192|RA4=23.57.31.37|RA4=23.57.33.175|RA4=23.57.38.211|RA4=23.57.50.36|RA4=23.57.61.64|RA4=23.57.87.4|RA4=23.57.87.16|RA4=23.57.92.234|RA4=23.57.99.185|RA4=23.57.102.34|RA4=23.57.103.113|RA4=23.57.103.205|RA4=23.57.118.215|RA4=23.57.119.51|RA4=23.57.122.161|RA4=23.57.129.133|RA4=23.57.136.62|RA4=23.57.149.105|RA4=23.57.155.109|RA4=23.57.167.201|RA4=23.57.169.79|RA4=23.57.254.203|RA4=23.58.17.111|RA4=23.58.17.179|RA4=23.58.37.120|RA4=23.58.37.125|RA4=23.58.87.140|RA4=23.58.92.142|RA4=23.58.158.116|RA4=23.58.183.66|RA4=23.58.194.173|RA4=23.58.197.144|RA4=23.58.225.131|RA4=23.58.236.138|RA4=23.58.237.87|RA4=23.59.86.199|RA4=23.59.89.33|RA4=23.59.91.71|RA4=23.59.117.94|RA4=23.59.119.111|RA4=23.59.153.63|RA4=23.59.166.238|RA4=23.59.170.73|RA4=23.59.178.161|RA4=23.59.189.81|RA4=23.59.189.83|RA4=23.59.189.89|RA4=23.59.189.99|RA4=23.59.189.105|RA4=23.59.189.106|RA4=23.59.190.105|RA4=23.59.190.107|RA4=23.59.190.113|RA4=23.59.190.114|RA4=23.59.190.120|RA4=23.59.190.122|RA4=23.59.197.207|RA4=23.59.211.141|RA4=23.59.217.97|RA4=23.59.246.253|RA4=23.60.2.32|RA4=23.60.8.101|RA4=23.60.9.204|RA4=23.60.10.218|RA4=23.60.20.13|RA4=23.60.69.6|RA4=23.60.73.51|RA4=23.60.73.246|RA4=23.60.93.164|RA4=23.60.100.186|RA4=23.60.101.7|RA4=23.60.109.46|RA4=23.60.196.47|RA4=23.60.200.33|RA4=23.60.200.133|RA4=23.60.213.10|RA4=23.60.252.155|RA4=23.61.13.59|RA4=23.61.63.88|RA4=23.61.66.219|RA4=23.61.72.182|RA4=23.61.96.216|RA4=23.61.182.191|RA4=23.61.194.8|RA4=23.61.194.10|RA4=23.61.194.18|RA4=23.61.194.32|RA4=23.61.194.48|RA4=23.61.194.51|RA4=23.61.194.58|RA4=23.61.194.187|RA4=23.61.194.194|RA4=23.61.194.209|RA4=23.61.194.232|RA4=23.61.194.235|RA4=23.61.194.248|RA4=23.61.210.136|RA4=23.61.217.63|RA4=23.61.230.238|RA4=23.61.234.73|RA4=23.61.242.161|RA4=23.61.248.66|RA4=23.61.248.81|RA4=23.61.248.97|RA4=23.61.248.99|RA4=23.61.248.105|RA4=23.61.248.106|RA4=23.61.248.113|RA4=23.61.249.16|RA4=23.61.249.26|RA4=23.61.249.136|RA4=23.61.249.138|RA4=23.61.249.146|RA4=23.61.249.152|RA4=23.61.251.10|RA4=23.61.251.11|RA4=23.61.251.98|RA4=23.61.255.210|RA4=23.61.255.216|RA4=23.61.255.235|RA4=23.61.255.240|RA4=23.62.6.49|RA4=23.62.6.64|RA4=23.62.6.65|RA4=23.62.6.66|RA4=23.62.6.75|RA4=23.62.6.83|RA4=23.62.6.91|RA4=23.62.6.98|RA4=23.62.6.106|RA4=23.62.6.138|RA4=23.62.6.162|RA4=23.62.6.178|RA4=23.62.7.35|RA4=23.62.7.40|RA4=23.62.7.51|RA4=23.62.7.57|RA4=23.62.61.57|RA4=23.62.61.63|RA4=23.62.61.79|RA4=23.62.61.81|RA4=23.62.61.102|RA4=23.62.97.65|RA4=23.62.97.67|RA4=23.62.97.72|RA4=23.62.97.75|RA4=23.62.99.35|RA4=23.62.99.40|RA4=23.62.99.43|RA4=23.62.99.139|RA4=23.62.99.152|RA4=23.62.102.105|RA4=23.62.109.11|RA4=23.62.109.17|RA4=23.62.109.19|RA4=23.62.109.74|RA4=23.62.109.134|RA4=23.62.109.143|RA4=23.62.109.144|RA4=23.62.109.145|RA4=23.62.146.125|RA4=23.62.168.12|RA4=23.62.180.182|RA4=23.62.200.12|RA4=23.62.209.121|RA4=23.62.213.41|RA4=23.62.236.16|RA4=23.62.236.18|RA4=23.62.236.113|RA4=23.62.236.130|RA4=23.62.236.136|RA4=23.62.236.138|RA4=23.62.236.139|RA4=23.62.236.144|RA4=23.62.236.169|RA4=23.62.236.176|RA4=23.62.236.187|RA4=23.62.237.14|RA4=23.62.237.15|RA4=23.62.237.24|RA4=23.62.237.87|RA4=23.62.237.88|RA4=23.62.237.89|RA4=23.62.237.94|RA4=23.62.237.95|RA4=23.62.237.97|RA4=23.62.239.16|RA4=23.62.239.18|RA4=23.62.249.10|RA4=23.63.17.149|RA4=23.63.67.154|RA4=23.63.82.20|RA4=23.63.85.78|RA4=23.63.89.45|RA4=23.63.98.19|RA4=23.63.98.25|RA4=23.63.99.136|RA4=23.63.99.145|RA4=23.63.99.147|RA4=23.63.99.160|RA4=23.63.99.178|RA4=23.63.108.220|RA4=23.63.110.207|RA4=23.63.112.221|RA4=23.63.115.44|RA4=23.63.119.32|RA4=23.63.119.134|RA4=23.63.120.119|RA4=23.63.126.124|RA4=23.63.126.191|RA4=23.63.127.75|RA4=23.63.129.214|RA4=23.63.151.14|RA4=23.63.152.116|RA4=23.63.154.220|RA4=23.63.166.98|RA4=23.63.180.199|RA4=23.63.186.41|RA4=23.63.186.125|RA4=23.63.195.36|RA4=23.63.203.83|RA4=23.63.209.180|RA4=23.63.213.93|RA4=23.63.225.102|RA4=23.63.227.139|RA4=23.63.227.145|RA4=23.63.227.176|RA4=23.63.227.178|RA4=23.63.227.179|RA4=23.63.227.193|RA4=23.63.228.11|RA4=23.63.231.199|RA4=23.63.234.157|RA4=23.63.236.48|RA4=23.63.246.144|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-17|""
""{60391C47-1261-4617-9F69-245049A2F433}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=23.7.5.237|RA4=23.7.11.83|RA4=23.7.20.166|RA4=23.7.22.121|RA4=23.7.23.194|RA4=23.7.31.208|RA4=23.7.39.204|RA4=23.7.40.237|RA4=23.7.41.52|RA4=23.7.50.39|RA4=23.7.50.235|RA4=23.7.71.188|RA4=23.7.75.57|RA4=23.7.118.238|RA4=23.7.122.73|RA4=23.7.128.208|RA4=23.7.129.178|RA4=23.7.135.163|RA4=23.7.153.37|RA4=23.7.181.187|RA4=23.7.186.64|RA4=23.7.193.15|RA4=23.7.194.57|RA4=23.7.207.207|RA4=23.7.215.245|RA4=23.7.245.58|RA4=23.7.245.65|RA4=23.7.245.72|RA4=23.7.245.74|RA4=23.8.1.32|RA4=23.8.10.79|RA4=23.8.153.65|RA4=23.63.99.193|RA4=23.63.99.208|RA4=23.63.99.216|RA4=23.63.99.218|RA4=23.63.99.227|RA4=23.63.99.232|RA4=23.63.99.240|RA4=23.63.99.243|RA4=23.64.15.19|RA4=23.64.15.26|RA4=23.64.15.27|RA4=23.64.15.35|RA4=23.64.15.40|RA4=23.64.17.64|RA4=23.64.22.207|RA4=23.64.24.122|RA4=23.64.33.207|RA4=23.64.43.81|RA4=23.64.43.230|RA4=23.64.124.23|RA4=23.64.126.81|RA4=23.64.152.92|RA4=23.64.154.9|RA4=23.64.216.56|RA4=23.64.223.31|RA4=23.64.224.206|RA4=23.64.225.36|RA4=23.64.227.117|RA4=23.64.231.20|RA4=23.64.232.165|RA4=23.64.233.163|RA4=23.64.245.203|RA4=23.64.248.139|RA4=23.65.0.89|RA4=23.65.5.177|RA4=23.65.8.214|RA4=23.65.29.24|RA4=23.65.29.43|RA4=23.65.29.50|RA4=23.65.29.64|RA4=23.65.29.73|RA4=23.65.37.128|RA4=23.65.40.11|RA4=23.65.41.41|RA4=23.65.53.133|RA4=23.65.61.252|RA4=23.65.86.238|RA4=23.65.90.73|RA4=23.65.90.133|RA4=23.65.92.177|RA4=23.65.109.136|RA4=23.65.118.161|RA4=23.65.118.242|RA4=23.65.119.12|RA4=23.65.188.80|RA4=23.65.188.82|RA4=23.65.188.83|RA4=23.65.188.90|RA4=23.65.188.91|RA4=23.65.192.39|RA4=23.65.195.90|RA4=23.65.197.172|RA4=23.65.200.12|RA4=23.65.211.90|RA4=23.65.213.172|RA4=23.65.216.12|RA4=23.65.228.151|RA4=23.65.231.233|RA4=23.66.3.40|RA4=23.66.5.88|RA4=23.66.6.199|RA4=23.66.24.12|RA4=23.66.32.39|RA4=23.66.35.90|RA4=23.66.37.172|RA4=23.66.40.12|RA4=23.66.43.34|RA4=23.66.56.12|RA4=23.66.72.12|RA4=23.66.81.61|RA4=23.66.90.18|RA4=23.66.90.226|RA4=23.66.97.230|RA4=23.66.100.220|RA4=23.66.114.152|RA4=23.66.115.116|RA4=23.66.121.37|RA4=23.66.123.175|RA4=23.66.136.12|RA4=23.66.149.7|RA4=23.66.166.236|RA4=23.66.187.88|RA4=23.66.194.136|RA4=23.66.198.54|RA4=23.66.207.127|RA4=23.66.213.207|RA4=23.66.230.9|RA4=23.66.230.51|RA4=23.67.6.173|RA4=23.67.53.105|RA4=23.67.53.106|RA4=23.67.53.112|RA4=23.67.53.113|RA4=23.67.53.114|RA4=23.67.60.59|RA4=23.67.60.98|RA4=23.67.60.104|RA4=23.67.60.107|RA4=23.67.61.152|RA4=23.67.61.178|RA4=23.67.61.184|RA4=23.67.61.200|RA4=23.67.86.10|RA4=23.67.119.58|RA4=23.67.128.109|RA4=23.67.138.132|RA4=23.67.139.33|RA4=23.67.159.177|RA4=23.67.182.238|RA4=23.67.186.73|RA4=23.67.199.248|RA4=23.67.203.56|RA4=23.67.205.166|RA4=23.67.212.132|RA4=23.67.230.203|RA4=23.67.241.197|RA4=23.67.243.66|RA4=23.67.243.74|RA4=23.67.243.75|RA4=23.67.243.81|RA4=23.67.243.83|RA4=23.67.243.91|RA4=23.67.244.107|RA4=23.67.244.112|RA4=23.67.246.10|RA4=23.67.246.19|RA4=23.67.246.48|RA4=23.67.246.50|RA4=23.67.246.82|RA4=23.67.246.90|RA4=23.67.246.96|RA4=23.67.246.106|RA4=23.67.246.121|RA4=23.67.247.136|RA4=23.67.247.144|RA4=23.67.247.194|RA4=23.67.247.196|RA4=23.67.250.97|RA4=23.67.250.98|RA4=23.67.250.106|RA4=23.67.250.113|RA4=23.67.250.115|RA4=23.67.250.123|RA4=23.67.250.137|RA4=23.67.252.32|RA4=23.67.252.33|RA4=23.67.255.202|RA4=23.67.255.203|RA4=23.67.255.208|RA4=23.72.16.243|RA4=23.72.24.217|RA4=23.72.25.240|RA4=23.72.38.96|RA4=23.72.38.98|RA4=23.72.38.104|RA4=23.72.38.105|RA4=23.72.38.106|RA4=23.72.38.114|RA4=23.72.46.65|RA4=23.72.55.74|RA4=23.72.60.161|RA4=23.72.65.41|RA4=23.72.73.14|RA4=23.72.89.147|RA4=23.72.94.17|RA4=23.72.94.19|RA4=23.72.94.27|RA4=23.72.94.33|RA4=23.72.106.140|RA4=23.72.109.254|RA4=23.72.118.182|RA4=23.72.136.113|RA4=23.72.136.129|RA4=23.72.136.130|RA4=23.72.136.153|RA4=23.72.137.40|RA4=23.72.137.50|RA4=23.72.137.58|RA4=23.72.137.65|RA4=23.72.137.83|RA4=23.72.137.90|RA4=23.72.138.78|RA4=23.72.147.184|RA4=23.72.154.168|RA4=23.72.160.206|RA4=23.72.165.77|RA4=23.72.165.181|RA4=23.72.180.11|RA4=23.72.180.16|RA4=23.72.180.17|RA4=23.72.180.19|RA4=23.72.183.238|RA4=23.72.202.156|RA4=23.72.210.96|RA4=23.72.212.80|RA4=23.72.214.53|RA4=23.72.224.121|RA4=23.72.224.126|RA4=23.72.224.127|RA4=23.72.224.129|RA4=23.72.224.192|RA4=23.72.224.210|RA4=23.72.224.211|RA4=23.72.225.59|RA4=23.72.225.83|RA4=23.72.225.88|RA4=23.72.245.45|RA4=23.73.6.104|RA4=23.73.9.166|RA4=23.73.30.154|RA4=23.73.34.97|RA4=23.73.38.224|RA4=23.73.65.87|RA4=23.73.75.68|RA4=23.73.83.3|RA4=23.73.85.10|RA4=23.73.102.247|RA4=23.73.103.112|RA4=23.73.119.25|RA4=23.73.129.25|RA4=23.73.130.15|RA4=23.73.136.131|RA4=23.73.144.123|RA4=23.73.146.131|RA4=23.73.148.246|RA4=23.73.150.168|RA4=23.73.154.67|RA4=23.73.155.25|RA4=23.73.169.136|RA4=23.73.181.56|RA4=23.73.181.57|RA4=23.73.181.59|RA4=23.73.181.65|RA4=23.73.181.66|RA4=23.73.182.128|RA4=23.73.185.168|RA4=23.73.192.81|RA4=23.73.195.193|RA4=23.73.253.54|RA4=23.74.8.89|RA4=23.74.8.97|RA4=23.74.8.98|RA4=23.74.8.104|RA4=23.74.8.105|RA4=23.74.8.106|RA4=23.74.8.210|RA4=23.74.8.216|RA4=23.74.8.224|RA4=23.74.9.80|RA4=23.74.9.152|RA4=23.74.9.161|RA4=23.74.9.185|RA4=23.74.16.21|RA4=23.74.28.9|RA4=23.74.28.11|RA4=23.74.28.19|RA4=23.74.28.24|RA4=23.74.28.25|RA4=23.74.28.40|RA4=23.74.38.231|RA4=23.74.42.226|RA4=23.74.57.63|RA4=23.74.59.91|RA4=23.74.70.238|RA4=23.74.74.73|RA4=23.74.85.207|RA4=23.74.86.238|RA4=23.74.90.73|RA4=23.74.97.243|RA4=23.74.103.104|RA4=23.74.114.136|RA4=23.74.121.63|RA4=23.74.144.198|RA4=23.74.166.161|RA4=23.74.171.10|RA4=23.74.172.149|RA4=23.74.175.36|RA4=23.74.185.63|RA4=23.74.190.252|RA4=23.74.198.238|RA4=23.74.202.73|RA4=23.74.203.96|RA4=23.74.207.118|RA4=23.74.209.230|RA4=23.74.222.31|RA4=23.74.223.25|RA4=23.74.224.230|RA4=23.74.226.12|RA4=23.74.230.68|RA4=23.75.23.17|RA4=23.75.23.66|RA4=23.75.23.161|RA4=23.75.23.162|RA4=23.75.23.163|RA4=23.75.23.170|RA4=23.75.23.176|RA4=23.75.31.65|RA4=23.75.31.185|RA4=23.75.38.240|RA4=23.75.43.88|RA4=23.75.59.156|RA4=23.75.64.10|RA4=23.75.66.184|RA4=23.75.97.251|RA4=23.75.130.47|RA4=23.75.131.77|RA4=23.75.182.151|RA4=23.75.188.48|RA4=23.75.188.242|RA4=23.75.202.75|RA4=23.75.210.161|RA4=23.75.214.161|RA4=23.75.225.198|RA4=23.75.233.120|RA4=23.76.42.62|RA4=23.76.66.230|RA4=23.76.102.161|RA4=23.76.115.135|RA4=23.76.128.56|RA4=23.76.144.173|RA4=23.76.148.41|RA4=23.76.150.123|RA4=23.76.153.42|RA4=23.76.153.48|RA4=23.76.153.57|RA4=23.76.153.58|RA4=23.76.153.65|RA4=23.76.161.44|RA4=23.76.192.10|RA4=23.76.194.54|RA4=23.76.204.8|RA4=23.76.204.16|RA4=23.76.204.25|RA4=23.76.204.27|RA4=23.76.204.32|RA4=23.76.204.33|RA4=23.76.204.58|RA4=23.76.204.74|RA4=23.76.204.75|RA4=23.76.204.80|RA4=23.76.204.105|RA4=23.76.204.114|RA4=23.76.204.122|RA4=23.76.204.123|RA4=23.76.204.129|RA4=23.76.204.138|RA4=23.76.204.139|RA4=23.76.204.144|RA4=23.76.204.145|RA4=23.76.223.190|RA4=23.77.5.43|RA4=23.77.9.63|RA4=23.77.16.22|RA4=23.77.18.252|RA4=23.77.22.238|RA4=23.77.26.73|RA4=23.77.44.191|RA4=23.77.62.92|RA4=23.77.65.3|RA4=23.77.66.177|RA4=23.77.72.26|RA4=23.77.95.74|RA4=23.77.164.227|RA4=23.77.169.110|RA4=23.77.179.99|RA4=23.77.182.105|RA4=23.77.183.169|RA4=23.77.184.65|RA4=23.77.197.232|RA4=23.77.198.194|RA4=23.77.202.104|RA4=23.77.202.112|RA4=23.77.214.102|RA4=23.77.232.89|RA4=23.77.232.107|RA4=23.77.232.147|RA4=23.77.232.155|RA4=23.77.232.162|RA4=23.77.232.170|RA4=23.77.236.152|RA4=23.77.236.154|RA4=23.77.236.155|RA4=23.77.236.160|RA4=23.77.236.161|RA4=23.77.237.50|RA4=23.77.250.161|RA4=23.78.32.34|RA4=23.78.34.16|RA4=23.78.35.142|RA4=23.78.39.67|RA4=23.78.53.200|RA4=23.78.70.16|RA4=23.78.73.63|RA4=23.78.82.44|RA4=23.78.82.137|RA4=23.78.84.127|RA4=23.78.86.117|RA4=23.78.92.167|RA4=23.78.92.210|RA4=23.78.98.227|RA4=23.78.107.90|RA4=23.78.112.208|RA4=23.78.112.225|RA4=23.78.116.82|RA4=23.78.120.12|RA4=23.78.122.153|RA4=23.78.127.225|RA4=23.78.137.78|RA4=23.78.139.109|RA4=23.78.140.58|RA4=23.78.152.79|RA4=23.78.163.32|RA4=23.78.163.217|RA4=23.78.178.136|RA4=23.78.185.63|RA4=23.78.198.238|RA4=23.78.202.73|RA4=23.78.210.161|RA4=23.78.218.211|RA4=23.78.219.19|RA4=23.78.221.82|RA4=23.78.221.88|RA4=23.78.222.97|RA4=23.78.222.99|RA4=23.78.222.105|RA4=23.78.222.107|RA4=23.78.222.112|RA4=23.78.223.169|RA4=23.78.223.179|RA4=23.78.230.190|RA4=23.78.231.159|RA4=23.78.233.63|RA4=23.78.246.2|RA4=23.78.248.125|RA4=23.78.249.35|RA4=23.78.252.253|RA4=23.79.1.164|RA4=23.79.2.112|RA4=23.79.4.218|RA4=23.79.46.161|RA4=23.79.69.202|RA4=23.79.73.188|RA4=23.79.84.194|RA4=23.79.112.62|RA4=23.79.115.184|RA4=23.79.138.51|RA4=23.79.145.110|RA4=23.79.154.38|RA4=23.79.156.234|RA4=23.79.193.32|RA4=23.79.194.112|RA4=23.79.202.153|RA4=23.79.206.73|RA4=23.79.207.198|RA4=23.79.209.88|RA4=23.79.216.94|RA4=23.79.216.133|RA4=23.79.216.241|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-18|""
""{474221DA-6C70-4EA4-A7BB-127138D4485D}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=4.23.32.253|RA4=4.23.36.253|RA4=4.23.38.254|RA4=4.23.43.125|RA4=4.23.44.126|RA4=4.23.47.126|RA4=4.23.50.252|RA4=4.23.54.254|RA4=4.23.55.254|RA4=4.23.59.253|RA4=4.23.61.126|RA4=4.23.62.126|RA4=4.26.226.126|RA4=4.26.227.126|RA4=4.26.228.254|RA4=4.26.231.254|RA4=4.26.232.126|RA4=4.26.233.254|RA4=4.26.235.254|RA4=4.26.236.126|RA4=4.26.246.126|RA4=4.26.247.126|RA4=4.26.251.126|RA4=4.26.251.254|RA4=4.26.252.126|RA4=4.26.252.254|RA4=4.26.253.126|RA4=4.27.1.252|RA4=4.27.3.254|RA4=4.27.4.126|RA4=4.27.4.254|RA4=4.27.5.126|RA4=4.27.6.252|RA4=4.27.7.126|RA4=4.27.8.126|RA4=4.27.15.126|RA4=4.27.16.126|RA4=4.27.16.254|RA4=4.27.17.126|RA4=4.27.18.126|RA4=4.27.18.254|RA4=4.27.19.126|RA4=4.27.24.253|RA4=4.27.25.125|RA4=4.27.28.126|RA4=4.27.28.254|RA4=4.27.248.254|RA4=4.27.249.126|RA4=4.27.252.254|RA4=4.27.253.126|RA4=4.27.253.253|RA4=4.27.254.254|RA4=23.8.2.145|RA4=23.8.3.243|RA4=23.8.5.157|RA4=23.8.8.185|RA4=23.8.8.249|RA4=23.8.19.246|RA4=23.8.20.223|RA4=23.8.65.38|RA4=23.8.83.157|RA4=23.8.161.134|RA4=23.8.169.125|RA4=23.8.169.245|RA4=23.8.192.140|RA4=23.8.203.125|RA4=23.8.211.49|RA4=23.8.211.90|RA4=23.8.218.107|RA4=23.8.251.30|RA4=23.8.253.237|RA4=23.9.5.92|RA4=23.9.22.238|RA4=23.9.35.191|RA4=23.9.57.61|RA4=23.9.62.26|RA4=23.9.68.166|RA4=23.9.76.43|RA4=23.9.86.238|RA4=23.9.90.73|RA4=23.9.101.207|RA4=23.9.102.238|RA4=23.9.106.73|RA4=23.9.113.174|RA4=23.9.119.105|RA4=23.9.140.17|RA4=23.9.163.239|RA4=23.9.165.129|RA4=23.9.168.29|RA4=23.9.170.73|RA4=23.9.198.90|RA4=23.9.213.242|RA4=23.9.214.240|RA4=23.9.217.71|RA4=23.96.37.133|RA4=23.96.187.76|RA4=23.99.10.11|RA4=23.99.98.228|RA4=23.99.125.126|RA4=24.101.16.9|RA4=24.101.16.17|RA4=24.101.16.35|RA4=24.101.16.43|RA4=24.101.16.49|RA4=24.139.136.8|RA4=24.139.136.16|RA4=24.139.136.40|RA4=24.139.136.41|RA4=24.139.136.42|RA4=24.143.205.24|RA4=24.143.205.33|RA4=24.143.205.42|RA4=24.143.205.43|RA4=24.143.205.56|RA4=24.143.205.58|RA4=24.143.205.66|RA4=24.143.205.74|RA4=24.143.205.91|RA4=24.143.205.96|RA4=24.143.205.97|RA4=24.143.205.98|RA4=24.143.205.104|RA4=24.143.205.107|RA4=24.143.205.112|RA4=24.143.205.136|RA4=24.143.205.144|RA4=24.143.205.153|RA4=24.143.205.176|RA4=24.143.206.50|RA4=24.143.206.56|RA4=24.143.206.67|RA4=24.143.206.90|RA4=24.143.206.193|RA4=24.143.206.202|RA4=24.143.206.211|RA4=24.143.206.224|RA4=24.143.206.227|RA4=24.156.130.201|RA4=24.156.130.203|RA4=24.200.120.8|RA4=24.200.120.17|RA4=24.200.120.48|RA4=24.200.120.66|RA4=24.200.120.96|RA4=24.200.120.99|RA4=24.200.120.112|RA4=24.200.120.113|RA4=24.200.120.115|RA4=24.200.120.130|RA4=24.200.239.136|RA4=24.200.239.137|RA4=24.200.239.144|RA4=24.200.239.154|RA4=24.200.239.170|RA4=24.200.239.176|RA4=24.200.239.186|RA4=24.200.239.192|RA4=24.200.239.210|RA4=24.244.18.10|RA4=24.244.18.16|RA4=24.244.18.115|RA4=24.244.18.121|RA4=24.244.18.122|RA4=24.244.53.8|RA4=24.244.53.10|RA4=24.244.53.16|RA4=24.244.53.17|RA4=24.244.53.24|RA4=24.244.53.26|RA4=27.109.0.72|RA4=27.109.0.74|RA4=31.13.64.2|RA4=31.13.65.2|RA4=31.13.66.2|RA4=31.13.67.2|RA4=31.13.67.6|RA4=31.13.68.2|RA4=31.13.69.193|RA4=31.13.70.2|RA4=31.13.71.2|RA4=31.13.72.2|RA4=31.13.73.2|RA4=31.13.74.2|RA4=31.13.75.2|RA4=31.13.76.98|RA4=31.13.77.2|RA4=31.13.78.3|RA4=31.13.79.242|RA4=31.13.80.2|RA4=31.13.81.2|RA4=31.13.82.2|RA4=31.13.83.1|RA4=31.13.84.1|RA4=31.13.85.1|RA4=31.13.86.1|RA4=31.13.87.8|RA4=31.13.90.9|RA4=31.13.91.9|RA4=31.13.92.2|RA4=31.13.93.10|RA4=31.13.95.2|RA4=31.221.26.40|RA4=31.221.26.41|RA4=31.221.26.43|RA4=31.221.26.48|RA4=31.221.26.49|RA4=37.29.19.80|RA4=37.29.19.81|RA4=37.29.19.82|RA4=37.29.19.83|RA4=37.29.19.89|RA4=37.29.19.90|RA4=37.29.19.96|RA4=37.29.19.98|RA4=37.29.19.105|RA4=37.60.17.40|RA4=37.60.17.42|RA4=37.60.17.48|RA4=37.60.17.58|RA4=37.60.17.61|RA4=37.110.193.136|RA4=37.110.193.137|RA4=37.110.193.147|RA4=37.110.193.152|RA4=37.110.193.161|RA4=37.252.162.1|RA4=37.252.162.11|RA4=37.252.162.13|RA4=37.252.162.14|RA4=37.252.162.17|RA4=37.252.162.18|RA4=37.252.162.19|RA4=37.252.162.20|RA4=37.252.162.21|RA4=37.252.162.22|RA4=37.252.162.23|RA4=37.252.162.24|RA4=37.252.162.25|RA4=37.252.162.27|RA4=37.252.162.28|RA4=37.252.162.31|RA4=37.252.162.45|RA4=37.252.162.62|RA4=37.252.162.92|RA4=37.252.162.97|RA4=37.252.162.100|RA4=37.252.162.104|RA4=37.252.162.106|RA4=37.252.162.107|RA4=37.252.162.125|RA4=37.252.162.142|RA4=37.252.162.154|RA4=37.252.162.157|RA4=37.252.162.158|RA4=37.252.162.188|RA4=37.252.162.225|RA4=37.252.162.228|RA4=37.252.162.229|RA4=37.252.163.18|RA4=37.252.163.143|RA4=37.252.163.144|RA4=37.252.163.145|RA4=37.252.163.146|RA4=37.252.163.169|RA4=37.252.163.174|RA4=37.252.163.178|RA4=37.252.163.179|RA4=37.252.163.182|RA4=37.252.170.71|RA4=37.252.170.80|RA4=37.252.170.81|RA4=37.252.170.82|RA4=37.252.170.140|RA4=37.252.170.141|RA4=37.252.170.142|RA4=37.252.170.151|RA4=37.252.170.152|RA4=37.252.170.153|RA4=37.252.170.154|RA4=37.252.170.155|RA4=37.252.170.156|RA4=37.252.170.157|RA4=37.252.170.158|RA4=37.252.170.159|RA4=37.252.170.160|RA4=37.252.170.161|RA4=37.252.170.162|RA4=37.252.170.163|RA4=37.252.170.164|RA4=37.252.170.165|RA4=37.252.170.175|RA4=37.252.170.176|RA4=37.252.170.180|RA4=37.252.170.181|RA4=37.252.170.182|RA4=37.252.172.12|RA4=37.252.172.27|RA4=37.252.172.39|RA4=37.252.172.40|RA4=37.252.172.42|RA4=37.252.172.53|RA4=37.252.172.70|RA4=37.252.172.80|RA4=37.252.172.100|RA4=37.252.172.180|RA4=37.252.172.197|RA4=37.252.172.205|RA4=37.252.172.207|RA4=37.252.172.208|RA4=37.252.172.211|RA4=37.252.172.232|RA4=37.252.173.11|RA4=37.252.173.14|RA4=40.70.220.248|RA4=40.70.221.249|RA4=40.77.134.24|RA4=40.77.226.124|RA4=40.77.226.192|RA4=40.77.226.249|RA4=40.77.226.250|RA4=40.77.228.92|RA4=40.84.199.233|RA4=40.96.0.114|RA4=40.96.24.146|RA4=40.96.32.34|RA4=40.97.104.2|RA4=40.97.108.2|RA4=40.97.112.66|RA4=40.97.113.2|RA4=40.97.113.162|RA4=40.97.113.178|RA4=40.97.114.130|RA4=40.97.116.82|RA4=40.97.117.50|RA4=40.97.117.242|RA4=40.97.118.162|RA4=40.97.119.162|RA4=40.97.119.178|RA4=40.97.119.194|RA4=40.100.2.82|RA4=40.100.2.98|RA4=40.100.2.114|RA4=40.100.17.18|RA4=40.100.20.18|RA4=40.100.28.178|RA4=40.100.29.2|RA4=40.100.29.18|RA4=40.100.29.194|RA4=40.100.29.210|RA4=40.100.48.66|RA4=40.100.48.82|RA4=40.100.48.98|RA4=40.100.49.2|RA4=40.100.49.18|RA4=40.100.49.34|RA4=40.100.54.2|RA4=40.100.54.34|RA4=40.100.54.194|RA4=40.100.54.210|RA4=40.100.144.146|RA4=40.100.144.226|RA4=40.100.144.242|RA4=40.100.145.162|RA4=40.100.162.18|RA4=40.100.162.178|RA4=40.100.172.242|RA4=40.100.173.18|RA4=40.100.173.194|RA4=40.100.174.34|RA4=40.100.174.194|RA4=40.100.174.210|RA4=40.101.4.2|RA4=40.101.4.18|RA4=40.101.6.34|RA4=40.101.6.242|RA4=40.101.7.2|RA4=40.101.7.178|RA4=40.101.7.194|RA4=40.101.8.162|RA4=40.101.9.178|RA4=40.101.11.178|RA4=40.101.12.2|RA4=40.101.12.18|RA4=40.101.12.34|RA4=40.101.12.50|RA4=40.101.12.66|RA4=40.101.12.82|RA4=40.101.12.98|RA4=40.101.12.130|RA4=40.101.18.18|RA4=40.101.18.34|RA4=40.101.18.226|RA4=40.101.18.242|RA4=40.101.19.162|RA4=40.101.28.178|RA4=40.101.28.194|RA4=40.101.30.18|RA4=40.101.30.226|RA4=40.101.30.242|RA4=40.101.31.130|RA4=40.101.40.210|RA4=40.101.40.226|RA4=40.101.40.242|RA4=40.101.41.162|RA4=40.101.42.66|RA4=40.101.42.82|RA4=40.101.43.162|RA4=40.101.43.178|RA4=40.101.43.194|RA4=40.101.43.242|RA4=40.101.44.178|RA4=40.101.45.82|RA4=40.101.45.242|RA4=40.101.46.18|RA4=40.101.46.34|RA4=40.101.46.178|RA4=40.101.46.210|RA4=40.101.48.66|RA4=40.101.48.82|RA4=40.101.49.66|RA4=40.101.49.82|RA4=40.101.49.98|RA4=40.101.50.194|RA4=40.101.50.210|RA4=40.101.51.114|RA4=40.101.51.130|RA4=40.101.51.162|RA4=40.101.51.178|RA4=40.101.51.194|RA4=40.101.51.210|RA4=40.101.52.146|RA4=40.101.53.242|RA4=40.101.54.2|RA4=40.101.54.162|RA4=40.101.54.178|RA4=40.101.55.50|RA4=40.101.55.98|RA4=40.101.55.114|RA4=40.101.55.130|RA4=40.101.55.146|RA4=40.101.55.162|RA4=40.101.55.194|RA4=40.101.55.210|RA4=40.101.60.2|RA4=40.101.60.18|RA4=40.101.60.226|RA4=40.101.61.114|RA4=40.101.61.130|RA4=40.101.62.34|RA4=40.101.65.130|RA4=40.101.65.146|RA4=40.101.65.162|RA4=40.101.65.194|RA4=40.101.65.210|RA4=40.101.69.2|RA4=40.101.69.34|RA4=40.101.69.210|RA4=40.101.70.2|RA4=40.101.70.194|RA4=40.101.72.114|RA4=40.101.72.130|RA4=40.101.72.146|RA4=40.101.72.162|RA4=40.101.72.178|RA4=40.101.72.194|RA4=40.101.72.210|RA4=40.101.72.226|RA4=40.101.73.146|RA4=40.101.73.162|RA4=40.101.76.114|RA4=40.101.76.130|RA4=40.101.76.146|RA4=40.101.76.162|RA4=40.101.77.82|RA4=40.101.77.98|RA4=40.101.80.2|RA4=40.101.80.194|RA4=40.101.84.2|RA4=40.101.84.18|RA4=40.101.88.2|RA4=40.101.88.178|RA4=40.101.96.18|RA4=40.101.121.34|RA4=40.101.124.2|RA4=40.101.124.18|RA4=40.101.124.34|RA4=40.101.124.194|RA4=40.101.124.210|RA4=40.101.125.2|RA4=40.101.125.18|RA4=40.101.125.34|RA4=40.101.125.194|RA4=40.101.125.210|RA4=40.101.126.114|RA4=40.101.126.194|RA4=40.101.126.210|RA4=40.101.127.82|RA4=40.101.127.98|RA4=40.121.50.251|RA4=40.127.139.224|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-19|""
""{DF983E19-D281-4F87-B2B2-22437741F819}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=5.22.191.200|RA4=5.22.191.201|RA4=5.22.191.203|RA4=5.22.191.216|RA4=5.22.191.225|RA4=5.22.191.232|RA4=5.32.9.10|RA4=5.32.9.16|RA4=5.32.9.18|RA4=5.32.9.19|RA4=5.32.9.25|RA4=5.32.9.27|RA4=5.32.9.33|RA4=5.32.9.34|RA4=5.178.43.48|RA4=5.178.43.50|RA4=5.178.43.72|RA4=5.178.43.89|RA4=5.178.43.105|RA4=40.97.28.114|RA4=40.97.31.50|RA4=40.97.48.98|RA4=40.97.49.18|RA4=40.97.49.178|RA4=40.97.49.194|RA4=40.97.51.66|RA4=40.97.80.2|RA4=40.97.85.114|RA4=40.97.119.82|RA4=40.97.120.50|RA4=40.97.120.146|RA4=40.97.121.18|RA4=40.97.124.2|RA4=40.97.124.18|RA4=40.97.124.210|RA4=40.97.124.226|RA4=40.97.125.114|RA4=40.97.125.130|RA4=40.97.126.18|RA4=40.97.126.178|RA4=40.97.126.194|RA4=40.97.126.210|RA4=40.97.127.130|RA4=40.97.128.194|RA4=40.97.128.210|RA4=40.97.128.226|RA4=40.97.129.130|RA4=40.97.130.34|RA4=40.97.130.210|RA4=40.97.132.34|RA4=40.97.132.194|RA4=40.97.132.226|RA4=40.97.133.114|RA4=40.97.133.146|RA4=40.97.134.18|RA4=40.97.134.50|RA4=40.97.134.178|RA4=40.97.134.194|RA4=40.97.134.210|RA4=40.97.135.114|RA4=40.97.135.146|RA4=40.97.136.194|RA4=40.97.136.210|RA4=40.97.137.114|RA4=40.97.137.130|RA4=40.97.137.146|RA4=40.97.138.66|RA4=40.97.138.210|RA4=40.97.138.242|RA4=40.97.139.146|RA4=40.97.140.34|RA4=40.97.142.2|RA4=40.97.142.194|RA4=40.97.143.130|RA4=40.97.143.146|RA4=40.97.144.50|RA4=40.97.144.226|RA4=40.97.144.242|RA4=40.97.148.50|RA4=40.97.148.226|RA4=40.97.149.146|RA4=40.97.149.162|RA4=40.97.153.146|RA4=40.97.154.66|RA4=40.97.154.82|RA4=40.97.155.178|RA4=40.97.156.98|RA4=40.97.157.50|RA4=40.97.158.178|RA4=40.97.159.66|RA4=40.97.160.2|RA4=40.97.160.178|RA4=40.97.161.34|RA4=40.97.162.114|RA4=40.97.164.146|RA4=40.97.166.34|RA4=40.97.166.162|RA4=40.97.170.178|RA4=40.97.180.18|RA4=40.97.185.2|RA4=41.128.128.16|RA4=41.128.128.26|RA4=41.168.9.217|RA4=41.168.9.218|RA4=41.168.9.219|RA4=41.168.9.233|RA4=41.168.9.234|RA4=41.181.158.73|RA4=41.181.158.75|RA4=41.181.158.80|RA4=41.181.158.81|RA4=41.187.113.9|RA4=41.187.113.11|RA4=41.187.113.17|RA4=41.187.113.19|RA4=41.190.142.8|RA4=41.190.142.10|RA4=41.190.142.18|RA4=41.190.142.19|RA4=41.193.163.11|RA4=41.193.163.16|RA4=41.193.163.17|RA4=41.193.163.26|RA4=41.193.163.27|RA4=41.193.163.34|RA4=41.193.163.40|RA4=41.206.97.62|RA4=41.206.97.126|RA4=41.231.245.8|RA4=41.231.245.49|RA4=41.231.245.50|RA4=41.231.245.59|RA4=41.231.245.73|RA4=41.231.245.96|RA4=41.231.245.105|RA4=41.231.245.121|RA4=41.231.245.122|RA4=41.231.245.123|RA4=42.99.128.146|RA4=42.99.128.152|RA4=42.99.128.153|RA4=42.99.128.160|RA4=42.99.128.168|RA4=42.99.128.171|RA4=42.99.128.177|RA4=42.99.254.136|RA4=42.99.254.144|RA4=42.99.254.146|RA4=42.99.254.152|RA4=42.99.254.160|RA4=43.241.31.138|RA4=43.241.31.139|RA4=45.64.21.8|RA4=45.64.21.18|RA4=45.64.21.24|RA4=45.64.21.32|RA4=46.33.68.8|RA4=46.33.68.14|RA4=46.33.68.15|RA4=46.33.68.23|RA4=46.33.68.33|RA4=46.33.68.47|RA4=46.33.68.65|RA4=46.33.68.73|RA4=46.33.68.105|RA4=46.33.68.121|RA4=46.33.68.128|RA4=46.33.68.135|RA4=46.33.76.11|RA4=46.33.76.24|RA4=46.33.76.33|RA4=46.33.76.42|RA4=46.33.76.57|RA4=46.40.191.8|RA4=46.40.191.10|RA4=46.40.191.16|RA4=46.40.191.18|RA4=46.40.191.24|RA4=46.97.13.182|RA4=46.97.13.184|RA4=46.238.98.232|RA4=46.238.98.233|RA4=46.238.98.240|RA4=46.238.98.241|RA4=46.238.98.248|RA4=47.73.196.49|RA4=47.73.196.58|RA4=47.73.196.98|RA4=47.73.196.99|RA4=47.73.196.129|RA4=47.73.196.138|RA4=49.231.61.16|RA4=49.231.61.49|RA4=50.58.123.8|RA4=50.58.123.10|RA4=50.58.123.16|RA4=50.58.123.19|RA4=50.58.123.25|RA4=50.58.123.32|RA4=50.58.123.33|RA4=50.58.123.35|RA4=50.58.243.137|RA4=50.58.243.139|RA4=50.58.243.145|RA4=50.58.243.152|RA4=50.58.243.154|RA4=50.58.243.155|RA4=50.58.243.160|RA4=50.58.243.161|RA4=50.58.243.162|RA4=50.58.243.163|RA4=50.97.57.90|RA4=52.0.160.123|RA4=52.0.208.23|RA4=52.0.227.108|RA4=52.0.240.225|RA4=52.1.34.182|RA4=52.1.39.195|RA4=52.1.117.74|RA4=52.1.139.119|RA4=52.1.158.104|RA4=52.1.165.238|RA4=52.1.185.113|RA4=52.1.207.71|RA4=52.2.114.55|RA4=52.3.158.163|RA4=52.3.163.149|RA4=52.3.184.2|RA4=52.3.220.136|RA4=52.4.21.185|RA4=52.4.143.127|RA4=52.4.153.199|RA4=52.4.185.198|RA4=52.5.10.243|RA4=52.5.137.184|RA4=52.5.166.226|RA4=52.5.212.183|RA4=52.5.232.239|RA4=52.6.2.79|RA4=52.6.18.63|RA4=52.6.89.185|RA4=52.6.106.47|RA4=52.6.150.192|RA4=52.6.197.147|RA4=52.7.37.8|RA4=52.7.74.36|RA4=52.7.234.53|RA4=52.7.245.233|RA4=52.19.220.58|RA4=52.20.15.32|RA4=52.20.33.203|RA4=52.20.46.192|RA4=52.20.48.91|RA4=52.20.105.82|RA4=52.20.122.8|RA4=52.20.160.61|RA4=52.21.46.243|RA4=52.21.50.3|RA4=52.21.77.36|RA4=52.21.101.227|RA4=52.21.246.50|RA4=52.22.92.33|RA4=52.22.92.99|RA4=52.22.105.195|RA4=52.22.131.209|RA4=52.22.145.228|RA4=52.22.152.163|RA4=52.22.154.229|RA4=52.22.169.254|RA4=52.22.193.118|RA4=52.22.229.73|RA4=52.22.231.49|RA4=52.71.53.135|RA4=52.71.121.239|RA4=52.71.183.118|RA4=52.71.195.55|RA4=52.72.111.230|RA4=52.72.142.24|RA4=52.72.162.179|RA4=52.72.192.118|RA4=52.72.242.187|RA4=52.74.91.103|RA4=52.161.109.232|RA4=52.162.161.12|RA4=52.169.118.173|RA4=52.178.38.151|RA4=52.178.167.109|RA4=52.178.178.16|RA4=52.178.214.202|RA4=52.183.47.176|RA4=52.183.114.173|RA4=52.183.118.171|RA4=52.220.81.2|RA4=52.229.39.152|RA4=54.66.189.220|RA4=54.77.78.77|RA4=54.84.94.119|RA4=54.84.127.53|RA4=54.84.157.247|RA4=54.84.228.154|RA4=54.84.232.73|RA4=54.85.15.171|RA4=54.85.44.18|RA4=54.88.73.215|RA4=54.88.80.214|RA4=54.88.103.126|RA4=54.88.233.79|RA4=54.88.247.252|RA4=54.152.5.21|RA4=54.152.69.239|RA4=54.152.240.142|RA4=54.152.254.46|RA4=54.164.46.147|RA4=54.164.184.209|RA4=54.164.191.77|RA4=54.164.222.108|RA4=54.165.106.92|RA4=54.165.163.35|RA4=54.169.5.5|RA4=54.169.105.230|RA4=54.172.14.36|RA4=54.172.34.25|RA4=54.172.206.15|RA4=54.175.96.138|RA4=54.200.75.96|RA4=54.208.68.82|RA4=54.209.103.239|RA4=54.209.119.153|RA4=54.209.130.157|RA4=54.209.193.47|RA4=54.210.47.225|RA4=54.210.84.159|RA4=54.210.113.103|RA4=54.210.134.34|RA4=54.210.184.57|RA4=54.210.190.248|RA4=54.210.211.127|RA4=54.236.94.251|RA4=54.236.155.212|RA4=54.236.220.59|RA4=54.254.136.2|RA4=58.26.1.104|RA4=58.26.1.106|RA4=58.26.1.113|RA4=58.26.1.128|RA4=58.26.1.130|RA4=58.26.1.131|RA4=58.26.185.27|RA4=58.26.185.32|RA4=58.26.185.64|RA4=58.26.185.66|RA4=58.27.22.19|RA4=58.27.22.24|RA4=58.27.22.59|RA4=58.27.22.73|RA4=58.27.22.82|RA4=58.27.86.8|RA4=58.27.86.10|RA4=58.27.86.40|RA4=58.27.86.57|RA4=58.27.86.58|RA4=58.28.25.8|RA4=58.28.25.9|RA4=58.28.25.10|RA4=58.63.254.111|RA4=58.63.254.113|RA4=58.63.254.114|RA4=58.63.254.115|RA4=58.63.254.117|RA4=58.63.254.119|RA4=58.63.254.120|RA4=58.63.254.121|RA4=58.63.254.122|RA4=58.63.254.123|RA4=58.63.254.125|RA4=58.96.8.72|RA4=58.96.8.75|RA4=58.96.8.81|RA4=58.96.8.88|RA4=58.96.8.90|RA4=58.96.8.104|RA4=59.151.173.65|RA4=59.151.174.178|RA4=60.199.191.27|RA4=60.199.191.35|RA4=60.199.191.121|RA4=60.254.131.53|RA4=60.254.131.55|RA4=60.254.131.61|RA4=60.254.131.62|RA4=60.254.131.63|RA4=60.254.131.64|RA4=60.254.142.17|RA4=60.254.142.43|RA4=60.254.143.42|RA4=60.254.143.89|RA4=60.254.143.236|RA4=60.254.143.244|RA4=60.254.143.246|RA4=60.254.148.26|RA4=60.254.148.187|RA4=60.254.170.136|RA4=61.9.209.225|RA4=61.9.209.227|RA4=61.9.241.137|RA4=61.9.241.146|RA4=61.9.241.153|RA4=61.9.241.168|RA4=61.9.241.170|RA4=61.9.241.171|RA4=61.19.12.207|RA4=61.19.12.208|RA4=61.19.12.209|RA4=61.19.12.215|RA4=61.19.12.216|RA4=61.19.12.217|RA4=61.19.12.223|RA4=61.25.1.139|RA4=61.25.1.160|RA4=61.25.1.162|RA4=61.25.1.168|RA4=61.25.1.176|RA4=61.25.1.184|RA4=61.47.57.201|RA4=61.71.68.239|RA4=61.71.69.207|RA4=61.71.73.233|RA4=61.71.82.55|RA4=61.71.84.9|RA4=61.71.96.104|RA4=61.71.103.144|RA4=61.71.107.56|RA4=61.71.108.72|RA4=61.91.165.105|RA4=61.91.165.113|RA4=61.91.165.154|RA4=61.91.165.175|RA4=61.91.165.184|RA4=61.111.58.11|RA4=61.111.58.19|RA4=61.111.58.24|RA4=61.111.58.27|RA4=61.111.58.33|RA4=61.111.58.40|RA4=61.111.58.174|RA4=61.111.58.175|RA4=61.114.99.185|RA4=61.114.99.186|RA4=61.114.99.187|RA4=61.120.150.61|RA4=61.194.99.160|RA4=61.194.99.170|RA4=61.194.99.186|RA4=61.194.99.194|RA4=61.194.99.203|RA4=61.213.151.9|RA4=61.213.151.11|RA4=61.213.151.17|RA4=61.213.151.24|RA4=61.213.151.25|RA4=61.213.151.32|RA4=61.213.168.9|RA4=61.213.168.11|RA4=61.213.168.17|RA4=61.213.168.18|RA4=61.213.168.24|RA4=61.213.168.35|RA4=61.213.171.26|RA4=61.213.171.34|RA4=61.213.171.57|RA4=61.213.171.58|RA4=61.213.181.136|RA4=61.213.181.153|RA4=61.213.181.160|RA4=61.213.181.161|RA4=61.213.181.168|RA4=61.213.181.170|RA4=61.213.209.56|RA4=61.213.209.57|RA4=61.213.209.58|RA4=61.213.209.59|RA4=61.220.62.218|RA4=61.244.242.8|RA4=61.244.242.9|RA4=61.244.242.16|RA4=61.244.242.18|RA4=61.244.242.24|RA4=61.244.242.25|RA4=62.101.36.198|RA4=62.101.36.199|RA4=62.101.36.200|RA4=62.101.36.206|RA4=62.115.255.198|RA4=62.115.255.200|RA4=62.121.6.136|RA4=62.121.6.138|RA4=62.121.6.144|RA4=62.121.6.146|RA4=62.139.204.70|RA4=62.139.204.80|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-20|""
""{B2584C62-B699-4A56-A109-A55D928F4E16}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=62.4.254.82|RA4=62.4.254.88|RA4=62.4.254.97|RA4=62.4.254.98|RA4=62.4.254.112|RA4=62.4.254.120|RA4=62.4.254.134|RA4=62.4.254.142|RA4=62.4.254.145|RA4=62.4.254.164|RA4=62.4.254.172|RA4=62.8.89.9|RA4=62.8.89.14|RA4=62.8.89.15|RA4=62.8.89.23|RA4=62.8.89.24|RA4=62.8.89.25|RA4=62.24.131.136|RA4=62.24.131.152|RA4=62.24.131.160|RA4=62.24.131.166|RA4=62.24.131.173|RA4=62.24.131.176|RA4=62.24.201.16|RA4=62.24.201.18|RA4=62.24.201.49|RA4=62.24.201.50|RA4=62.24.201.65|RA4=62.24.201.120|RA4=62.24.201.179|RA4=62.24.201.197|RA4=62.29.135.73|RA4=62.29.135.74|RA4=62.29.135.75|RA4=62.38.6.57|RA4=62.38.6.65|RA4=62.38.6.81|RA4=62.38.6.89|RA4=62.38.6.96|RA4=62.38.6.98|RA4=62.44.200.168|RA4=62.44.200.170|RA4=62.44.200.176|RA4=62.44.200.177|RA4=62.44.200.178|RA4=62.44.200.179|RA4=62.84.6.201|RA4=62.84.6.202|RA4=62.139.204.81|RA4=62.140.236.136|RA4=62.140.236.138|RA4=62.140.236.144|RA4=62.140.236.152|RA4=62.140.236.154|RA4=62.140.236.163|RA4=62.156.209.112|RA4=62.156.209.113|RA4=62.156.209.114|RA4=62.156.209.115|RA4=62.156.209.120|RA4=62.157.140.133|RA4=62.159.70.200|RA4=62.159.70.208|RA4=62.159.74.9|RA4=62.159.74.10|RA4=62.159.74.11|RA4=62.159.74.25|RA4=62.159.74.27|RA4=62.159.74.33|RA4=62.159.74.48|RA4=62.159.74.49|RA4=62.159.74.51|RA4=62.159.74.67|RA4=62.169.226.7|RA4=62.169.226.15|RA4=62.169.226.17|RA4=62.197.198.169|RA4=62.197.198.171|RA4=62.197.198.176|RA4=62.197.198.177|RA4=62.197.198.178|RA4=62.208.24.16|RA4=62.208.24.26|RA4=62.208.27.35|RA4=62.208.27.40|RA4=62.208.27.43|RA4=62.208.27.48|RA4=62.208.27.49|RA4=62.231.91.9|RA4=62.231.91.10|RA4=62.231.91.16|RA4=62.231.91.19|RA4=62.231.91.33|RA4=62.231.91.35|RA4=62.252.60.138|RA4=62.252.60.139|RA4=62.252.60.144|RA4=62.252.60.171|RA4=62.252.60.177|RA4=62.252.60.200|RA4=62.252.60.216|RA4=62.252.169.8|RA4=62.252.169.72|RA4=62.252.170.9|RA4=62.252.170.27|RA4=62.252.170.50|RA4=62.252.170.73|RA4=62.252.170.81|RA4=62.252.170.89|RA4=62.253.72.27|RA4=62.253.72.65|RA4=63.130.76.67|RA4=63.130.76.81|RA4=63.130.76.88|RA4=63.130.76.99|RA4=63.130.76.187|RA4=63.130.76.203|RA4=63.144.17.10|RA4=63.144.17.33|RA4=63.146.70.19|RA4=63.146.70.27|RA4=63.148.207.71|RA4=63.148.207.86|RA4=63.148.207.88|RA4=63.148.207.125|RA4=63.148.207.127|RA4=63.148.207.142|RA4=63.150.12.26|RA4=63.150.12.27|RA4=63.150.12.41|RA4=63.150.12.43|RA4=63.151.118.10|RA4=63.151.118.41|RA4=63.158.227.9|RA4=63.158.227.24|RA4=63.158.227.27|RA4=63.158.227.33|RA4=63.158.227.136|RA4=63.158.227.145|RA4=63.217.115.26|RA4=63.217.115.41|RA4=63.217.115.59|RA4=63.217.208.139|RA4=63.217.208.145|RA4=63.217.208.146|RA4=63.217.208.152|RA4=63.217.232.72|RA4=63.217.232.83|RA4=63.217.232.200|RA4=63.217.232.202|RA4=63.219.254.8|RA4=63.219.254.35|RA4=63.219.254.48|RA4=63.219.254.50|RA4=63.219.254.59|RA4=63.219.254.75|RA4=63.219.254.97|RA4=63.233.110.58|RA4=63.233.110.75|RA4=63.233.110.82|RA4=63.233.110.83|RA4=63.234.248.178|RA4=63.234.248.187|RA4=63.235.20.185|RA4=63.235.20.186|RA4=63.235.36.105|RA4=63.235.36.123|RA4=63.236.252.144|RA4=63.236.252.171|RA4=63.236.253.97|RA4=63.236.253.107|RA4=63.238.2.233|RA4=63.238.2.235|RA4=63.238.2.240|RA4=63.238.2.241|RA4=63.238.216.27|RA4=63.238.216.32|RA4=63.238.251.11|RA4=63.238.251.26|RA4=63.241.108.103|RA4=63.241.108.104|RA4=63.241.108.111|RA4=63.241.108.124|RA4=63.243.241.18|RA4=63.243.241.25|RA4=63.243.241.27|RA4=63.243.242.41|RA4=63.243.242.50|RA4=63.243.242.82|RA4=63.243.242.90|RA4=64.4.6.100|RA4=64.4.11.42|RA4=64.4.45.58|RA4=64.4.45.210|RA4=64.4.54.22|RA4=64.4.54.32|RA4=64.4.54.153|RA4=64.4.54.167|RA4=64.4.54.253|RA4=64.4.54.254|RA4=64.39.179.54|RA4=64.39.179.55|RA4=64.48.225.144|RA4=64.48.225.145|RA4=64.53.32.11|RA4=64.53.32.19|RA4=64.53.32.34|RA4=64.53.32.35|RA4=64.53.32.65|RA4=64.53.32.66|RA4=64.53.32.145|RA4=64.53.32.147|RA4=64.86.135.133|RA4=64.86.135.135|RA4=64.86.135.150|RA4=64.86.135.175|RA4=64.129.104.149|RA4=64.129.104.157|RA4=64.129.104.164|RA4=64.129.104.165|RA4=64.129.104.167|RA4=64.129.104.173|RA4=64.129.104.175|RA4=64.145.75.16|RA4=64.145.75.18|RA4=64.145.75.32|RA4=64.145.75.35|RA4=64.145.75.49|RA4=64.184.110.9|RA4=64.184.110.10|RA4=64.184.110.16|RA4=64.184.110.24|RA4=64.186.47.40|RA4=64.186.47.42|RA4=64.186.47.48|RA4=64.186.47.50|RA4=64.186.47.51|RA4=64.186.47.56|RA4=64.233.160.148|RA4=64.233.160.149|RA4=64.233.161.148|RA4=64.233.161.149|RA4=64.233.162.148|RA4=64.233.162.149|RA4=64.233.163.148|RA4=64.233.163.149|RA4=64.233.164.148|RA4=64.233.164.149|RA4=64.233.165.148|RA4=64.233.165.149|RA4=64.233.166.148|RA4=64.233.166.149|RA4=64.233.167.148|RA4=64.233.167.149|RA4=64.233.169.148|RA4=64.233.169.149|RA4=64.233.176.148|RA4=64.233.176.149|RA4=64.233.177.148|RA4=64.233.177.149|RA4=64.233.178.148|RA4=64.233.178.149|RA4=64.233.179.148|RA4=64.233.179.149|RA4=64.233.184.148|RA4=64.233.184.149|RA4=64.233.185.148|RA4=64.233.185.149|RA4=64.233.186.148|RA4=64.233.186.149|RA4=64.233.187.148|RA4=64.233.187.149|RA4=64.233.188.148|RA4=64.233.188.149|RA4=64.233.189.148|RA4=64.233.189.149|RA4=64.233.190.148|RA4=64.233.190.149|RA4=64.233.191.148|RA4=64.233.191.149|RA4=64.246.134.40|RA4=64.246.134.41|RA4=64.246.134.43|RA4=65.39.117.230|RA4=65.52.100.7|RA4=65.52.100.9|RA4=65.52.100.11|RA4=65.52.100.91|RA4=65.52.100.92|RA4=65.52.100.93|RA4=65.52.100.94|RA4=65.52.108.3|RA4=65.52.108.11|RA4=65.52.108.27|RA4=65.52.108.29|RA4=65.52.108.33|RA4=65.52.108.74|RA4=65.52.108.153|RA4=65.52.108.154|RA4=65.52.108.251|RA4=65.52.161.64|RA4=65.52.214.46|RA4=65.54.225.167|RA4=65.54.225.168|RA4=65.54.226.187|RA4=65.55.2.6|RA4=65.55.29.238|RA4=65.55.32.30|RA4=65.55.39.10|RA4=65.55.44.85|RA4=65.55.44.108|RA4=65.55.44.109|RA4=65.55.57.27|RA4=65.55.68.103|RA4=65.55.68.104|RA4=65.55.68.119|RA4=65.55.68.120|RA4=65.55.83.120|RA4=65.55.108.23|RA4=65.55.128.80|RA4=65.55.128.81|RA4=65.55.130.50|RA4=65.55.138.110|RA4=65.55.157.242|RA4=65.55.176.90|RA4=65.55.252.43|RA4=65.55.252.63|RA4=65.55.252.71|RA4=65.55.252.92|RA4=65.55.252.93|RA4=65.55.252.167|RA4=65.55.252.190|RA4=65.55.252.202|RA4=65.55.252.217|RA4=65.103.148.210|RA4=65.103.148.216|RA4=65.103.148.218|RA4=65.103.148.219|RA4=65.103.148.226|RA4=65.112.85.48|RA4=65.112.85.66|RA4=65.126.84.9|RA4=65.126.84.11|RA4=65.126.84.25|RA4=65.152.202.9|RA4=65.152.202.56|RA4=65.183.115.89|RA4=65.183.115.90|RA4=65.200.22.11|RA4=65.200.22.64|RA4=65.200.22.136|RA4=65.200.22.168|RA4=65.200.22.187|RA4=65.200.22.202|RA4=65.200.22.211|RA4=65.200.22.240|RA4=65.216.231.82|RA4=65.216.231.88|RA4=65.216.231.113|RA4=65.216.231.123|RA4=65.216.231.155|RA4=65.216.231.161|RA4=65.216.231.171|RA4=65.216.231.176|RA4=66.18.255.194|RA4=66.51.197.166|RA4=66.51.197.167|RA4=66.51.197.168|RA4=66.61.161.9|RA4=66.61.161.10|RA4=66.61.161.11|RA4=66.61.161.16|RA4=66.61.164.99|RA4=66.61.170.9|RA4=66.61.170.17|RA4=66.61.170.24|RA4=66.61.170.35|RA4=66.61.170.43|RA4=66.61.170.65|RA4=66.61.170.74|RA4=66.61.170.82|RA4=66.61.170.89|RA4=66.61.170.112|RA4=66.61.170.113|RA4=66.61.173.8|RA4=66.61.173.19|RA4=66.61.173.43|RA4=66.61.173.58|RA4=66.61.173.72|RA4=66.61.173.115|RA4=66.61.173.128|RA4=66.61.174.11|RA4=66.61.174.16|RA4=66.61.174.66|RA4=66.61.174.72|RA4=66.102.1.148|RA4=66.102.1.149|RA4=66.110.33.115|RA4=66.110.33.130|RA4=66.110.33.194|RA4=66.110.33.233|RA4=66.119.147.131|RA4=66.119.152.204|RA4=66.119.152.205|RA4=66.130.62.139|RA4=66.130.62.153|RA4=66.130.62.154|RA4=66.130.62.155|RA4=66.152.103.72|RA4=66.152.103.74|RA4=66.152.103.75|RA4=66.152.103.80|RA4=66.152.103.81|RA4=66.171.231.9|RA4=66.171.231.48|RA4=66.171.231.63|RA4=66.171.231.72|RA4=66.171.231.87|RA4=66.171.231.88|RA4=66.171.231.89|RA4=66.171.231.96|RA4=66.171.231.97|RA4=66.198.26.10|RA4=66.198.26.41|RA4=66.203.83.98|RA4=66.220.146.1|RA4=66.220.156.10|RA4=66.220.158.18|RA4=66.233.127.106|RA4=66.233.127.107|RA4=66.233.127.112|RA4=66.233.127.114|RA4=66.233.127.123|RA4=67.69.196.152|RA4=67.69.196.153|RA4=67.69.196.154|RA4=67.69.196.162|RA4=67.69.196.192|RA4=67.69.196.200|RA4=67.69.196.211|RA4=67.69.197.119|RA4=67.69.197.125|RA4=67.69.197.127|RA4=67.69.197.128|RA4=67.69.197.134|RA4=67.69.197.143|RA4=67.132.183.56|RA4=67.132.183.64|RA4=67.218.89.200|RA4=67.218.89.202|RA4=67.218.89.208|RA4=67.218.89.211|RA4=67.218.89.216|RA4=67.231.211.192|RA4=67.231.211.200|RA4=67.231.211.211|RA4=67.231.211.218|RA4=68.67.128.72|RA4=68.67.128.73|RA4=68.67.128.79|RA4=68.67.128.84|RA4=68.67.128.85|RA4=68.67.128.86|RA4=68.67.128.93|RA4=68.67.128.95|RA4=68.67.128.215|RA4=68.67.128.216|RA4=68.67.128.217|RA4=68.67.128.218|RA4=68.67.128.219|RA4=68.67.128.230|RA4=68.67.128.231|RA4=68.67.128.232|RA4=68.67.128.233|RA4=68.67.128.234|RA4=68.67.128.235|RA4=68.67.129.45|RA4=68.67.129.47|RA4=68.67.129.48|RA4=68.67.129.53|RA4=68.67.129.61|RA4=68.67.129.63|RA4=68.67.129.74|RA4=68.67.129.136|RA4=68.67.129.137|RA4=68.67.129.139|RA4=68.67.129.143|RA4=68.67.129.144|RA4=68.67.129.145|RA4=68.67.129.154|RA4=68.67.129.169|RA4=68.67.129.171|RA4=68.67.152.1|RA4=68.67.152.103|RA4=68.67.152.110|RA4=68.177.32.112|RA4=68.177.32.113|RA4=68.232.34.200|RA4=68.232.45.200|RA4=68.232.45.201|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-21|""
""{FC68884D-6B7E-45FD-B305-E250530E6AAD}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=68.67.152.3|RA4=68.67.152.4|RA4=68.67.152.5|RA4=68.67.152.6|RA4=68.67.152.7|RA4=68.67.152.8|RA4=68.67.152.82|RA4=68.67.152.90|RA4=68.67.152.91|RA4=68.67.152.92|RA4=68.67.152.94|RA4=68.67.152.97|RA4=68.67.152.120|RA4=68.67.152.131|RA4=68.67.152.132|RA4=68.67.152.167|RA4=68.67.152.172|RA4=68.67.152.173|RA4=68.67.152.174|RA4=68.67.153.37|RA4=68.67.153.40|RA4=68.67.153.44|RA4=68.67.153.87|RA4=68.67.153.89|RA4=68.67.176.40|RA4=68.67.176.41|RA4=68.67.176.42|RA4=68.67.176.43|RA4=68.67.176.44|RA4=68.67.176.45|RA4=68.67.176.46|RA4=68.67.176.47|RA4=68.67.176.48|RA4=68.67.176.49|RA4=68.67.176.50|RA4=68.67.176.51|RA4=68.67.176.52|RA4=68.67.176.128|RA4=68.67.176.129|RA4=68.67.176.145|RA4=68.67.176.146|RA4=68.67.178.108|RA4=68.67.178.109|RA4=68.67.178.110|RA4=68.67.178.111|RA4=68.67.178.132|RA4=68.67.178.134|RA4=68.67.178.137|RA4=68.67.178.138|RA4=68.67.178.170|RA4=68.67.178.173|RA4=68.67.178.176|RA4=68.67.178.196|RA4=68.67.178.197|RA4=68.67.178.199|RA4=68.67.178.230|RA4=68.67.178.243|RA4=68.67.178.246|RA4=68.67.178.252|RA4=68.67.180.12|RA4=68.67.180.44|RA4=68.67.180.45|RA4=68.67.180.132|RA4=68.67.180.138|RA4=68.67.180.143|RA4=69.22.138.121|RA4=69.22.138.147|RA4=69.22.181.11|RA4=69.22.181.16|RA4=69.22.181.24|RA4=69.22.181.25|RA4=69.30.155.176|RA4=69.30.155.178|RA4=69.30.155.184|RA4=69.30.155.192|RA4=69.30.155.208|RA4=69.30.155.210|RA4=69.31.29.37|RA4=69.31.29.196|RA4=69.31.29.198|RA4=69.31.29.206|RA4=69.31.75.176|RA4=69.31.75.193|RA4=69.31.75.200|RA4=69.31.132.25|RA4=69.31.132.42|RA4=69.31.132.66|RA4=69.64.146.224|RA4=69.144.75.16|RA4=69.144.75.32|RA4=69.144.75.40|RA4=69.144.75.42|RA4=69.144.75.49|RA4=69.144.75.50|RA4=69.171.230.12|RA4=69.192.3.8|RA4=69.192.3.10|RA4=69.192.3.16|RA4=69.192.3.33|RA4=69.192.3.34|RA4=69.192.3.41|RA4=69.192.3.65|RA4=69.192.3.66|RA4=69.192.4.27|RA4=69.192.4.88|RA4=69.192.4.105|RA4=69.192.4.107|RA4=69.192.4.131|RA4=69.192.4.152|RA4=69.192.9.76|RA4=69.192.26.181|RA4=69.192.72.12|RA4=69.192.73.162|RA4=69.192.118.243|RA4=69.192.119.159|RA4=69.192.125.91|RA4=69.192.149.56|RA4=69.192.151.243|RA4=69.192.152.36|RA4=69.192.154.80|RA4=69.192.168.12|RA4=69.192.180.100|RA4=69.192.180.176|RA4=69.192.184.193|RA4=69.192.186.216|RA4=69.192.197.153|RA4=69.192.203.83|RA4=69.192.238.238|RA4=70.39.139.10|RA4=70.39.139.27|RA4=70.96.0.9|RA4=70.96.0.11|RA4=70.96.0.17|RA4=70.96.0.18|RA4=70.96.0.25|RA4=70.96.0.73|RA4=70.96.0.75|RA4=70.96.0.81|RA4=70.96.0.82|RA4=70.96.0.105|RA4=70.96.0.107|RA4=70.96.0.113|RA4=70.96.0.114|RA4=70.96.0.121|RA4=70.163.84.146|RA4=70.163.84.152|RA4=70.163.84.153|RA4=70.163.84.154|RA4=70.186.11.9|RA4=70.186.11.17|RA4=70.186.11.24|RA4=70.186.11.32|RA4=70.186.11.65|RA4=70.186.11.73|RA4=70.186.25.10|RA4=70.186.25.19|RA4=70.186.25.24|RA4=70.186.25.33|RA4=70.186.27.26|RA4=70.186.27.34|RA4=70.186.27.50|RA4=70.186.27.51|RA4=70.186.27.66|RA4=70.186.27.67|RA4=72.21.81.200|RA4=72.22.185.198|RA4=72.22.185.200|RA4=72.22.185.206|RA4=72.22.185.208|RA4=72.22.185.216|RA4=72.23.201.58|RA4=72.37.154.10|RA4=72.37.154.26|RA4=72.37.154.27|RA4=72.37.154.42|RA4=72.37.154.48|RA4=72.37.154.49|RA4=72.165.185.8|RA4=72.165.185.9|RA4=72.165.185.16|RA4=72.240.109.200|RA4=72.240.109.201|RA4=72.240.109.203|RA4=72.240.109.217|RA4=72.240.109.226|RA4=72.240.109.227|RA4=72.246.32.40|RA4=72.246.40.57|RA4=72.246.40.96|RA4=72.246.40.98|RA4=72.246.43.16|RA4=72.246.43.25|RA4=72.246.43.26|RA4=72.246.43.32|RA4=72.246.45.8|RA4=72.246.45.9|RA4=72.246.45.17|RA4=72.246.45.25|RA4=72.246.45.34|RA4=72.246.45.73|RA4=72.246.56.56|RA4=72.246.56.59|RA4=72.246.56.195|RA4=72.246.56.209|RA4=72.246.61.135|RA4=72.246.64.114|RA4=72.246.64.136|RA4=72.246.64.251|RA4=72.246.65.9|RA4=72.246.65.17|RA4=72.246.65.186|RA4=72.246.74.78|RA4=72.246.97.33|RA4=72.246.97.35|RA4=72.246.97.40|RA4=72.246.97.42|RA4=72.246.103.8|RA4=72.246.103.9|RA4=72.246.103.10|RA4=72.246.103.11|RA4=72.246.103.17|RA4=72.246.103.18|RA4=72.246.103.24|RA4=72.246.103.25|RA4=72.246.103.26|RA4=72.246.103.27|RA4=72.246.106.89|RA4=72.246.114.41|RA4=72.246.151.183|RA4=72.246.172.69|RA4=72.246.175.33|RA4=72.246.176.26|RA4=72.246.188.10|RA4=72.246.188.34|RA4=72.246.188.50|RA4=72.246.188.64|RA4=72.246.188.67|RA4=72.246.188.75|RA4=72.246.188.97|RA4=72.246.188.131|RA4=72.246.188.139|RA4=72.246.188.153|RA4=72.246.188.155|RA4=72.246.188.161|RA4=72.246.188.210|RA4=72.246.188.224|RA4=72.246.189.9|RA4=72.246.189.11|RA4=72.246.189.24|RA4=72.246.189.32|RA4=72.246.189.33|RA4=72.246.189.34|RA4=72.246.189.233|RA4=72.246.189.249|RA4=72.246.190.91|RA4=72.246.190.120|RA4=72.246.190.137|RA4=72.246.190.163|RA4=72.246.190.171|RA4=72.246.216.32|RA4=72.246.216.196|RA4=72.246.216.211|RA4=72.246.216.214|RA4=72.246.227.167|RA4=72.246.231.53|RA4=72.246.241.12|RA4=72.246.250.19|RA4=72.247.2.54|RA4=72.247.9.25|RA4=72.247.9.49|RA4=72.247.9.66|RA4=72.247.9.89|RA4=72.247.9.114|RA4=72.247.9.115|RA4=72.247.9.137|RA4=72.247.9.138|RA4=72.247.9.139|RA4=72.247.9.146|RA4=72.247.9.216|RA4=72.247.10.8|RA4=72.247.10.10|RA4=72.247.10.18|RA4=72.247.10.24|RA4=72.247.10.48|RA4=72.247.16.184|RA4=72.247.18.152|RA4=72.247.22.87|RA4=72.247.23.227|RA4=72.247.24.117|RA4=72.247.26.56|RA4=72.247.28.238|RA4=72.247.69.159|RA4=72.247.73.11|RA4=72.247.80.11|RA4=72.247.80.17|RA4=72.247.80.18|RA4=72.247.80.19|RA4=72.247.80.24|RA4=72.247.80.26|RA4=72.247.80.27|RA4=72.247.82.221|RA4=72.247.85.229|RA4=72.247.92.249|RA4=72.247.95.4|RA4=72.247.138.161|RA4=72.247.145.104|RA4=72.247.145.107|RA4=72.247.145.113|RA4=72.247.145.123|RA4=72.247.145.128|RA4=72.247.145.170|RA4=72.247.173.45|RA4=72.247.174.70|RA4=72.247.175.217|RA4=72.247.176.17|RA4=72.247.176.24|RA4=72.247.176.26|RA4=72.247.176.40|RA4=72.247.176.42|RA4=72.247.177.80|RA4=72.247.177.106|RA4=72.247.177.113|RA4=72.247.177.136|RA4=72.247.177.177|RA4=72.247.177.190|RA4=72.247.178.32|RA4=72.247.178.35|RA4=72.247.178.41|RA4=72.247.178.49|RA4=72.247.178.58|RA4=72.247.178.107|RA4=72.247.182.9|RA4=72.247.182.10|RA4=72.247.182.17|RA4=72.247.182.26|RA4=72.247.182.32|RA4=72.247.182.41|RA4=72.247.184.27|RA4=72.247.184.35|RA4=72.247.184.57|RA4=72.247.184.82|RA4=72.247.184.91|RA4=72.247.184.104|RA4=72.247.185.16|RA4=72.247.185.58|RA4=72.247.185.66|RA4=72.247.198.225|RA4=72.247.210.17|RA4=72.247.210.24|RA4=72.247.210.40|RA4=72.247.210.42|RA4=72.247.210.50|RA4=72.247.210.51|RA4=72.247.210.57|RA4=72.247.210.58|RA4=72.247.210.59|RA4=72.247.214.206|RA4=72.247.221.133|RA4=72.247.223.19|RA4=72.247.223.33|RA4=72.247.223.50|RA4=72.247.223.56|RA4=72.247.223.145|RA4=72.247.223.147|RA4=72.247.240.105|RA4=72.247.240.114|RA4=72.247.240.137|RA4=72.249.192.10|RA4=72.249.192.26|RA4=72.249.192.48|RA4=72.249.192.56|RA4=72.249.192.58|RA4=72.249.192.64|RA4=72.249.194.16|RA4=72.249.194.25|RA4=72.249.194.113|RA4=72.249.194.121|RA4=72.249.194.129|RA4=72.249.194.146|RA4=74.125.21.148|RA4=74.125.21.149|RA4=74.125.22.148|RA4=74.125.22.149|RA4=74.125.23.148|RA4=74.125.23.149|RA4=74.125.24.148|RA4=74.125.24.149|RA4=74.125.25.148|RA4=74.125.25.149|RA4=74.125.28.148|RA4=74.125.28.149|RA4=74.125.30.148|RA4=74.125.30.149|RA4=74.125.68.148|RA4=74.125.68.149|RA4=74.125.70.148|RA4=74.125.70.149|RA4=74.125.71.148|RA4=74.125.71.149|RA4=74.125.128.148|RA4=74.125.128.149|RA4=74.125.130.148|RA4=74.125.130.149|RA4=74.125.131.148|RA4=74.125.131.149|RA4=74.125.133.148|RA4=74.125.133.149|RA4=74.125.136.148|RA4=74.125.136.149|RA4=74.125.138.148|RA4=74.125.138.149|RA4=74.125.140.148|RA4=74.125.140.149|RA4=74.125.141.148|RA4=74.125.141.149|RA4=74.125.143.148|RA4=74.125.143.149|RA4=74.125.193.148|RA4=74.125.193.149|RA4=74.125.195.148|RA4=74.125.195.149|RA4=74.125.196.148|RA4=74.125.196.149|RA4=74.125.200.148|RA4=74.125.200.149|RA4=74.125.201.148|RA4=74.125.201.149|RA4=74.125.203.148|RA4=74.125.203.149|RA4=74.125.204.148|RA4=74.125.204.149|RA4=74.125.205.148|RA4=74.125.205.149|RA4=74.125.206.148|RA4=74.125.206.149|RA4=74.125.224.27|RA4=74.125.224.28|RA4=74.125.224.59|RA4=74.125.224.60|RA4=74.125.224.91|RA4=74.125.224.92|RA4=74.125.224.123|RA4=74.125.224.124|RA4=74.125.224.155|RA4=74.125.224.156|RA4=74.125.225.27|RA4=74.125.225.28|RA4=74.125.226.27|RA4=74.125.226.28|RA4=74.125.226.59|RA4=74.125.226.60|RA4=74.125.226.91|RA4=74.125.226.92|RA4=74.125.226.123|RA4=74.125.226.124|RA4=74.125.226.155|RA4=74.125.226.156|RA4=74.125.226.187|RA4=74.125.226.188|RA4=74.125.227.27|RA4=74.125.227.28|RA4=74.125.227.59|RA4=74.125.227.60|RA4=74.125.227.91|RA4=74.125.227.92|RA4=74.125.227.187|RA4=74.125.227.188|RA4=74.125.227.219|RA4=74.125.227.220|RA4=74.125.227.251|RA4=74.125.227.252|RA4=74.125.228.219|RA4=74.125.228.220|RA4=74.125.228.251|RA4=74.125.228.252|RA4=74.125.232.123|RA4=74.125.232.124|RA4=74.125.232.155|RA4=74.125.232.156|RA4=74.125.232.251|RA4=74.125.232.252|RA4=74.125.237.27|RA4=74.125.237.28|RA4=74.125.237.59|RA4=74.125.237.60|RA4=74.125.239.59|RA4=74.125.239.60|RA4=74.125.239.123|RA4=74.125.239.124|RA4=74.125.239.155|RA4=74.125.239.156|RA4=74.202.215.8|RA4=74.202.215.10|RA4=74.202.215.16|RA4=74.202.215.17|RA4=74.202.215.19|RA4=74.202.215.24|RA4=74.202.215.35|RA4=77.106.169.19|RA4=77.106.169.24|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-22|""
""{EDDB82CB-4F04-47CC-A9C6-8C67B994EA37}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=8.12.192.253|RA4=8.12.195.126|RA4=8.12.200.253|RA4=8.12.201.126|RA4=8.12.206.253|RA4=8.12.207.125|RA4=8.12.212.126|RA4=8.12.213.126|RA4=8.12.215.253|RA4=8.12.217.126|RA4=8.12.220.126|RA4=8.12.221.126|RA4=8.12.222.126|RA4=8.12.223.125|RA4=8.12.223.254|RA4=8.19.31.10|RA4=8.19.31.11|RA4=8.26.194.125|RA4=8.26.196.126|RA4=8.26.196.251|RA4=8.26.198.126|RA4=8.26.198.253|RA4=8.26.204.126|RA4=8.26.206.252|RA4=8.26.207.126|RA4=8.26.207.254|RA4=8.26.209.126|RA4=8.26.210.126|RA4=8.26.216.252|RA4=8.26.218.252|RA4=8.26.219.126|RA4=8.26.220.254|RA4=8.26.221.126|RA4=8.26.222.254|RA4=8.26.223.124|RA4=8.26.223.254|RA4=8.27.0.254|RA4=8.27.3.254|RA4=8.27.4.254|RA4=8.27.5.254|RA4=8.27.6.126|RA4=8.27.7.254|RA4=8.27.81.126|RA4=8.27.81.254|RA4=8.27.82.126|RA4=8.27.83.254|RA4=8.27.133.254|RA4=8.27.135.254|RA4=8.27.137.254|RA4=8.27.145.251|RA4=8.27.146.126|RA4=8.27.147.126|RA4=8.27.151.253|RA4=8.27.153.126|RA4=8.27.155.126|RA4=8.27.156.126|RA4=8.27.156.254|RA4=8.27.158.254|RA4=8.27.224.126|RA4=8.27.225.254|RA4=8.27.226.126|RA4=8.27.226.253|RA4=8.27.227.126|RA4=8.27.229.126|RA4=8.27.230.253|RA4=8.27.231.126|RA4=8.27.231.253|RA4=8.27.233.253|RA4=8.27.234.126|RA4=8.27.235.126|RA4=8.27.235.254|RA4=8.27.237.126|RA4=8.27.237.254|RA4=8.27.239.254|RA4=8.27.242.253|RA4=8.27.243.253|RA4=8.27.244.252|RA4=8.27.246.126|RA4=8.27.246.254|RA4=8.27.248.125|RA4=8.27.251.253|RA4=8.27.253.125|RA4=8.27.253.254|RA4=8.27.254.126|RA4=8.27.255.254|RA4=8.253.3.254|RA4=8.253.7.126|RA4=8.253.7.254|RA4=8.253.9.125|RA4=8.253.14.126|RA4=8.253.15.126|RA4=8.253.16.126|RA4=8.253.18.126|RA4=8.253.23.126|RA4=8.253.26.126|RA4=8.253.26.254|RA4=8.253.27.254|RA4=8.253.30.126|RA4=8.253.31.126|RA4=8.253.31.254|RA4=8.253.32.126|RA4=8.253.33.126|RA4=8.253.33.254|RA4=8.253.34.126|RA4=8.253.34.254|RA4=8.253.35.126|RA4=8.253.36.126|RA4=8.253.36.254|RA4=8.253.37.126|RA4=8.253.38.126|RA4=8.253.43.126|RA4=8.253.43.254|RA4=8.253.44.126|RA4=8.253.51.254|RA4=8.253.53.126|RA4=8.253.55.126|RA4=8.253.56.126|RA4=8.253.57.254|RA4=8.253.58.126|RA4=8.253.58.254|RA4=8.253.59.126|RA4=8.253.63.254|RA4=8.253.72.254|RA4=8.253.74.126|RA4=8.253.88.126|RA4=8.253.90.126|RA4=8.253.90.254|RA4=8.253.91.126|RA4=8.253.91.254|RA4=8.253.92.126|RA4=8.253.92.254|RA4=8.253.93.126|RA4=8.253.99.126|RA4=8.253.99.254|RA4=8.253.100.126|RA4=8.253.100.254|RA4=8.253.101.126|RA4=8.253.102.126|RA4=8.253.116.126|RA4=8.253.118.126|RA4=8.253.119.254|RA4=8.253.233.126|RA4=8.254.3.126|RA4=8.254.3.254|RA4=8.254.8.126|RA4=8.254.11.126|RA4=8.254.19.125|RA4=8.254.20.253|RA4=8.254.23.254|RA4=8.254.24.254|RA4=8.254.25.126|RA4=8.254.27.254|RA4=8.254.28.126|RA4=8.254.30.253|RA4=8.254.33.126|RA4=8.254.34.126|RA4=8.254.35.254|RA4=8.254.36.126|RA4=8.254.36.254|RA4=8.254.37.126|RA4=8.254.40.254|RA4=8.254.43.126|RA4=8.254.43.254|RA4=8.254.45.254|RA4=8.254.49.254|RA4=8.254.50.126|RA4=8.254.53.254|RA4=8.254.55.126|RA4=8.254.55.254|RA4=8.254.56.254|RA4=8.254.58.254|RA4=8.254.59.126|RA4=8.254.60.254|RA4=8.254.61.126|RA4=8.254.63.254|RA4=8.254.64.126|RA4=8.254.65.126|RA4=8.254.66.254|RA4=8.254.68.126|RA4=8.254.70.126|RA4=8.254.72.126|RA4=8.254.75.126|RA4=8.254.76.126|RA4=8.254.93.126|RA4=8.254.94.126|RA4=8.254.94.254|RA4=8.254.95.126|RA4=8.254.96.126|RA4=8.254.96.254|RA4=8.254.97.125|RA4=8.254.98.126|RA4=8.254.99.125|RA4=8.254.99.254|RA4=8.254.100.125|RA4=8.254.100.126|RA4=8.254.101.126|RA4=8.254.101.253|RA4=8.254.102.126|RA4=8.254.102.254|RA4=8.254.103.125|RA4=8.254.105.125|RA4=8.254.110.254|RA4=8.254.118.126|RA4=8.254.118.254|RA4=8.254.119.126|RA4=8.254.119.254|RA4=8.254.146.126|RA4=8.254.146.254|RA4=8.254.147.126|RA4=8.254.147.254|RA4=8.254.150.126|RA4=8.254.152.126|RA4=8.254.152.254|RA4=8.254.153.125|RA4=8.254.164.126|RA4=8.254.164.254|RA4=8.254.171.254|RA4=8.254.172.254|RA4=8.254.173.126|RA4=8.254.173.254|RA4=8.254.174.126|RA4=8.254.175.126|RA4=8.254.175.254|RA4=8.254.176.126|RA4=8.254.176.254|RA4=8.254.178.125|RA4=8.254.178.254|RA4=8.254.187.126|RA4=8.254.187.254|RA4=8.254.189.126|RA4=8.254.189.254|RA4=8.254.192.254|RA4=8.254.193.126|RA4=8.254.195.126|RA4=8.254.196.126|RA4=8.254.198.254|RA4=8.254.205.126|RA4=8.254.205.254|RA4=8.254.209.126|RA4=8.254.209.254|RA4=8.254.210.126|RA4=8.254.211.126|RA4=8.254.211.254|RA4=8.254.212.126|RA4=8.254.212.254|RA4=8.254.213.126|RA4=8.254.213.254|RA4=8.254.214.126|RA4=8.254.214.254|RA4=8.254.215.126|RA4=8.254.215.254|RA4=8.254.219.254|RA4=8.254.222.126|RA4=8.254.222.254|RA4=8.254.223.126|RA4=8.254.223.254|RA4=8.254.224.126|RA4=8.254.224.254|RA4=8.254.226.254|RA4=8.254.227.126|RA4=8.254.227.254|RA4=8.254.229.126|RA4=8.254.232.254|RA4=8.254.233.126|RA4=8.254.233.254|RA4=8.254.234.254|RA4=8.254.236.126|RA4=8.254.237.254|RA4=8.254.239.254|RA4=8.254.240.126|RA4=8.254.244.126|RA4=8.254.244.254|RA4=8.254.246.254|RA4=8.254.248.254|RA4=8.254.249.254|RA4=8.254.251.126|RA4=8.254.251.254|RA4=8.254.253.254|RA4=8.254.254.254|RA4=77.67.11.8|RA4=77.67.11.42|RA4=77.67.11.50|RA4=77.67.11.65|RA4=77.67.11.104|RA4=77.67.11.120|RA4=77.67.21.9|RA4=77.67.21.40|RA4=77.67.21.42|RA4=77.67.21.49|RA4=77.67.21.56|RA4=77.67.21.58|RA4=77.67.27.17|RA4=77.67.27.25|RA4=77.67.28.136|RA4=77.67.28.162|RA4=77.67.28.169|RA4=77.67.28.170|RA4=77.67.28.171|RA4=77.67.29.139|RA4=77.67.29.145|RA4=77.67.29.160|RA4=77.67.29.163|RA4=77.67.29.178|RA4=77.67.29.186|RA4=77.67.48.139|RA4=77.67.48.145|RA4=77.67.48.154|RA4=77.67.48.161|RA4=77.67.48.169|RA4=77.67.48.178|RA4=77.67.127.42|RA4=77.67.127.64|RA4=77.106.169.25|RA4=77.106.169.26|RA4=77.106.169.27|RA4=77.106.169.32|RA4=77.109.131.232|RA4=77.109.131.233|RA4=77.109.131.234|RA4=77.109.131.235|RA4=77.109.137.184|RA4=77.109.137.185|RA4=77.109.137.186|RA4=77.109.137.187|RA4=77.109.147.136|RA4=77.109.147.138|RA4=77.109.147.147|RA4=77.109.147.153|RA4=77.109.147.154|RA4=77.120.60.186|RA4=77.120.60.200|RA4=77.120.60.202|RA4=77.120.60.203|RA4=77.120.60.209|RA4=77.209.227.16|RA4=77.209.227.19|RA4=77.209.227.43|RA4=77.209.227.50|RA4=77.214.54.11|RA4=77.214.54.32|RA4=77.214.54.74|RA4=77.214.54.81|RA4=77.242.31.230|RA4=77.242.31.232|RA4=77.242.31.238|RA4=77.242.31.239|RA4=77.242.31.240|RA4=77.242.31.241|RA4=78.11.252.8|RA4=78.11.252.25|RA4=78.11.252.58|RA4=78.11.252.64|RA4=78.11.252.73|RA4=78.11.252.74|RA4=78.11.252.80|RA4=78.11.252.144|RA4=78.11.252.155|RA4=78.11.252.161|RA4=78.11.252.162|RA4=78.11.252.171|RA4=78.33.33.73|RA4=78.33.33.75|RA4=78.33.33.81|RA4=78.33.33.82|RA4=78.33.33.88|RA4=78.33.33.91|RA4=78.133.98.136|RA4=78.133.98.137|RA4=78.133.98.138|RA4=78.133.98.144|RA4=78.133.98.152|RA4=78.152.43.210|RA4=78.152.43.216|RA4=79.101.14.8|RA4=79.101.14.24|RA4=79.101.14.25|RA4=79.101.14.32|RA4=79.101.14.35|RA4=79.101.14.41|RA4=79.101.14.43|RA4=79.101.14.57|RA4=79.101.14.74|RA4=79.101.14.147|RA4=79.101.14.154|RA4=79.101.14.155|RA4=79.101.14.160|RA4=79.140.80.50|RA4=79.140.80.75|RA4=79.140.80.90|RA4=79.140.80.91|RA4=79.140.80.96|RA4=79.140.80.97|RA4=79.140.80.99|RA4=79.140.80.104|RA4=79.140.80.107|RA4=79.140.94.8|RA4=79.140.94.32|RA4=79.140.94.33|RA4=79.140.94.193|RA4=79.140.94.195|RA4=79.140.94.202|RA4=79.140.94.209|RA4=79.140.94.210|RA4=79.140.94.216|RA4=79.140.95.121|RA4=79.140.95.130|RA4=79.140.95.152|RA4=79.140.95.155|RA4=79.140.95.163|RA4=79.140.95.209|RA4=79.140.95.217|RA4=79.171.167.210|RA4=79.171.167.219|RA4=79.171.167.225|RA4=80.150.192.73|RA4=80.150.192.80|RA4=80.150.192.88|RA4=80.150.192.91|RA4=80.156.86.78|RA4=80.157.149.9|RA4=80.157.149.10|RA4=80.157.149.18|RA4=80.157.149.26|RA4=80.157.149.27|RA4=80.157.149.42|RA4=80.157.149.48|RA4=80.157.149.57|RA4=80.157.149.74|RA4=80.157.150.16|RA4=80.157.150.25|RA4=80.157.150.162|RA4=80.157.150.188|RA4=80.157.150.189|RA4=80.157.151.114|RA4=80.157.151.123|RA4=80.169.150.10|RA4=80.169.150.11|RA4=80.169.150.17|RA4=80.169.150.19|RA4=80.169.150.24|RA4=80.169.150.26|RA4=80.169.150.33|RA4=80.228.45.26|RA4=80.228.45.27|RA4=80.228.45.34|RA4=80.228.45.35|RA4=80.228.45.43|RA4=80.228.45.50|RA4=80.228.45.58|RA4=80.228.45.67|RA4=80.231.122.135|RA4=80.231.122.158|RA4=80.231.241.67|RA4=80.231.241.80|RA4=80.236.32.136|RA4=80.236.32.144|RA4=80.236.32.153|RA4=80.236.32.184|RA4=80.239.137.73|RA4=80.239.137.88|RA4=80.239.137.106|RA4=80.239.137.122|RA4=80.239.137.123|RA4=80.239.137.129|RA4=80.239.137.136|RA4=80.239.137.138|RA4=80.239.148.95|RA4=80.239.148.146|RA4=80.239.148.152|RA4=80.239.149.10|RA4=80.239.149.27|RA4=80.239.149.32|RA4=80.239.149.81|RA4=80.239.159.56|RA4=80.239.159.58|RA4=80.239.178.178|RA4=80.239.178.187|RA4=80.239.178.195|RA4=80.239.178.223|RA4=80.239.178.225|RA4=80.239.178.231|RA4=80.239.178.232|RA4=80.239.178.233|RA4=80.239.178.239|RA4=80.239.178.240|RA4=80.239.200.8|RA4=80.239.200.16|RA4=80.239.200.42|RA4=80.239.200.51|RA4=80.239.216.8|RA4=80.239.216.32|RA4=80.239.217.35|RA4=80.239.217.57|RA4=80.239.217.128|RA4=80.239.217.136|RA4=80.239.236.107|RA4=80.239.236.128|RA4=80.239.236.137|RA4=80.239.236.210|RA4=80.239.236.216|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-23|""
""{13EB156F-5730-4316-A9E4-5CC99BC7CBEF}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=80.65.238.8|RA4=80.65.238.9|RA4=80.65.238.14|RA4=80.68.78.15|RA4=80.68.78.17|RA4=80.68.78.22|RA4=80.68.78.32|RA4=80.68.78.39|RA4=80.68.78.41|RA4=80.68.78.55|RA4=80.68.78.60|RA4=80.68.78.61|RA4=80.86.97.86|RA4=80.86.97.88|RA4=80.86.97.94|RA4=80.93.27.8|RA4=80.93.27.9|RA4=80.93.27.16|RA4=80.93.27.18|RA4=80.97.208.136|RA4=80.97.208.138|RA4=80.97.208.146|RA4=80.97.208.161|RA4=80.97.208.170|RA4=80.97.208.216|RA4=80.97.208.234|RA4=80.97.209.163|RA4=80.97.209.170|RA4=80.97.209.171|RA4=80.97.209.176|RA4=80.97.209.185|RA4=80.97.209.186|RA4=80.239.236.96|RA4=80.239.237.10|RA4=80.239.237.16|RA4=80.239.237.136|RA4=80.239.237.138|RA4=80.239.237.147|RA4=80.239.237.155|RA4=80.239.237.160|RA4=80.239.237.179|RA4=80.239.237.185|RA4=80.239.244.95|RA4=80.239.245.67|RA4=80.239.247.8|RA4=80.239.247.17|RA4=80.239.247.22|RA4=80.239.247.36|RA4=80.239.247.45|RA4=80.239.247.46|RA4=80.239.247.47|RA4=80.239.250.107|RA4=80.239.250.109|RA4=80.239.250.123|RA4=80.239.250.131|RA4=80.239.250.146|RA4=80.239.250.147|RA4=80.252.91.24|RA4=80.252.91.25|RA4=80.252.91.41|RA4=80.252.91.52|RA4=80.252.91.53|RA4=81.20.72.168|RA4=81.20.72.179|RA4=81.20.72.209|RA4=81.20.72.218|RA4=81.22.36.128|RA4=81.22.37.128|RA4=81.22.38.128|RA4=81.52.140.8|RA4=81.52.140.17|RA4=81.52.140.144|RA4=81.52.140.153|RA4=81.52.140.155|RA4=81.52.160.65|RA4=81.52.160.73|RA4=81.52.160.80|RA4=81.94.51.201|RA4=81.94.51.202|RA4=81.94.51.203|RA4=81.94.51.204|RA4=81.94.51.209|RA4=81.94.63.137|RA4=81.94.63.138|RA4=81.94.63.139|RA4=81.175.29.8|RA4=81.175.29.9|RA4=81.175.29.10|RA4=81.196.26.136|RA4=81.196.26.138|RA4=81.196.26.154|RA4=81.196.26.163|RA4=81.196.26.171|RA4=81.196.26.176|RA4=81.196.26.193|RA4=81.196.185.136|RA4=81.196.185.137|RA4=81.196.185.139|RA4=81.196.185.147|RA4=81.198.165.202|RA4=81.198.165.210|RA4=81.198.165.211|RA4=81.198.165.216|RA4=81.198.165.217|RA4=81.200.64.50|RA4=81.218.31.177|RA4=81.218.31.184|RA4=81.218.31.185|RA4=81.218.31.186|RA4=81.218.31.187|RA4=82.85.53.8|RA4=82.85.53.9|RA4=82.85.53.10|RA4=82.85.53.16|RA4=82.85.53.42|RA4=82.85.53.43|RA4=82.94.229.8|RA4=82.94.229.9|RA4=82.94.229.18|RA4=82.94.229.19|RA4=82.94.229.40|RA4=82.94.234.74|RA4=82.94.234.105|RA4=82.94.234.113|RA4=82.96.58.9|RA4=82.96.58.15|RA4=82.96.58.24|RA4=82.96.58.25|RA4=82.96.58.47|RA4=82.96.58.48|RA4=82.96.58.62|RA4=82.96.58.64|RA4=82.96.58.65|RA4=82.102.152.18|RA4=82.102.152.32|RA4=82.102.180.139|RA4=82.102.180.145|RA4=82.102.180.146|RA4=82.102.180.155|RA4=82.102.180.160|RA4=82.102.180.169|RA4=82.102.180.177|RA4=82.113.13.216|RA4=82.113.13.217|RA4=82.113.13.218|RA4=82.166.201.137|RA4=82.166.201.145|RA4=82.166.201.178|RA4=82.166.201.185|RA4=82.166.201.186|RA4=82.166.201.187|RA4=82.166.201.209|RA4=82.166.201.210|RA4=82.166.201.211|RA4=82.178.158.254|RA4=82.199.68.72|RA4=82.199.68.73|RA4=82.199.80.141|RA4=82.199.80.142|RA4=82.199.80.143|RA4=82.201.12.200|RA4=82.201.12.201|RA4=82.201.12.208|RA4=83.148.190.73|RA4=83.148.190.80|RA4=83.148.190.88|RA4=83.148.190.89|RA4=83.148.190.90|RA4=83.148.190.96|RA4=83.151.132.104|RA4=83.151.132.106|RA4=83.151.132.113|RA4=83.151.132.114|RA4=83.151.132.121|RA4=83.151.132.122|RA4=83.151.132.123|RA4=83.211.9.136|RA4=83.211.9.137|RA4=83.211.9.144|RA4=83.211.9.145|RA4=83.233.82.9|RA4=83.233.82.11|RA4=83.233.82.18|RA4=83.233.82.26|RA4=83.233.82.49|RA4=83.233.82.59|RA4=83.233.82.144|RA4=83.233.82.146|RA4=83.233.82.152|RA4=83.233.82.177|RA4=83.233.82.192|RA4=84.46.102.137|RA4=84.46.102.139|RA4=84.46.102.144|RA4=84.46.102.145|RA4=84.46.102.152|RA4=84.46.102.153|RA4=84.53.128.125|RA4=84.53.131.131|RA4=84.53.132.65|RA4=84.53.132.73|RA4=84.53.132.225|RA4=84.53.132.251|RA4=84.53.133.16|RA4=84.53.133.17|RA4=84.53.133.96|RA4=84.53.133.106|RA4=84.53.136.11|RA4=84.53.136.12|RA4=84.53.136.17|RA4=84.53.136.19|RA4=84.53.136.26|RA4=84.53.136.27|RA4=84.53.136.33|RA4=84.53.136.50|RA4=84.53.136.52|RA4=84.53.136.58|RA4=84.53.136.60|RA4=84.53.136.65|RA4=84.53.136.66|RA4=84.53.136.73|RA4=84.53.136.75|RA4=84.53.136.90|RA4=84.53.136.92|RA4=84.53.136.97|RA4=84.53.136.98|RA4=84.53.142.9|RA4=84.53.142.11|RA4=84.53.142.17|RA4=84.53.142.19|RA4=84.53.142.26|RA4=84.53.142.28|RA4=84.53.142.59|RA4=84.53.142.67|RA4=84.53.142.68|RA4=84.53.142.76|RA4=84.53.146.30|RA4=84.53.146.32|RA4=84.53.146.66|RA4=84.53.146.69|RA4=84.53.146.74|RA4=84.53.146.76|RA4=84.53.175.9|RA4=84.53.175.19|RA4=84.53.175.26|RA4=84.53.175.65|RA4=84.53.175.111|RA4=84.91.171.200|RA4=84.91.171.201|RA4=84.91.171.202|RA4=84.91.171.208|RA4=84.91.171.210|RA4=84.91.171.211|RA4=85.14.5.168|RA4=85.14.5.169|RA4=85.14.5.170|RA4=85.31.217.8|RA4=85.31.217.9|RA4=85.31.217.10|RA4=85.92.207.43|RA4=85.92.207.48|RA4=85.92.207.51|RA4=85.205.31.27|RA4=85.205.31.35|RA4=85.205.31.56|RA4=85.205.31.73|RA4=85.205.31.75|RA4=85.239.127.9|RA4=85.239.127.10|RA4=85.239.127.11|RA4=86.120.38.9|RA4=86.120.38.17|RA4=86.120.38.18|RA4=86.120.38.32|RA4=86.120.38.41|RA4=87.102.53.139|RA4=87.102.53.147|RA4=87.243.6.136|RA4=87.243.6.137|RA4=87.243.6.138|RA4=87.243.6.139|RA4=87.243.6.145|RA4=87.243.6.146|RA4=87.244.200.9|RA4=87.244.200.10|RA4=87.244.200.11|RA4=87.244.200.17|RA4=87.244.200.19|RA4=87.245.195.217|RA4=87.245.195.218|RA4=87.245.195.234|RA4=87.245.195.235|RA4=87.245.195.240|RA4=87.245.196.74|RA4=87.245.196.83|RA4=87.245.196.88|RA4=87.245.196.96|RA4=87.245.196.112|RA4=87.245.197.9|RA4=87.245.197.41|RA4=87.245.200.10|RA4=87.245.200.58|RA4=87.245.200.67|RA4=87.245.200.75|RA4=87.245.202.16|RA4=87.245.202.19|RA4=87.245.202.24|RA4=87.245.202.26|RA4=87.245.202.42|RA4=87.245.202.56|RA4=87.245.209.201|RA4=87.245.209.207|RA4=87.245.209.209|RA4=87.245.209.216|RA4=87.245.209.230|RA4=87.245.209.231|RA4=87.245.209.247|RA4=87.245.213.49|RA4=87.245.213.51|RA4=87.245.213.57|RA4=87.245.213.67|RA4=87.245.213.80|RA4=87.245.213.82|RA4=87.245.213.89|RA4=87.245.215.24|RA4=87.245.215.30|RA4=87.245.215.39|RA4=87.245.215.41|RA4=87.245.215.49|RA4=87.245.215.72|RA4=87.245.216.17|RA4=87.245.216.24|RA4=87.245.216.35|RA4=87.245.216.90|RA4=87.245.216.91|RA4=87.245.216.96|RA4=87.245.216.97|RA4=87.245.216.99|RA4=87.245.216.115|RA4=87.245.217.135|RA4=87.245.221.74|RA4=87.245.221.88|RA4=87.245.221.97|RA4=87.245.221.113|RA4=87.245.221.115|RA4=87.245.222.198|RA4=87.245.222.200|RA4=87.245.222.201|RA4=87.245.222.209|RA4=87.251.132.208|RA4=87.251.132.216|RA4=87.251.132.218|RA4=87.251.132.226|RA4=87.251.132.233|RA4=87.251.132.234|RA4=87.251.132.235|RA4=88.150.240.195|RA4=88.201.37.200|RA4=88.201.37.202|RA4=88.201.62.71|RA4=88.201.62.72|RA4=88.201.62.102|RA4=88.201.62.111|RA4=88.216.174.102|RA4=88.216.174.103|RA4=88.216.174.104|RA4=88.217.189.136|RA4=88.217.189.137|RA4=88.217.189.138|RA4=88.217.189.144|RA4=88.217.189.145|RA4=88.217.189.146|RA4=88.220.177.152|RA4=88.220.177.153|RA4=88.220.177.154|RA4=88.220.177.155|RA4=88.220.177.160|RA4=88.221.14.10|RA4=88.221.14.24|RA4=88.221.14.115|RA4=88.221.14.138|RA4=88.221.14.144|RA4=88.221.14.146|RA4=88.221.14.168|RA4=88.221.14.177|RA4=88.221.14.193|RA4=88.221.15.27|RA4=88.221.15.40|RA4=88.221.15.42|RA4=88.221.15.43|RA4=88.221.15.59|RA4=88.221.18.161|RA4=88.221.18.236|RA4=88.221.45.16|RA4=88.221.48.113|RA4=88.221.48.123|RA4=88.221.103.208|RA4=88.221.104.87|RA4=88.221.112.131|RA4=88.221.112.138|RA4=88.221.112.144|RA4=88.221.112.145|RA4=88.221.112.153|RA4=88.221.112.154|RA4=88.221.112.160|RA4=88.221.112.163|RA4=88.221.112.187|RA4=88.221.113.72|RA4=88.221.113.89|RA4=88.221.113.96|RA4=88.221.113.97|RA4=88.221.113.105|RA4=88.221.113.114|RA4=88.221.113.115|RA4=88.221.113.136|RA4=88.221.116.41|RA4=88.221.116.43|RA4=88.221.116.249|RA4=88.221.117.42|RA4=88.221.117.95|RA4=88.221.117.112|RA4=88.221.117.130|RA4=88.221.117.137|RA4=88.221.117.161|RA4=88.221.117.178|RA4=88.221.117.183|RA4=88.221.117.191|RA4=88.221.117.192|RA4=88.221.117.209|RA4=88.221.118.33|RA4=88.221.118.41|RA4=88.221.132.16|RA4=88.221.132.18|RA4=88.221.132.26|RA4=88.221.132.34|RA4=88.221.132.35|RA4=88.221.132.48|RA4=88.221.132.49|RA4=88.221.132.50|RA4=88.221.132.58|RA4=88.221.132.64|RA4=88.221.132.89|RA4=88.221.132.138|RA4=88.221.132.160|RA4=88.221.132.161|RA4=88.221.132.169|RA4=88.221.132.175|RA4=88.221.132.177|RA4=88.221.132.199|RA4=88.221.132.206|RA4=88.221.132.207|RA4=88.221.133.63|RA4=88.221.133.79|RA4=88.221.134.89|RA4=88.221.134.112|RA4=88.221.134.177|RA4=88.221.134.184|RA4=88.221.134.200|RA4=88.221.134.211|RA4=88.221.134.227|RA4=88.221.140.71|RA4=88.221.140.180|RA4=88.221.144.40|RA4=88.221.144.51|RA4=88.221.144.58|RA4=88.221.144.59|RA4=88.221.145.34|RA4=88.221.145.51|RA4=88.221.161.19|RA4=88.221.166.128|RA4=88.221.186.57|RA4=88.221.194.107|RA4=88.221.194.141|RA4=88.221.203.50|RA4=88.221.210.9|RA4=88.221.210.11|RA4=88.221.210.16|RA4=88.221.210.17|RA4=88.221.210.19|RA4=88.221.210.25|RA4=88.221.211.17|RA4=88.221.211.26|RA4=88.221.211.32|RA4=88.221.211.40|RA4=88.221.211.41|RA4=88.221.211.42|RA4=88.221.211.43|RA4=88.221.227.132|RA4=88.221.230.151|RA4=88.221.235.9|RA4=88.221.235.17|RA4=88.221.235.43|RA4=88.221.235.58|RA4=88.221.235.73|RA4=88.221.235.139|RA4=88.221.235.164|RA4=88.221.236.232|RA4=88.221.243.29|RA4=88.221.247.153|RA4=88.221.249.73|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-24|""
""{C30F0E4F-A30B-4BF2-9D91-483325D805DA}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=88.221.5.205|RA4=88.221.48.138|RA4=88.221.48.162|RA4=88.221.52.24|RA4=88.221.52.34|RA4=88.221.52.35|RA4=88.221.52.49|RA4=88.221.52.67|RA4=88.221.52.75|RA4=88.221.52.80|RA4=88.221.52.83|RA4=88.221.52.90|RA4=88.221.52.97|RA4=88.221.77.196|RA4=88.221.87.166|RA4=88.221.87.167|RA4=88.221.87.168|RA4=88.221.87.169|RA4=88.221.87.175|RA4=88.221.87.177|RA4=88.221.88.9|RA4=88.221.88.67|RA4=88.221.89.72|RA4=88.221.89.83|RA4=88.221.89.130|RA4=88.221.89.136|RA4=88.221.89.145|RA4=88.221.89.152|RA4=88.221.92.22|RA4=88.221.92.47|RA4=88.221.92.70|RA4=88.221.93.55|RA4=88.221.93.65|RA4=88.221.93.72|RA4=88.221.93.79|RA4=88.221.93.89|RA4=88.221.93.110|RA4=88.221.93.113|RA4=88.221.97.56|RA4=89.27.131.18|RA4=89.27.131.19|RA4=89.27.131.48|RA4=89.27.131.49|RA4=89.218.19.56|RA4=89.218.19.81|RA4=89.218.19.82|RA4=89.218.19.89|RA4=89.218.19.90|RA4=89.218.19.91|RA4=90.84.49.24|RA4=90.84.49.41|RA4=90.84.49.43|RA4=90.84.49.65|RA4=90.84.49.73|RA4=90.84.50.78|RA4=90.84.50.79|RA4=90.84.50.87|RA4=90.84.50.103|RA4=90.84.50.105|RA4=90.84.50.139|RA4=90.84.50.185|RA4=90.84.53.43|RA4=90.84.53.82|RA4=90.84.55.24|RA4=90.84.55.32|RA4=90.84.55.210|RA4=90.84.55.225|RA4=90.84.59.9|RA4=90.84.59.17|RA4=90.84.59.64|RA4=90.84.59.66|RA4=90.84.59.67|RA4=90.84.59.74|RA4=90.84.59.82|RA4=90.84.59.91|RA4=90.84.59.98|RA4=90.84.59.99|RA4=90.84.59.138|RA4=90.84.59.146|RA4=90.84.59.147|RA4=90.84.59.152|RA4=90.84.59.154|RA4=90.84.136.43|RA4=90.84.136.48|RA4=90.84.136.49|RA4=90.84.136.50|RA4=91.135.34.112|RA4=91.135.34.115|RA4=91.135.34.121|RA4=91.135.34.123|RA4=91.135.34.128|RA4=91.135.34.136|RA4=91.135.34.138|RA4=91.135.34.139|RA4=91.135.35.136|RA4=91.135.35.138|RA4=91.135.35.144|RA4=91.135.35.146|RA4=91.135.35.154|RA4=91.135.35.160|RA4=91.245.214.9|RA4=91.245.214.10|RA4=91.245.214.11|RA4=91.245.214.17|RA4=91.245.214.18|RA4=92.51.99.203|RA4=92.51.99.209|RA4=92.51.99.210|RA4=92.103.108.75|RA4=92.103.108.92|RA4=92.122.0.52|RA4=92.122.10.69|RA4=92.122.15.74|RA4=92.122.25.209|RA4=92.122.41.249|RA4=92.122.44.27|RA4=92.122.44.66|RA4=92.122.44.183|RA4=92.122.47.230|RA4=92.122.48.34|RA4=92.122.48.42|RA4=92.122.48.56|RA4=92.122.48.57|RA4=92.122.48.58|RA4=92.122.49.9|RA4=92.122.49.10|RA4=92.122.49.18|RA4=92.122.49.34|RA4=92.122.49.58|RA4=92.122.49.66|RA4=92.122.49.74|RA4=92.122.49.89|RA4=92.122.49.90|RA4=92.122.49.114|RA4=92.122.49.116|RA4=92.122.49.124|RA4=92.122.49.137|RA4=92.122.49.138|RA4=92.122.49.147|RA4=92.122.49.148|RA4=92.122.49.153|RA4=92.122.49.154|RA4=92.122.49.156|RA4=92.122.49.177|RA4=92.122.51.18|RA4=92.122.51.19|RA4=92.122.51.24|RA4=92.122.51.25|RA4=92.122.51.32|RA4=92.122.51.40|RA4=92.122.51.41|RA4=92.122.51.43|RA4=92.122.51.57|RA4=92.122.51.58|RA4=92.122.51.59|RA4=92.122.51.65|RA4=92.122.51.66|RA4=92.122.60.17|RA4=92.122.82.161|RA4=92.122.88.91|RA4=92.122.90.66|RA4=92.122.90.178|RA4=92.122.93.214|RA4=92.122.94.161|RA4=92.122.109.59|RA4=92.122.122.136|RA4=92.122.122.138|RA4=92.122.122.154|RA4=92.122.122.160|RA4=92.122.122.161|RA4=92.122.124.9|RA4=92.122.130.229|RA4=92.122.131.15|RA4=92.122.137.22|RA4=92.122.139.137|RA4=92.122.148.155|RA4=92.122.149.246|RA4=92.122.157.6|RA4=92.122.160.66|RA4=92.122.161.60|RA4=92.122.167.213|RA4=92.122.172.77|RA4=92.122.173.9|RA4=92.122.177.122|RA4=92.122.180.18|RA4=92.122.180.48|RA4=92.122.180.66|RA4=92.122.182.60|RA4=92.122.187.31|RA4=92.122.188.26|RA4=92.122.188.33|RA4=92.122.188.40|RA4=92.122.188.43|RA4=92.122.188.66|RA4=92.122.188.67|RA4=92.122.188.81|RA4=92.122.188.88|RA4=92.122.188.89|RA4=92.122.188.104|RA4=92.122.188.105|RA4=92.122.188.106|RA4=92.122.188.122|RA4=92.122.188.129|RA4=92.122.190.8|RA4=92.122.190.17|RA4=92.122.200.31|RA4=92.122.200.126|RA4=92.122.201.61|RA4=92.122.203.247|RA4=92.122.207.66|RA4=92.122.207.80|RA4=92.122.214.83|RA4=92.122.214.88|RA4=92.122.214.216|RA4=92.122.214.217|RA4=92.122.214.227|RA4=92.122.214.232|RA4=92.122.214.234|RA4=92.122.222.96|RA4=92.122.223.114|RA4=92.122.226.112|RA4=92.122.226.137|RA4=92.122.226.187|RA4=92.122.226.202|RA4=92.122.226.203|RA4=92.122.226.224|RA4=92.122.241.211|RA4=92.122.246.161|RA4=92.123.7.153|RA4=92.123.36.89|RA4=92.123.37.48|RA4=92.123.54.120|RA4=92.123.64.192|RA4=92.123.64.200|RA4=92.123.64.216|RA4=92.123.65.8|RA4=92.123.72.89|RA4=92.123.72.96|RA4=92.123.72.103|RA4=92.123.72.104|RA4=92.123.72.111|RA4=92.123.73.11|RA4=92.123.73.42|RA4=92.123.73.50|RA4=92.123.73.57|RA4=92.123.73.58|RA4=92.123.73.59|RA4=92.123.73.64|RA4=92.123.73.66|RA4=92.123.85.12|RA4=92.123.100.233|RA4=92.123.149.47|RA4=92.123.151.113|RA4=92.123.155.24|RA4=92.123.155.26|RA4=92.123.155.27|RA4=92.123.155.154|RA4=92.123.155.156|RA4=92.123.157.73|RA4=92.123.177.234|RA4=92.123.180.137|RA4=92.123.180.138|RA4=92.123.180.145|RA4=92.123.180.154|RA4=92.123.180.177|RA4=92.123.180.179|RA4=92.123.180.185|RA4=92.123.180.186|RA4=92.123.180.187|RA4=92.123.180.195|RA4=92.123.180.201|RA4=92.123.182.27|RA4=92.123.182.41|RA4=92.123.182.43|RA4=92.123.182.58|RA4=92.123.185.199|RA4=92.123.186.228|RA4=92.123.187.168|RA4=92.123.194.139|RA4=92.123.194.153|RA4=92.123.194.164|RA4=92.123.194.180|RA4=92.123.212.25|RA4=92.123.224.10|RA4=92.123.224.12|RA4=92.123.224.26|RA4=92.123.224.59|RA4=92.123.224.75|RA4=92.123.224.105|RA4=92.123.224.115|RA4=92.123.224.129|RA4=92.123.224.147|RA4=92.123.224.154|RA4=92.123.224.161|RA4=92.123.224.179|RA4=92.123.224.195|RA4=92.123.224.203|RA4=92.123.224.233|RA4=92.123.224.250|RA4=92.123.225.83|RA4=92.123.225.89|RA4=92.123.225.97|RA4=92.123.225.104|RA4=92.123.225.105|RA4=92.123.225.128|RA4=92.123.225.136|RA4=92.123.225.137|RA4=92.123.225.144|RA4=92.123.225.243|RA4=92.123.226.139|RA4=92.123.226.144|RA4=92.123.227.25|RA4=92.123.227.66|RA4=92.123.227.90|RA4=92.123.227.96|RA4=92.123.227.97|RA4=92.123.227.104|RA4=92.197.129.9|RA4=92.197.129.11|RA4=92.197.129.16|RA4=92.197.129.17|RA4=92.197.129.19|RA4=92.197.129.25|RA4=92.197.129.26|RA4=92.197.129.34|RA4=92.242.140.20|RA4=92.242.144.2|RA4=93.92.66.9|RA4=93.92.66.11|RA4=93.92.66.24|RA4=93.92.66.25|RA4=93.92.66.27|RA4=93.92.66.41|RA4=93.92.66.43|RA4=93.158.110.210|RA4=93.158.110.227|RA4=93.158.110.233|RA4=93.158.110.234|RA4=93.158.110.240|RA4=93.158.110.242|RA4=93.158.111.8|RA4=93.159.159.233|RA4=93.159.159.235|RA4=93.159.159.240|RA4=93.159.159.241|RA4=93.159.159.243|RA4=93.179.210.168|RA4=93.179.210.169|RA4=93.179.210.170|RA4=93.179.210.171|RA4=93.179.210.176|RA4=93.184.215.200|RA4=93.184.215.201|RA4=93.186.137.136|RA4=93.186.137.139|RA4=93.186.137.144|RA4=93.186.137.145|RA4=93.186.137.147|RA4=93.186.137.154|RA4=93.191.15.144|RA4=93.191.15.146|RA4=93.191.15.147|RA4=93.191.15.153|RA4=93.191.15.154|RA4=93.191.15.160|RA4=93.191.15.161|RA4=93.191.15.168|RA4=94.21.255.199|RA4=94.21.255.206|RA4=94.21.255.215|RA4=94.21.255.223|RA4=94.21.255.232|RA4=94.21.255.233|RA4=94.21.255.238|RA4=94.128.0.105|RA4=94.128.0.106|RA4=94.128.0.107|RA4=94.245.121.176|RA4=94.245.121.177|RA4=94.245.121.178|RA4=94.245.121.179|RA4=94.245.201.136|RA4=94.245.201.138|RA4=94.245.201.144|RA4=94.246.183.18|RA4=94.246.183.19|RA4=94.246.183.25|RA4=94.246.183.27|RA4=94.246.183.33|RA4=95.100.2.136|RA4=95.100.6.54|RA4=95.100.9.63|RA4=95.100.15.126|RA4=95.100.39.8|RA4=95.100.40.22|RA4=95.100.48.191|RA4=95.100.50.224|RA4=95.100.60.71|RA4=95.100.60.96|RA4=95.100.64.156|RA4=95.100.83.190|RA4=95.100.88.242|RA4=95.100.97.19|RA4=95.100.97.41|RA4=95.100.97.43|RA4=95.100.97.48|RA4=95.100.114.17|RA4=95.100.120.28|RA4=95.100.120.76|RA4=95.100.137.52|RA4=95.100.138.94|RA4=95.100.166.161|RA4=95.100.177.217|RA4=95.100.181.33|RA4=95.100.184.88|RA4=95.100.184.109|RA4=95.100.185.63|RA4=95.100.186.147|RA4=95.100.190.7|RA4=95.100.190.232|RA4=95.100.206.217|RA4=95.100.219.218|RA4=95.100.226.195|RA4=95.100.236.244|RA4=95.100.237.213|RA4=95.100.244.72|RA4=95.100.248.88|RA4=95.100.248.104|RA4=95.100.248.107|RA4=95.100.248.122|RA4=95.100.248.136|RA4=95.100.248.152|RA4=95.100.248.153|RA4=95.101.0.128|RA4=95.101.0.145|RA4=95.101.1.113|RA4=95.101.1.153|RA4=95.101.1.185|RA4=95.101.1.202|RA4=95.101.1.203|RA4=95.101.1.218|RA4=95.101.2.32|RA4=95.101.2.34|RA4=95.101.2.42|RA4=95.101.2.80|RA4=95.101.6.161|RA4=95.101.10.161|RA4=95.101.31.69|RA4=95.101.34.26|RA4=95.101.34.34|RA4=95.101.34.43|RA4=95.101.34.58|RA4=95.101.34.73|RA4=95.101.34.88|RA4=95.101.56.119|RA4=95.101.58.170|RA4=95.101.64.157|RA4=95.101.66.212|RA4=95.101.67.118|RA4=95.101.69.152|RA4=95.101.71.215|RA4=95.101.72.11|RA4=95.101.72.50|RA4=95.101.72.51|RA4=95.101.72.66|RA4=95.101.72.113|RA4=95.101.72.123|RA4=95.101.72.130|RA4=95.101.72.192|RA4=95.101.72.215|RA4=95.101.112.16|RA4=95.101.112.27|RA4=95.101.112.34|RA4=95.101.112.41|RA4=95.101.112.43|RA4=95.101.112.58|RA4=95.101.125.178|RA4=95.101.128.154|RA4=95.101.128.193|RA4=95.101.128.195|RA4=95.101.129.64|RA4=95.101.129.106|RA4=95.101.129.112|RA4=95.101.129.120|RA4=95.101.142.50|RA4=95.101.142.97|RA4=95.101.142.98|RA4=95.101.153.20|RA4=95.101.154.161|RA4=95.101.156.229|RA4=95.101.157.12|RA4=95.101.162.161|RA4=95.101.166.161|RA4=95.101.183.146|RA4=95.101.183.176|RA4=95.101.201.104|RA4=95.101.204.169|RA4=95.101.232.212|RA4=95.101.241.189|RA4=95.101.244.134|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-25|""
""{022B8525-7E28-4607-8F63-4D4FAE7900CB}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=95.101.72.80|RA4=95.101.72.82|RA4=95.101.78.48|RA4=95.101.78.98|RA4=95.101.78.120|RA4=95.101.80.19|RA4=95.101.80.32|RA4=95.101.80.35|RA4=95.101.80.75|RA4=95.101.80.96|RA4=95.101.80.128|RA4=95.101.80.129|RA4=95.101.82.18|RA4=95.101.82.19|RA4=95.101.82.58|RA4=95.101.82.59|RA4=95.101.82.72|RA4=95.101.82.74|RA4=95.101.82.75|RA4=95.101.82.88|RA4=95.101.88.83|RA4=95.101.88.136|RA4=95.101.89.33|RA4=95.101.89.81|RA4=95.101.89.83|RA4=95.101.89.104|RA4=95.101.89.153|RA4=95.101.89.193|RA4=95.101.89.243|RA4=95.101.90.16|RA4=95.101.90.72|RA4=95.101.90.96|RA4=95.101.90.115|RA4=95.101.90.195|RA4=95.101.90.224|RA4=95.101.90.227|RA4=95.101.90.233|RA4=95.101.94.161|RA4=95.101.98.161|RA4=95.136.31.16|RA4=95.136.31.25|RA4=95.136.31.30|RA4=95.136.31.46|RA4=95.136.31.49|RA4=95.136.31.57|RA4=95.158.146.200|RA4=95.158.146.201|RA4=95.158.146.208|RA4=95.158.146.211|RA4=95.158.146.216|RA4=95.158.146.217|RA4=95.158.146.224|RA4=95.158.146.226|RA4=95.158.146.232|RA4=95.158.146.234|RA4=95.158.146.235|RA4=95.158.146.240|RA4=95.158.146.241|RA4=95.173.210.72|RA4=95.173.210.74|RA4=95.173.210.75|RA4=95.180.157.139|RA4=95.180.157.163|RA4=95.180.157.177|RA4=95.180.157.185|RA4=95.180.157.186|RA4=95.180.157.193|RA4=96.6.13.218|RA4=96.6.35.194|RA4=96.6.48.183|RA4=96.6.52.161|RA4=96.6.54.233|RA4=96.6.57.18|RA4=96.6.61.146|RA4=96.6.72.12|RA4=96.6.102.16|RA4=96.6.113.152|RA4=96.6.113.162|RA4=96.6.113.169|RA4=96.6.113.184|RA4=96.6.113.210|RA4=96.6.113.218|RA4=96.6.113.233|RA4=96.6.122.10|RA4=96.6.122.41|RA4=96.6.122.144|RA4=96.6.122.184|RA4=96.6.122.208|RA4=96.6.122.216|RA4=96.6.122.218|RA4=96.6.123.18|RA4=96.6.123.24|RA4=96.6.157.139|RA4=96.6.184.41|RA4=96.6.186.96|RA4=96.6.200.185|RA4=96.6.201.164|RA4=96.6.213.40|RA4=96.6.218.144|RA4=96.6.221.85|RA4=96.6.239.206|RA4=96.7.0.49|RA4=96.7.41.26|RA4=96.7.41.90|RA4=96.7.51.16|RA4=96.7.51.41|RA4=96.7.51.51|RA4=96.7.53.110|RA4=96.7.54.10|RA4=96.7.54.18|RA4=96.7.54.73|RA4=96.7.54.74|RA4=96.7.102.238|RA4=96.7.106.73|RA4=96.7.119.210|RA4=96.7.143.65|RA4=96.7.160.46|RA4=96.7.178.15|RA4=96.7.178.125|RA4=96.7.182.54|RA4=96.7.202.136|RA4=96.7.206.54|RA4=96.7.221.16|RA4=96.7.229.109|RA4=96.7.233.20|RA4=96.16.6.122|RA4=96.16.6.131|RA4=96.16.6.136|RA4=96.16.6.152|RA4=96.16.7.19|RA4=96.16.7.25|RA4=96.16.7.42|RA4=96.16.7.49|RA4=96.16.7.51|RA4=96.16.7.66|RA4=96.16.7.83|RA4=96.16.41.63|RA4=96.16.58.239|RA4=96.16.67.226|RA4=96.16.98.16|RA4=96.16.98.17|RA4=96.16.98.18|RA4=96.16.98.19|RA4=96.16.98.26|RA4=96.16.98.27|RA4=96.16.98.112|RA4=96.16.137.34|RA4=96.16.140.94|RA4=96.16.144.23|RA4=96.16.162.161|RA4=96.16.170.161|RA4=96.16.189.93|RA4=96.16.196.124|RA4=96.16.216.162|RA4=96.16.218.110|RA4=96.16.218.122|RA4=96.16.231.32|RA4=96.16.247.140|RA4=96.17.1.61|RA4=96.17.8.59|RA4=96.17.8.73|RA4=96.17.8.75|RA4=96.17.8.89|RA4=96.17.8.137|RA4=96.17.8.152|RA4=96.17.10.9|RA4=96.17.10.19|RA4=96.17.10.24|RA4=96.17.10.32|RA4=96.17.10.33|RA4=96.17.10.34|RA4=96.17.10.35|RA4=96.17.10.40|RA4=96.17.10.43|RA4=96.17.10.51|RA4=96.17.10.59|RA4=96.17.10.73|RA4=96.17.15.18|RA4=96.17.15.40|RA4=96.17.15.48|RA4=96.17.15.51|RA4=96.17.15.90|RA4=96.17.15.99|RA4=96.17.39.164|RA4=96.17.49.20|RA4=96.17.54.142|RA4=96.17.68.106|RA4=96.17.68.120|RA4=96.17.70.235|RA4=96.17.72.8|RA4=96.17.72.10|RA4=96.17.72.11|RA4=96.17.72.16|RA4=96.17.72.18|RA4=96.17.86.86|RA4=96.17.108.105|RA4=96.17.108.106|RA4=96.17.108.131|RA4=96.17.108.155|RA4=96.17.109.137|RA4=96.17.109.139|RA4=96.17.109.145|RA4=96.17.109.154|RA4=96.17.111.11|RA4=96.17.111.25|RA4=96.17.111.41|RA4=96.17.111.48|RA4=96.17.111.75|RA4=96.17.111.88|RA4=96.17.151.19|RA4=96.17.151.25|RA4=96.17.151.33|RA4=96.17.151.34|RA4=96.17.151.40|RA4=96.17.151.41|RA4=96.17.151.49|RA4=96.17.151.140|RA4=96.17.151.147|RA4=96.17.151.148|RA4=96.17.151.182|RA4=96.17.153.8|RA4=96.17.153.10|RA4=96.17.153.11|RA4=96.17.153.18|RA4=96.17.153.35|RA4=96.17.153.43|RA4=96.17.163.25|RA4=96.17.163.82|RA4=96.17.163.88|RA4=96.17.163.98|RA4=96.17.164.138|RA4=96.17.164.160|RA4=96.17.170.11|RA4=96.17.170.25|RA4=96.17.170.32|RA4=96.17.177.8|RA4=96.17.177.9|RA4=96.17.177.17|RA4=96.17.177.19|RA4=96.17.177.24|RA4=96.17.177.25|RA4=96.17.177.26|RA4=96.17.182.10|RA4=96.17.182.16|RA4=96.17.182.32|RA4=96.17.182.40|RA4=96.17.182.42|RA4=96.17.182.48|RA4=96.17.182.51|RA4=96.17.182.114|RA4=96.17.185.49|RA4=96.17.194.189|RA4=96.17.199.34|RA4=96.17.199.57|RA4=96.17.202.49|RA4=96.17.202.56|RA4=96.17.202.58|RA4=96.17.202.81|RA4=96.17.202.177|RA4=96.17.202.185|RA4=96.17.202.192|RA4=96.17.202.193|RA4=96.17.202.195|RA4=96.17.202.200|RA4=96.17.202.203|RA4=96.17.202.209|RA4=96.17.202.210|RA4=96.17.203.25|RA4=96.17.203.26|RA4=96.17.203.51|RA4=96.17.203.58|RA4=96.17.203.98|RA4=96.17.203.128|RA4=96.17.203.129|RA4=96.17.203.131|RA4=96.17.203.136|RA4=96.17.203.147|RA4=96.17.204.51|RA4=96.17.206.116|RA4=96.17.213.12|RA4=96.17.232.190|RA4=96.17.238.176|RA4=96.17.240.39|RA4=96.17.242.11|RA4=96.17.250.27|RA4=96.17.251.81|RA4=97.65.93.72|RA4=97.65.93.73|RA4=97.65.93.74|RA4=97.65.93.80|RA4=97.65.93.82|RA4=97.65.93.97|RA4=97.67.101.72|RA4=97.67.101.75|RA4=97.67.101.81|RA4=97.67.101.88|RA4=97.67.101.89|RA4=97.75.178.201|RA4=97.75.178.202|RA4=97.75.178.203|RA4=97.75.178.209|RA4=97.75.178.211|RA4=97.75.178.216|RA4=98.124.243.41|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-26|""
""{FFD21C6F-09D0-4438-A05F-F65613A6A47D}""=""v2.30|Action=Block|Active=TRUE|Dir=Out|RA4=13.78.232.226|RA4=13.92.194.212|RA4=40.77.226.249|RA4=40.77.226.250|RA4=52.178.38.151|RA4=52.183.114.173|RA4=52.229.39.152|RA4=62.157.140.133|RA4=64.4.6.100|RA4=64.4.54.22|RA4=64.4.54.32|RA4=64.4.54.253|RA4=64.4.54.254|RA4=65.52.100.7|RA4=65.52.100.9|RA4=65.52.100.11|RA4=65.52.100.91|RA4=65.52.100.92|RA4=65.52.100.94|RA4=65.52.108.29|RA4=65.52.108.153|RA4=65.52.108.154|RA4=65.52.161.64|RA4=65.55.39.10|RA4=65.55.44.108|RA4=65.55.44.109|RA4=65.55.83.120|RA4=65.55.130.50|RA4=65.55.138.110|RA4=65.55.176.90|RA4=65.55.252.43|RA4=65.55.252.63|RA4=65.55.252.71|RA4=65.55.252.92|RA4=65.55.252.93|RA4=66.119.147.131|RA4=80.156.86.78|RA4=81.200.64.50|RA4=92.242.140.20|RA4=111.221.29.177|RA4=111.221.29.253|RA4=111.221.29.254|RA4=128.63.2.53|RA4=131.253.14.153|RA4=131.253.40.37|RA4=134.170.52.151|RA4=134.170.115.60|RA4=134.170.185.70|RA4=134.170.188.248|RA4=156.154.112.36|RA4=156.154.113.36|RA4=157.55.129.21|RA4=157.56.57.5|RA4=157.56.74.250|RA4=157.56.91.77|RA4=157.56.121.89|RA4=157.56.149.250|RA4=168.61.24.141|RA4=168.62.187.13|RA4=168.63.108.233|RA4=191.232.139.253|RA4=191.232.139.254|RA4=192.58.128.30|RA4=193.58.251.1|RA4=195.46.39.1|RA4=198.105.244.74|RA4=198.105.254.74|RA4=207.46.114.61|RA4=207.46.223.94|RA4=207.68.166.254|RA4=218.28.144.37|Name=W10Privacy-Block-Microsoft-IPs-used-for-telemetry-data-delivery-LIGHT-1|""


" | Out-Null
reg import $ENV:temp\Firewall_Telemetry.reg | Out-Null

# Firewall Security Policy
$ErrorActionPreference = "silentlycontinue"
New-Item $ENV:temp\Firewall_Security.reg -ItemType File  -Value "Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile]
""EnableFirewall""=dword:00000001
""DoNotAllowExceptions""=dword:00000001
""DisableNotifications""=dword:00000001
""DisableUnicastResponsesToMulticastBroadcast""=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\IcmpSettings]
""AllowOutboundDestinationUnreachable""=dword:00000000
""AllowOutboundSourceQuench""=dword:00000000
""AllowRedirect""=dword:00000000
""AllowInboundEchoRequest""=dword:00000000
""AllowInboundRouterRequest""=dword:00000000
""AllowOutboundTimeExceeded""=dword:00000000
""AllowOutboundParameterProblem""=dword:00000000
""AllowInboundTimestampRequest""=dword:00000000
""AllowInboundMaskRequest""=dword:00000000
""AllowOutboundPacketTooBig""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging]
""LogDroppedPackets""=dword:00000000
""LogSuccessfulConnections""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\RemoteAdminSettings]
""Enabled""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Services\FileAndPrint]
""Enabled""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Services\RemoteDesktop]
""Enabled""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Services\UPnPFramework]
""Enabled""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile]
""EnableFirewall""=dword:00000001
""DoNotAllowExceptions""=dword:00000001
""DisableNotifications""=dword:00000001
""DisableUnicastResponsesToMulticastBroadcast""=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings]
""AllowOutboundDestinationUnreachable""=dword:00000000
""AllowOutboundSourceQuench""=dword:00000000
""AllowRedirect""=dword:00000000
""AllowInboundEchoRequest""=dword:00000000
""AllowInboundRouterRequest""=dword:00000000
""AllowOutboundTimeExceeded""=dword:00000000
""AllowOutboundParameterProblem""=dword:00000000
""AllowInboundTimestampRequest""=dword:00000000
""AllowInboundMaskRequest""=dword:00000000
""AllowOutboundPacketTooBig""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\Logging]
""LogDroppedPackets""=dword:00000000
""LogSuccessfulConnections""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\RemoteAdminSettings]
""Enabled""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\Services\FileAndPrint]
""Enabled""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\Services\RemoteDesktop]
""Enabled""=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\Services\UPnPFramework]
""Enabled""=dword:00000000

" | Out-Null
reg import $ENV:temp\Firewall_Security.reg | Out-Null

# Power Plans
curl.exe -s "https://drive.google.com/u/0/uc?id=15XK_rri-gXMeym8ZbuL7JRPI41Yen4js&export=download" -o "$ENV:temp\Power Saver + High Performance Power Plan.bat"
Start-Process "$ENV:temp\Power Saver + High Performance Power Plan.bat" | Out-Null
Write-Output "Done"

# Enable F8 Boot Menu Options
Write-Output "Enabling F8 Boot Menu Options..."
bcdedit /set `{current`} bootmenupolicy Legacy | Out-Null
Write-Output "Done"

# Show Task Manager Details - Applicable since 1607
Write-Output "Showing Task Manager Details..."
$taskmgr = Start-Process -WindowStyle Hidden -FilePath taskmgr.exe -PassThru | Out-Null
$timeout = 30000
$sleep = 100
Do {
Start-Sleep -Milliseconds $sleep
$timeout -= $sleep
$preferences = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -ErrorAction SilentlyContinue
} Until ($preferences -or $timeout -le 0)
Stop-Process $taskmgr
If ($preferences) {
$preferences.Preferences[28] = 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Type Binary -Value $preferences.Preferences | Out-Null
}
Write-Output "Done"

# Tells Windows to Stop Splitting Background Services (Requires Restart)
$ram = (Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1kb
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Type DWord -Value $ram -Force | Out-Null

$autoLoggerDir = "$env:PROGRAMDATA\Microsoft\Diagnosis\ETLLogs\AutoLogger"
If (Test-Path "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl") {
    Remove-Item "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl" | Out-Null
}
icacls $autoLoggerDir /deny SYSTEM:`(OI`)`(CI`)F | Out-Null

<# 
# Install Process Lasso
Write-Output "Installling Process Lasso..."
curl.exe -s "https://drive.google.com/u/0/uc?id=1blJ07SiPW1YzYDfZEti6YaF46DPggt25&export=download" -o $ENV:temp\prolasso.ini
curl.exe -s "https://dl.bitsum.com/files/processlassosetup64.exe" -o $ENV:temp\processlassosetup64.exe
Start-Process $ENV:temp\processlassosetup64.exe -ArgumentList "/S /gui_start_type=manual,uac /governor_start_type=all /launch_gui=false /importconfigfrom=$ENV:temp\prolasso.ini" | Out-Null
Write-Output "Done"
 #>
# Raise UAC Level
Write-Output "Raising UAC Level..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 5 | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 1 | Out-Null
Write-Output "Done"
<# 
# Restart Computer
Restart-Computer
 #>
