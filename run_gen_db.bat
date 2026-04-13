@echo off
setlocal

set ROCM_PATH=C:/Develop/.venv/Lib/site-packages/_rocm_sdk_devel
set ROCM_DIR=%ROCM_PATH%
set HIP_PATH=%ROCM_PATH%
set HIP_DIR=%ROCM_PATH%
set PATH=%ROCM_PATH%/bin;%PATH%
set HIP_CLANG_PATH=%ROCM_PATH%/lib/llvm/bin/
set HIP_DEVICE_LIB_PATH=%ROCM_PATH%/lib/llvm/amdgcn/bitcode
set PYTORCH_ROCM_ARCH=gfx1151

set CPPTUNE_SKIP_KERNELS=bwd_kernel_dk_dv,bwd_kernel_dq,bwd_kernel_fuse
@REM set CPPTUNE_SKIP_KERNELS=
set PYTHONPATH=C:/opt/aotriton-tunning/Release/lib
set PATH=C:/opt/aotriton-tunning/Release/lib;%PATH%

@REM del v2python\rules\tuning_database.sqlite3
@REM del v2python\rules\tuning_database-q.sqlite3
@REM del v2python\rules\tuning_database-k.sqlite3
@REM del v2python\rules\tuning_database-qq.sqlite3

@REM python v2python/table_tool.py --ignore_id --action rawjson -k FLASH -f v2python/rules/tuning_database-k.sqlite3 -i ./gfx1151-aotriton-fwd-k-96.json
@REM python v2python/table_tool.py --ignore_id --action rawjson -k FLASH -f v2python/rules/tuning_database-q.sqlite3 -i ./gfx1151-aotriton-fwd-q-96.json
@REM python v2python/table_tool.py --ignore_id --action rawjson -k FLASH -f v2python/rules/tuning_database-qq.sqlite3 -i ./gfx1151-aotriton-fwd-qq-96.json




powershell -Command "(Get-Content 'gfx1151-aotriton-fwd-8192.json') | Where-Object { $_ -notmatch 'hipErrorNoBinaryForGpu' } | Set-Content 'gfx1151-aotriton-fwd-8192.json'"

@REM python v2python/table_tool.py --ignore_id --action rawjson -k FLASH -f v2python/rules/tuning_database.sqlite3 -i ./gfx1151-aotriton-fwd-8192.json
mkdir v3python\database-finetune
python v2python/table_tool.py --ignore_id --action rawjson -k FLASH -f v3python/database-finetune/tuning_database.sqlite3 -i ./gfx1151-aotriton-fwd-8192.json


endlocal


