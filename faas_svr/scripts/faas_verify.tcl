
pr_verify -initial ../../golden_design/golden.dcp -additional ./kernal.dcp -file chk_result.txt

set pr_rslt [read [open "chk_result.txt" r]]
set status [regex -line "^INFO:.*PR_VERIFY.*are compatible" $pr_rslt]

if {$status} {
   #process bit gen
   puts "generate kernal bitstream"
   open_checkpoint kernal.dcp
   
   set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
   
   #write_bitstream -cell [get_cells pfm_top_i/dynamic_region] -f kernal.bit
   write_bitstream -force kernal.bit
   puts "INFO: kernal bitstream is generated."
   exit 0
   } else {
   puts "Error: pr_verify Failed. No bitstream generated"
   exit 1
}
