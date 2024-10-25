set "foundkeyword=false"

curl -s %targetip% > templog.txt

for %%k in (%camstreamkeywords%) do (
    findstr /i "%%k" templog.txt
    if !errorlevel! equ 0 (set "foundkeyword=true")
)

if "!foundKeyword!" == "true" (
    echo =============================%targetip%================================= >> permlog.txt
    type templog.txt >> permlog.txt
) 
