Implement the stopwatch designed in Project 1 with FSM as hardware logic. Verilog must be used for the hardware description. Create two verilog source files: stopwatch.v and stopwatch_tb.v. stopwatch.v includes the main logic of the stopwatch and stopwatch_tb.v (testbench) has the logic to simulate it.

The scope of implementation is as follows:

The stopwatch uses a 100MHz clock, and a Start/Stop button and a Reset button exist as inputs. Minute, Second, and 1/100 seconds are output (three 8-bit outputs).

Stopwatch_tb must contain:

Clock generation (100MHz) (need to be wired to stopwatch.v’s signal)
- Two regs for Start/stop and Reset (need to be wired to stopwatch.v’s signals)
- Testing logic in order
- Hardware logic startup
- set Reset to 1 to reset for 1 clock cycle and unset
- wait for 3 seconds
- set Start/stop for 1 clock cycle to start the stopwatch and unset
- wait for 1 second
- set Start/stop for 1 clock cycle to stop the stopwatch and unset
- wait for 3 seconds
- set Reset to 1 to reset for 1 clock cycle and unset
