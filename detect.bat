set "foundkeyword=false"

curl %targetip% > templog.txt

for %%k in (%camstreamkeywords%) do (
    findstr /i "%%k" templog.txt
    if !errorlevel! equ 0 (set "foundkeyword=true")
)

if "!foundKeyword!" == "true" (
    echo =============================%targetip%================================= >> permlog.txt
    type templog.txt >> permlog.txt
    nmap -p 80,554,8080,8081,1024,1026 -sV --script rtsp-url-brute,http-title -T4 %targetip% >> permlog.txt
) 
