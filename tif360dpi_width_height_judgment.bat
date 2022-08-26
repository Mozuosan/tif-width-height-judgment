@echo off

SETLOCAL enabledelayedexpansion

for %%f in (*.tif) do (
  REM âÊëúÇÃècïùÇéÊìæ
  for /F %%i in ('identify -format "%%h" "%%f"') do set height=%%i

  REM âÊëúÇÃâ°ïùÇéÊìæ
  for /F %%i in ('identify -format "%%w" "%%f"') do set width=%%i

  if !height! GEQ !width! (
    REM ècïù >= â°ïù
    if !height! LEQ 5159 move "%%f" "C:\Users\USER_NAME\Desktop\B4_test" > nul 2>&1
    if !height! LEQ 5953 move "%%f" "C:\Users\USER_NAME\Desktop\A3_test" > nul 2>&1
    if !height! GTR 5953 move "%%f" "C:\Users\USER_NAME\Desktop\nobi_test" > nul 2>&1
  ) else (
    REM ècïù < â°ïù
    if !width! LEQ 5159 move "%%f" "C:\Users\USER_NAME\Desktop\B4_test" > nul 2>&1
    if !width! LEQ 5953 move "%%f" "C:\Users\USER_NAME\Desktop\A3_test" > nul 2>&1
    if !width! GTR 5953 move "%%f" "C:\Users\USER_NAME\Desktop\nobi_test" > nul 2>&1
  )
)

ENDLOCAL

rem pause