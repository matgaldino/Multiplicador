# Multiplicador

## Project Description

This project implements a **4-bit Binary Multiplier** using the **Shift-and-Add (Sequential Multiplier)** algorithm, developed in Verilog. The system is designed to multiply two 4-bit unsigned integers, producing an 8-bit result.

### Key Features

- **Inputs:**
  - `Multiplicando [3:0]`: 4-bit multiplicand.
  - `Multiplicador [3:0]`: 4-bit multiplier.
  - `St`: Start signal to initiate the multiplication process.
  - `Clk`: System clock.
- **Outputs:**
  - `Produto [7:0]`: 8-bit product of the multiplication.
  - `Idle`: Status signal indicating the circuit is ready for a new operation.
  - `Done`: Status signal indicating the multiplication is complete.

### Architecture

The design follows a modular approach, consisting of the following components:

1. **Control Unit (CONTROL.v):** A Finite State Machine (FSM) that manages the operation flow (Loading, Adding, and Shifting) based on the `St` signal and the internal counter.
2. **Accumulator (ACC.v):** A shift register that stores the partial products and final result. It performs loading of the initial multiplier, partial sum updates, and right-shifting.
3. **Adder (Adder.v):** A 4-bit adder used to compute partial sums during the multiplication cycles.
4. **Counter (Counter.v):** A sequential circuit that tracks the number of iterations required for the 4-bit multiplication process.
![RTL view](https://github.com/matgaldino/Multiplicador/assets/86614854/6564b633-5700-45fd-ad7d-0e9be466c521)
### How it Works

1. The operation begins when the `St` signal is asserted.
2. The `CONTROL` unit loads the multiplier into the accumulator.
3. For each bit of the multiplier:
   - If the least significant bit (LSB) of the current partial product in the accumulator is `1`, the multiplicand is added to the upper 4 bits of the accumulator.
   - The entire accumulator is then shifted one bit to the right.
4. This process repeats for 4 iterations, tracked by the `Counter`.
5. Once complete, the `Done` signal is asserted, and the 8-bit product is available at the output.
