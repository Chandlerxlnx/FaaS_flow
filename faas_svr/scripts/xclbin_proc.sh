#!/usr/bin/bash
# usage
#  cmd: xclbin_pro.sh <xclbin file name, without postfix xclbin>
#  output <orig name>_dummy.xclbin : the xclbin which contains meta_data only
#  output <orig name>_bit.xclbin : the xclbin which contains meta_data and bit file
#  
xclbinutil --dump-section BITSTREAM:RAW:kernel.dcp --input $1.xclbin

vivado -mode tcl -source faas_verify.tcl

 xclbinutil --remove-section BITSTREAM --input $1.xclbin  --output $1_dummy.xclbin

xclbinutil --add-section BITSTREAM:RAW:kernal.bit --input $1_dummy.xclbin --output $1_bit.xclbin

