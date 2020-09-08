#!/usr/bin/bash
# usage
#  cmd: xclbin_pro.sh <xclbin file name, without postfix xclbin>
#  output <orig name>_dummy.xclbin : the xclbin which contains meta_data only
#  output <orig name>_bit.xclbin : the xclbin which contains meta_data and bit file
#  

if  [ $# != 1 ]
then
  echo "Usage: xclbin_proc.sh <kernal name>[.xclbin]"
  exit
fi

if [[ "$1" =~ .*xclbin$ ]]
then
  xcl_file=$1
else
  xcl_file=$1.xclbin
fi

rm -rf kernal*.bit
rm -rf kernal.dcp

xclbinutil --force --dump-section BITSTREAM:RAW:kernal.dcp --input $xcl_file


vivado -mode tcl -source ../scripts/faas_verify.tcl

xclbinutil --force --remove-section BITSTREAM --input $1.xclbin  --output $1_dummy.xclbin

if grep -q "^INFO:.*PR_VERIFY.*are compatible" chk_result.txt
then
  partial_bit=`find . -name kernal*partial.bit`
  if   [ ! -z $partial_bit ]
  then

     #xclbinutil --add-section BITSTREAM:RAW:kernal_pblock_region_partial.bit --input $1_dummy.xclbin --output $1_bit.xclbin
     xclbinutil --force --add-section BITSTREAM:RAW:$partial_bit --input $1_dummy.xclbin --output $1_bit.xclbin
  else
    echo "Error: Partial bit file is null!"  
  fi
else
  echo "Error: pr_verify Failed!"
fi
