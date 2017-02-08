@if "%SCM_TRACE_LEVEL%" NEQ "4" @echo off

:: 1. SET
:: ----------------------
:: Post Deploy Script
:: Version: 1.0.0
:: Martin Schray
:: Execute the build steps for Stationfy
:: ----------------------

echo "**********************"
echo "Post Deployment Script"
echo "**********************"
pushd "%DEPLOYMENT_TARGET%"
:: rm -rf public && npm run build:imgs && npm run build:html && npm run config:prd && npm run build:js && npm run build:embed && npm run build:vendors && npm run build:icons && npm run build:manifest && npm run build:css && npm run postbuild:css && "D:\\Program Files (x86)\\nodejs\\6.2.2\node" hashmark.js
npm run build
IF !ERRORLEVEL! NEQ 0 goto error
popd

echo "Custom postdeploy.cmd completed ...\n\n"

goto end

:: Execute command routine that will echo out when error
:ExecuteCmd
setlocal
set _CMD_=%*
call %_CMD_%
if "%ERRORLEVEL%" NEQ "0" echo Failed exitCode=%ERRORLEVEL%, command=%_CMD_%
exit /b %ERRORLEVEL%

:error
endlocal
echo An error has occurred during web site deployment.
call :exitSetErrorLevel
call :exitFromFunction 2>nul

:exitSetErrorLevel
exit /b 1

:exitFromFunction
()

:end
endlocal
echo Finished successfully.
