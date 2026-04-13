@echo off
setlocal

call "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvarsall.bat" x64

set ROCM_PATH=C:/Develop/.venv/Lib/site-packages/_rocm_sdk_devel
set ROCM_DIR=%ROCM_PATH%
set HIP_PATH=%ROCM_PATH%
set HIP_DIR=%ROCM_PATH%
set PATH=%ROCM_PATH%/bin;%PATH%
set HIP_CLANG_PATH=%ROCM_PATH%/lib/llvm/bin/
set HIP_DEVICE_LIB_PATH=%ROCM_PATH%/lib/llvm/amdgcn/bitcode
set PYTORCH_ROCM_ARCH=gfx1151

set PYTHONPATH=C:/opt/aotriton/Release/lib
set PATH=C:/opt/aotriton/Release/lib;%PATH%

chcp 65001
set PYTHONUTF8=1
set MILES_DEBUG=

cmake -G Ninja  ^
      -DAOTRITON_TARGET_ARCH:STRING=%PYTORCH_ROCM_ARCH% ^
      -DCMAKE_C_COMPILER=%ROCM_PATH%/lib/llvm/bin/clang-cl.exe ^
      -DCMAKE_CXX_COMPILER=%ROCM_PATH%/lib/llvm/bin/clang-cl.exe ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DAOTRITON_NO_PYTHON=OFF ^
      -DAOTRITON_NOIMAGE_MODE=OFF ^
      -DAOTRITON_BUILD_FOR_TUNING=ON ^
      -DAOTRITON_USE_LOCAL_TRITON_WHEEL="C:/Develop/klin2024/triton-windows/dist/triton_windows-3.6.0-cp312-cp312-win_amd64.whl" ^
      -DHIP_PLATFORM=amd ^
      -DTorch_DIR="C:/Develop/.venv/Lib/site-packages/torch/share/cmake/Torch" ^
      -DCMAKE_PREFIX_PATH="%CD%//depend/Release" ^
      -DCMAKE_INSTALL_PREFIX="C:/opt/aotriton-tunning/Release" ^
      -DAOTRITON_NAME_SUFFIX="_tunning" ^
      -S . ^
      -B build-tunning

cmake --build build-tunning --target all --config Release


if %ERRORLEVEL% EQU 0 (
    cmake --install build-tunning
)

endlocal