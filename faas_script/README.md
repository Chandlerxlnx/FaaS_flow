# Read Me #
  applying patch to Vitis_Accel_Example. the script is to update the make files andd compile design for FaaS cloud. the xclbin will contain DCP file so that FaaS vendor can verify the dcp at server side.

  In this example, Makefile will include faas_utils.mk which is setting to generate xclbin containing DCP.

CMD:
```bash
   git submodule add //github.com/Xilinx/Vitis_Accel_Examples.git
   cd Vitis_Accel_EXample/hello_world
   git am ../../faas_scripts/faas_patch.patch

   make build DEVICE=<platform> 
   
```
