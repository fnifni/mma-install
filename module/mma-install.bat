@echo off
powershell -ExecutionPolicy RemoteSigned -File %~dp0\reg.ps1
%~dp0\setup.exe /passive ADD_OPINSIGHTS_WORKSPACE=1 OPINSIGHTS_WORKSPACE_ID=<ワークスペースIDに置替> OPINSIGHTS_WORKSPACE_KEY=<主キーに置替> AcceptEndUserLicenseAgreement=1
