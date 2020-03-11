@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim tb_and_or_not_xor_time_impl -key {Post-Implementation:sim_1:Timing:tb_and_or_not_xor} -tclbatch tb_and_or_not_xor.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
