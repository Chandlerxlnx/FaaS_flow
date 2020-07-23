xclbinutil --dump-section BITSTREAM:DCP:kernel.dcp --input \1.xclbin

vivado -mode tcl -source faas_verify.tcl


