Hello World card id (HLS C/C++ Kernel)
======================
This is simple example to demo how to identify the card ID in host code. the example is modified from 'Hello World'

the original code is copied from (hello work in github)[https://github.com/Xilinx/Vitis_Accel_Examples.git]

```bash
Usage: host.exe -[-h-xc-id]

	--help, -h		prints this help list	 Default: [false]
	--xclbin, -xc		XCLBIN	 Default: [vadd.xclbin]
	--id, -id		Device ID	 Default: [0]

```

This is simple example of vector addition to describe how to use HLS kernels in Vitis Environment.

***KEY CONCEPTS:*** HLS C Kernel, OpenCL Host APIs

***KEYWORDS:*** gmem, bundle, #pragma HLS INTERFACE, m_axi, s_axilite

##  DESIGN FILES
Application code is located in the src directory. Accelerator binary files will be compiled to the xclbin directory. The xclbin directory is required by the Makefile and its contents will be filled during compilation. A listing of all the files in this example is shown below

```
src/host.cpp
src/vadd.cpp
```

##  COMMAND LINE ARGUMENTS
Once the environment has been configured, the application can be executed by
```
./host <-xc <xclbin file>> <-id <card id>>
```

##  COMMANDS FOR WINDOWS FLOW
Once the environment has been configured, run the following commands : 
```
cd cmake_build
cmake -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Debug -DXILINX_XRT=<set xilinx xrt path> -DOCL_ROOT=<set ocl root path>
cmake --build . --verbose --config Debug --target install

For Example : 
cd cmake_build
cmake -G "Visual Studio 15 2017 Win64" -DCMAKE_BUILD_TYPE=Debug -DXILINX_XRT=C:\Xilinx\XRT -DOCL_ROOT=C:\Xilinx\XRT\ext
cmake --build . --verbose --config Debug --target install
```
