@echo off
rem This file is automatically generated.

if "%1" == "run" goto run
if "%1" == "long" goto long
goto run

:run
@echo on
@echo '=========== 50%, 50%, 50%'
ruby .\tomoe.rb 1000 | ruby ..\count.rb
@echo '=========== 50%, 45%, 55%'
ruby .\tomoe.rb -p=50,45,55 1000 | ruby ..\count.rb
@echo '=========== 50%, 40%, 60%'
ruby .\tomoe.rb -p=50,40,60 1000 | ruby ..\count.rb
@echo '=========== 50%, 35%, 65%'
ruby .\tomoe.rb -p=50,35,65 1000 | ruby ..\count.rb
@echo '=========== 50%, 30%, 70%'
ruby .\tomoe.rb -p=50,30,70 1000 | ruby ..\count.rb
@echo off
goto end

:long
@echo on
@echo '=========== 50%, 50%, 50%'
ruby .\tomoe.rb 100000 | ruby ..\count.rb
@echo '=========== 50%, 45%, 55%'
ruby .\tomoe.rb -p=50,45,55 100000 | ruby ..\count.rb
@echo '=========== 50%, 40%, 60%'
ruby .\tomoe.rb -p=50,40,60 100000 | ruby ..\count.rb
@echo '=========== 50%, 35%, 65%'
ruby .\tomoe.rb -p=50,35,65 100000 | ruby ..\count.rb
@echo '=========== 50%, 30%, 70%'
ruby .\tomoe.rb -p=50,30,70 100000 | ruby ..\count.rb
@echo off
goto end

:end
