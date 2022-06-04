
module stopwatch
(
 //input list 
 input clk
 input startStop
 input reset

 //output list - not sure 
 output  mins
 output secs
 output sec1_100

);

//clock needs to be 100mhz so clock cyle is repeated 10m times in .1second
//if we assume the default is 50mhz so need at least 24 bits idk if this right
//ticker for every second
reg [23:0] tick;

//registers will hold values for indiv counts (need to be 8 bit so 4 each?)
//format is MM:SS:ss
reg[4:0] reg_d0, reg_d1, reg_d2, reg_d3, reg_d4, reg_d5

always @ (posedge clock or posedge reset)
begin
  if(reset)
     tick <= 0;
  //if it reaches max value then we reset (is this max for 100mhz clock 
  //or should this be at 00:00:00 since we cant go up to hours idk)
  else if(tick == 9999999)
     tick <=0;
  else if(start) 
     tick <= tick +1
end

//high every .1 seconds 
assign click = (tick == 9999999);

always @ (posedge clock or posedge reset)
begin
  if(reset)
     begin
     //set all mins:ss:ss to 0 
     reg_d0 <=0;
     reg_d1 <=0
     reg_d2 <=0
     reg_d3 <=0
     reg_d4 <=0
     reg_d5 <=0
     end
  //theres so many idk
  else if (click)
     begin
     //the very last digit
     if(reg_d0 == 9) //xxxxx9
     begin
       reg_d0 <=0; 
       if(reg_d1 == 5)
       begin
         reg_d1 <=0;
         if (reg_d2 ==9)// xxx959
            ref_d2 <=0;         
            if(reg_d3 ==5) //xx5959
            begin
              reg_d3 <=0;
              if(reg_d4 == 9 )
              begin
                reg_d4 <=0;
                if(reg_d5 == 5)
                begin
                  reg_d5 <= 0;
                else 
                   reg_d5 <=reg_d5 +1;
              end
              else 
                 reg_d4 <=reg_d4+1;
             end
             else 
                reg_d3 <= reg_d3 +1;
            end
            else
               reg_d2 < reg_d2 +1;
           end 
           else
              reg_d1 < reg_d1 +1;
          end 
          else
            reg_d0 < reg_d0 +1;
        end
     end


     //not sure where to go from here 
     //outputs



