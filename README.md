(Original readme for the template repository [here](https://github.com/mattvenn/wokwi-verilog-gds-test/blob/main/README.md))

This repo is an experiment in using Verilog source files instead of Wokwi diagrams for [TinyTapeout](tinytapeout.com).

The Verilog flow is:

1) Fork this Repo
2) Create a [wokwi](https://wokwi.com/projects/339800239192932947) project to get an ID
3) Update WOWKI_PROJECT_ID in Makefile
4) `grep -rl "341154068332282450" ./src | xargs sed -i "s/341154068332282450/YOUR_WOKWI_ID/g"` from the top of the repo
5) Replace behavioural code in user_module_ID.v with your own, likewise change the testbench
6) Push changes, which triggers the GitHub Action to build the project
