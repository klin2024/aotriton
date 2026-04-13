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

@REM -----------------------------------------------------------------------------------
@REM # # set arg
@REM # BATCH = 8
@REM # N_HEADS = 12
@REM # D_HEAD = 16
@REM # seqlen_q = 16
@REM # seqlen_k = 64
@REM # causal = False
@REM # sm_scale = 1.0 / math.sqrt(D_HEAD)
@REM # dropout_p = 0.0
@REM # dtype = torch.bfloat16
@REM # storage_flip = False
@REM # bias_type = None
@REM Tune >>>>  Stem Name (File ID): attn_fwd-Sig-F__∩╝èbf16@16_16_F_F_0_0__P__0_2_32_16_False__CO__wave3_warp2_stg1--Arch_gfx1151
@REM python test/tune_flash.py ^
@REM     --arch %PYTORCH_ROCM_ARCH% ^
@REM     --confirm_to_override_arch ^
@REM     --causal 0 ^
@REM     --dropout_p 0 ^
@REM     --dtype bfloat16 ^
@REM     --seqlen_q 16 64 ^
@REM     --seqlen_k 64 ^
@REM     --json_file ./gfx1151-aotriton-fwd.json --overwrite_json_file --verbose


@REM -----------------------------------------------------------------------------------

@REM python test/tune_flash.py ^
@REM     --arch %PYTORCH_ROCM_ARCH% ^
@REM     --confirm_to_override_arch ^
@REM     --causal 0 ^
@REM     --dropout_p 0 ^
@REM     --bias_type 0 ^
@REM     --n_heads 24 ^
@REM     --batch 1 ^
@REM     --dtype bfloat16 ^
@REM     --seqlen_q 9728 ^
@REM     --seqlen_k 9728 ^
@REM     --d_head 128 ^
@REM     --json_file ./gfx1151-aotriton-fwd.json --overwrite_json_file --verbose


@REM python test/tune_flash.py ^
@REM     --arch %PYTORCH_ROCM_ARCH% ^
@REM     --confirm_to_override_arch ^
@REM     --n_heads 24 ^
@REM     --batch 1 ^
@REM     --seqlen_q 16384 ^
@REM     --max_seqlen_q 16384 ^
@REM     --max_seqlen_k 16384 ^
@REM     --json_file ./gfx1151-aotriton-fwd-q.json --overwrite_json_file --verbose


@REM python test/tune_flash.py ^
@REM     --arch %PYTORCH_ROCM_ARCH% ^
@REM     --confirm_to_override_arch ^
@REM     --n_heads 4 ^
@REM     --batch 1 ^
@REM     --seqlen_k 16384 ^
@REM     --max_seqlen_q 16384 ^
@REM     --max_seqlen_k 16384 ^
@REM     --debug_headless ^
@REM     --json_file ./gfx1151-aotriton-fwd-k.json --overwrite_json_file --verbose

@REM python test/tune_flash.py ^
@REM     --arch %PYTORCH_ROCM_ARCH% ^
@REM     --confirm_to_override_arch ^
@REM     --n_heads 4 ^
@REM     --batch 1 ^
@REM     --seqlen_q 16384 ^
@REM     --max_seqlen_q 16384 ^
@REM     --max_seqlen_k 16384 ^
@REM     --debug_headless ^
@REM     --json_file ./gfx1151-aotriton-fwd-q.json --overwrite_json_file --verbose

@REM python test/tune_flash.py ^
@REM     --arch %PYTORCH_ROCM_ARCH% ^
@REM     --confirm_to_override_arch ^
@REM     --n_heads 4 ^
@REM     --batch 1 ^
@REM     --seqlen_q 16384 ^
@REM     --seqlen_k 16384 ^
@REM     --max_seqlen_q 16384 ^
@REM     --max_seqlen_k 16384 ^
@REM     --debug_headless ^
@REM     --json_file ./gfx1151-aotriton-fwd-qq.json --overwrite_json_file --verbose






@REM python test/tune_flash.py ^
@REM     --arch %PYTORCH_ROCM_ARCH% ^
@REM     --confirm_to_override_arch ^
@REM     --n_heads 4 ^
@REM     --batch 1 ^
@REM     --seqlen_k 96 ^
@REM     --max_seqlen_q 16384 ^
@REM     --max_seqlen_k 16384 ^
@REM     --debug_headless ^
@REM     --json_file ./gfx1151-aotriton-fwd-k-96.json --overwrite_json_file --verbose

@REM python test/tune_flash.py ^
@REM     --arch %PYTORCH_ROCM_ARCH% ^
@REM     --confirm_to_override_arch ^
@REM     --n_heads 4 ^
@REM     --batch 1 ^
@REM     --seqlen_q 96 ^
@REM     --max_seqlen_q 16384 ^
@REM     --max_seqlen_k 16384 ^
@REM     --debug_headless ^
@REM     --json_file ./gfx1151-aotriton-fwd-q-96.json --overwrite_json_file --verbose


@REM python test/tune_flash.py ^
@REM     --arch %PYTORCH_ROCM_ARCH% ^
@REM     --confirm_to_override_arch ^
@REM     --n_heads 4 ^
@REM     --batch 1 ^
@REM     --seqlen_q 96 ^
@REM     --seqlen_k 96 ^
@REM     --max_seqlen_q 16384 ^
@REM     --max_seqlen_k 16384 ^
@REM     --debug_headless ^
@REM     --json_file ./gfx1151-aotriton-fwd-qq-96.json --overwrite_json_file --verbose


python test/tune_flash.py ^
    --arch %PYTORCH_ROCM_ARCH% ^
    --confirm_to_override_arch ^
    --n_heads 12 ^
    --batch 1 ^
    --seqlen_q 8192 ^
    --seqlen_k 8192 ^
    --debug_headless ^
    --json_file ./gfx1151-aotriton-fwd-8192.json --overwrite_json_file --verbose

@REM python v2python/table_tool.py --ignore_id --action rawjson -k FLASH -f v2python/rules/tuning_database.sqlite3 -i ./gfx1151-aotriton-fwd.json


endlocal


