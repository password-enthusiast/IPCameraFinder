@echo off
:generateIP
set /a oct1=%random% %% 256
set /a oct2=%random% %% 256
set /a oct3=%random% %% 256
set /a oct4=%random% %% 256

if %oct1%==10 (
    goto generateIP
) else if %oct1%==172 (
    if %oct2% geq 16 if %oct2% leq 31 (
        goto generateIP
    )
) else if %oct1%==192 (
    if %oct2%==168 (
        goto generateIP
    )
)

setx targetip=%oct1%.%oct2%.%oct3%.%oct4%


