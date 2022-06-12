Project Stopwatch


Project Flow:

In the present project, we first designed a block design with freertos kernel.

After generating the bitstream, we exported the design and bitstream to hardware and launched SDK.
Here we created a application project where we added our main.c file in src.

we initially created a task to check the input from the user and a timer which ticks every 1/10 second 
we used askey of the buttons Enter(13) and r(114) to check the user input and determine if star/stop, reset are pressed on the stopwatch.
and we implemented our stopwatch logic in vTimerCallback which runs every 1/10 seconds so we counted each loop and determined the time.
we also added another condition to print the status of the stopwatch every one second.

Test Procedure:

1. Setup the design for freertos, generate bitstream, export hardware and launch SDK
2. open freertos_timer.c and program the hardware
3. Open tera term and connect to COM3
4. Run
5. Press enter to toggle start/stop button in our stopwatch 
6. Press r to reset the stopwatch

You can see the output of the stopwatch displayed every one second in the teratem COM3 monitor.

