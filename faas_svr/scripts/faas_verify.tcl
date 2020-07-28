
pr_verify -initial ../golden_design/golden.dcp -additional ./kernal.dcp -file chk_result.txt

set pr_rslt [read [open "chk_result.txt" r]]
set status [regex -line "^INFO:.*PR_VERIFY.*are compatible" $pr_rslt]

if {$status} {
   #process bit gen
   puts "generate kernal bitstream"
   open_checkpoint kernal.dcp
   write_bitstream -f kernal.bit
   puts "INFO: kernal bitstream is generated."
   exit 0
   } else {
   puts "Error: pr_verify Failed. No bitstream generated"
   exit 1
}
