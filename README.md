# FaaS Flow example #
  This repository will show the FaaS work flow. including,

  * compile kernels with vitis.
  * generate kernels with DCP file.
  * split the DCP from xclbin
  * verify the kernel DCP with gold reference, make sure the kernel is compiled with correct platform (shell)
  * generate the xclbin with bitstream.
  * generate the userside xclbin which contains metadata only.

