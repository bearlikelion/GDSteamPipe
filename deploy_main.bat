@ECHO OFF
builder\steamcmd.exe +login <YOUR USERNAME> <YOUR PASSWORD> +run_app_build ..\scripts\app_APPID.vdf +quit
