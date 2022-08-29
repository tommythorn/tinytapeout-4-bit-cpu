# A PDP-8 Inspired 4-bit CPU

With ~ 200 gates and 8-inputs, 8-outputs, can we make a full CPU?  If
we depend on external memory, we can do like the Intel 4004 and
multiplex nibbles in and out.  However for this submission, we keep
the memory on-chip which puts some severe constaints on the size of
everything.  The only architeture that I could managed in that space
is one that relies heavily on self-modifying code, like the beloved
DEC PDP-8.

Features:
- Updatable code and data storage
- Instructions include load, store, alu, and conditional branches
- Can execute Fibonacci

CPU state
- 8 words of 6-bit memory, split into 2-bit of instruction and 4-bit
  of operand.
- 3-bit PC
- 4-bit Accumulator (ACC)

## The Instruction Set

All instructions have an opcode and an argument.

- `load` value (loads value to the accumulator)
- `store` address (stores the accumulator at the address, top bit ignored)
- `add` value  (adds value to the accumulator)
- `brzero` address (branches to address if the accumulator is zero)

Obviously this is very limiting, but it does show the basic structure
and could probably be tweaked to be more general with more time (but
space is limited).

## Example Fibonacci Program

``` C
 int a = 1, b = 1;
 for (;;) {
   int t = a;
   a += b;
   b = t;
   if (b == 8) for (;;)
 }
```

``` assembly
0: load 1  // a is here
1: store 4 // store to t at address 4

2: add 1   // b is here
3: store 0 // Update a at address 0

4: load _  // t is here, value overwritten
5: store 2 // update b

6: add 8  //  -8 == 8
7: brzero 7 // if acc - 8 == 0 we stop
// otherwise roll over to 0
```


# Original README.md follows


(Original readme for the template repository [here](https://github.com/mattvenn/wokwi-verilog-gds-test/blob/main/README.md))

This repo is an experiment in using Verilog source files instead of Wokwi diagrams for [TinyTapeout](tinytapeout.com).

The Verilog flow is:

1) Fork this Repo
2) Create a [wokwi](https://wokwi.com/projects/339800239192932947) project to get an ID
3) Update WOWKI_PROJECT_ID in Makefile
4) `grep -rl "341154068332282450" ./src | xargs sed -i "s/341154068332282450/YOUR_WOKWI_ID/g"` from the top of the repo
5) Replace behavioural code in user_module_ID.v with your own, likewise change the testbench
6) Push changes, which triggers the GitHub Action to build the project
