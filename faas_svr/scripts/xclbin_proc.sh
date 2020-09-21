#!/usr/bin/bash
# usage
#  cmd: xclbin_pro.sh <xclbin file name, without postfix xclbin>
#  output <orig name>_dummy.xclbin : the xclbin which contains meta_data only
#  output <orig name>_bit.xclbin : the xclbin which contains meta_data and bit file
#  

if  [ $# != 1 ]
then
  echo "Usage: xclbin_proc.sh <kernel name>"
  exit
fi

if [[ "$1" =~ .*xclbin$ ]]
then
  xcl_file=$1
else
  xcl_file=$1.xclbin
fi

  xcl_prefix=${xcl_file/.xclbin/}

rm -rf kernel*.bit
rm -rf kernel.dcp

xclbinutil --skip-uuid-insertion --force --dump-section BITSTREAM:RAW:kernel.dcp --input $xcl_file


vivado -mode tcl -source ../scripts/faas_verify.tcl

xclbinutil --skip-uuid-insertion --force --remove-section BITSTREAM --input $xcl_file --output ${xcl_prefix}_dummy.xclbin

if grep -q "^INFO:.*PR_VERIFY.*are compatible" chk_result.txt
then
  #partial_bit=`find  -name kernel*partial.bit`
  partial_bit=`find  kernel*partial.bit`
  echo "partial bit: ${partial_bit}"

  if [ ! -z $partial_bit ]
  then

     #xclbinutil --add-section BITSTREAM:RAW:kernel_pblock_region_partial.bit --input $1_dummy.xclbin --output $1_bit.xclbin
     xclbinutil --skip-uuid-insertion --force --add-section BITSTREAM:RAW:$partial_bit --input ${xcl_prefix}_dummy.xclbin --output ${xcl_prefix}_bit.xclbin
  else
    echo "Error: Partial bit file is null!"  
  fi
else
  echo "Error: pr_verify Failed!"
fi
