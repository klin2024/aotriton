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

set PYTHONPATH=C:/opt/aotriton/Release/lib


python test/test_forward_attention_direct.py

endlocal


