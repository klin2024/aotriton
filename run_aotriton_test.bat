@echo off
setlocal

call C:\Develop\.venv\Scripts\activate

@REM set ROCM_PATH=C:/Develop/.venv/Lib/site-packages/_rocm_sdk_devel
@REM set ROCM_DIR=%ROCM_PATH%
@REM set HIP_PATH=%ROCM_PATH%
@REM set HIP_DIR=%ROCM_PATH%
@REM set PATH=%ROCM_PATH%/bin;%PATH%
@REM set HIP_CLANG_PATH=%ROCM_PATH%/lib/llvm/bin/
@REM set HIP_DEVICE_LIB_PATH=%ROCM_PATH%/lib/llvm/amdgcn/bitcode
@REM set PYTORCH_ROCM_ARCH=gfx1151


set PYTHONPATH=C:/opt/aotriton/Release/lib
set PATH=C:/opt/aotriton/Release/lib;%PATH%

python test/test_forward_attention_direct.py

endlocal


