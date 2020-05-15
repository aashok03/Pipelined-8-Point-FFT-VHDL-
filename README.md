# Pipelined-8-Point-FFT-VHDL-
This is a VHDL implementation of a pipelined 8-Point Fast Fourier Transform (FFT) that uses the butterfly architecture. Input data points are stored in a ROM, and outputs are displayed on the seven-segment LCD of the Nexys 4 board. Adder/subtractor and multipleir IPs are used to decrease the DSP slice usage, and clock IPs are used in testbenches when running behavioral simulations.