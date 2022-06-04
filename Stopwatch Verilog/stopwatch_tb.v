'include "stopwatch.v"

module top 
( 
//inputs 
reg clk,
reg start,
reg reset,

//outputs not sure what we are outputting (actual time)
output wire 
);

// wire to stopwatvh.v's signal 
//unit test instantiation
stopwatch uut
(
   .clk(clk),
   .reset(reset),
   .start(start),
   //outputs
 );

initial 
  begin 
    clk=0;
    forever
    //delay? not sure what this is for
    #50 clk = ~clk;
  end

initial begin
  //innital inpur vals
  reset =0;
  start =0;

  // 2) set reset to 1 and reset for 1 clock cycle and unset 
  // 3) wait for 3 seconds
  #3
  // 4) set start/stop for one clock cycle to start and then unset 
  // 5) wait for one second
  #1
  // 6) set start/stop for 1 clk cycle to stop and unset 
  // 7) wait for 3 seconds
  #3
  // 8) set reset to 1 to reset for 1 clk cyle and unset 
