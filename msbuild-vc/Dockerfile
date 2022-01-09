# escape=`
ARG BASETAG=20H2
FROM mcr.microsoft.com/windows:${BASETAG}

RUN powershell -NoProfile -ExecutionPolicy Bypass `
  -Command "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
RUN choco install -y visualstudio2017buildtools visualstudio2017-workload-vctools
RUN choco install -y visualstudio2019buildtools visualstudio2019-workload-vctools
RUN choco install -y visualstudio2022buildtools visualstudio2022-workload-vctools
