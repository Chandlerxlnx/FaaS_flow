XCLBIN_TYPE :=DCP

ifeq ($(XCLBIN_TYPE),DCP)
	#CLFLAGS += --xp param:compiler.acceleratorBinaryContent=dcp
	CLFLAGS += --advanced.param compiler.acceleratorBinaryContent=dcp
endif
