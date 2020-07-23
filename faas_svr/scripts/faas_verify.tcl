
set status [pr_verify -initial ../golden_design/golden.dcp -additional kernel.dcp]

if {status} {
   #process bit gen
   open_checkpoint kernel.dcp
   write_bitstream -f kernel.bit
   }
else {
   exit
}
