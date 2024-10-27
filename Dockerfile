# Gunakan image dasar Windows
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install PowerShell
SHELL ["powershell", "-Command"]

# Unduh dan ekstrak ngrok
RUN Invoke-WebRequest https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip -OutFile ngrok.zip; \
    Expand-Archive ngrok.zip -DestinationPath ngrok; \
    Remove-Item ngrok.zip

# Set variabel lingkungan untuk ngrok dari variabel Railway
ARG NGROK_AUTH_TOKEN
RUN .\ngrok\ngrok.exe authtoken $Env:NGROK_AUTH_TOKEN

# Jalankan ngrok
CMD .\ngrok\ngrok.exe tcp 3389
