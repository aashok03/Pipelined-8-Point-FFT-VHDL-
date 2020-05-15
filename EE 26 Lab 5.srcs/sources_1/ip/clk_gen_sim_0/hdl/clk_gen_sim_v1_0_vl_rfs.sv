//`ifdef MODEL_TECH
//  `define SIMULATION_MODE
//`elsif INCA
//  `define SIMULATION_MODE
//`elsif VCS
//  `define SIMULATION_MODE
//`elsif XILINX_SIMULATOR
//  `define SIMULATION_MODE
//`elsif _VCP
//  `define SIMULATION_MODE
//`endif
`timescale 1ps/1ps
module clk_gen_sim_v1_0_0 #(
  parameter real SYS_CLK0_FREQ    = 400.000,
  parameter real SYS_CLK1_FREQ    = 400.000,
  parameter real SYS_CLK2_FREQ    = 400.000,
  parameter real SYS_CLK3_FREQ    = 400.000,
  parameter NUM_OF_AXI_CLK        = 0,
  parameter NUM_OF_RESET          = 0,
  parameter AXI_CLK_0_FREQ        = 300,
  parameter AXI_CLK_1_FREQ        = 300,
  parameter AXI_CLK_2_FREQ        = 300,
  parameter AXI_CLK_3_FREQ        = 300,
  parameter AXI_CLK_4_FREQ        = 300,
  parameter AXI_CLK_5_FREQ        = 300,
  parameter AXI_CLK_6_FREQ        = 300,
  parameter AXI_CLK_7_FREQ        = 300,
  parameter AXI_CLK_8_FREQ        = 300,
  parameter AXI_CLK_9_FREQ        = 300
  
) (
   input  sys_clk0_in_p
  ,input  sys_clk0_in_n
  ,input  sys_clk1_in_p
  ,input  sys_clk1_in_n
  ,input  sys_clk2_in_p
  ,input  sys_clk2_in_n
  ,input  sys_clk3_in_p
  ,input  sys_clk3_in_n
  ,output sys_clk0_p
  ,output sys_clk0_n
  ,output sys_clk1_p
  ,output sys_clk1_n
  ,output sys_clk2_p
  ,output sys_clk2_n
  ,output sys_clk3_p
  ,output sys_clk3_n

  ,input  axi_clk_in_0
  ,input  axi_rst_in_0_n
  ,output axi_clk_0
  ,output axi_rst_0_n

  ,input  axi_clk_in_1
  ,input  axi_rst_in_1_n
  ,output axi_clk_1
  ,output axi_rst_1_n

  ,input  axi_clk_in_2
  ,input  axi_rst_in_2_n
  ,output axi_clk_2
  ,output axi_rst_2_n

  ,input axi_clk_in_3
  ,input axi_rst_in_3_n
  ,output axi_clk_3
  ,output axi_rst_3_n

  ,input axi_clk_in_4
  ,input axi_rst_in_4_n
  ,output axi_clk_4
  ,output axi_rst_4_n

  ,input axi_clk_in_5
  ,input axi_rst_in_5_n
  ,output axi_clk_5
  ,output axi_rst_5_n

  ,input axi_clk_in_6
  ,input axi_rst_in_6_n
  ,output axi_clk_6
  ,output axi_rst_6_n

  ,input axi_clk_in_7
  ,input axi_rst_in_7_n
  ,output axi_clk_7
  ,output axi_rst_7_n

  ,input axi_clk_in_8
  ,input axi_rst_in_8_n
  ,output axi_clk_8
  ,output axi_rst_8_n

  ,input axi_clk_in_9
  ,input axi_rst_in_9_n
  ,output axi_clk_9
  ,output axi_rst_9_n
);

localparam SYS_CLK0_TIME_PERIOD    = (1000000 / SYS_CLK0_FREQ);
localparam SYS_CLK1_TIME_PERIOD    = (1000000 / SYS_CLK1_FREQ);
localparam SYS_CLK2_TIME_PERIOD    = (1000000 / SYS_CLK2_FREQ);
localparam SYS_CLK3_TIME_PERIOD    = (1000000 / SYS_CLK3_FREQ);
localparam AXI_CLK_0_TIME_PERIOD  = (1000000 / AXI_CLK_0_FREQ);
localparam AXI_CLK_1_TIME_PERIOD  = (1000000 / AXI_CLK_1_FREQ);
localparam AXI_CLK_2_TIME_PERIOD  = (1000000 / AXI_CLK_2_FREQ);
localparam AXI_CLK_3_TIME_PERIOD  = (1000000 / AXI_CLK_3_FREQ);
localparam AXI_CLK_4_TIME_PERIOD  = (1000000 / AXI_CLK_4_FREQ);
localparam AXI_CLK_5_TIME_PERIOD  = (1000000 / AXI_CLK_5_FREQ);
localparam AXI_CLK_6_TIME_PERIOD  = (1000000 / AXI_CLK_6_FREQ);
localparam AXI_CLK_7_TIME_PERIOD  = (1000000 / AXI_CLK_7_FREQ);
localparam AXI_CLK_8_TIME_PERIOD  = (1000000 / AXI_CLK_8_FREQ);
localparam AXI_CLK_9_TIME_PERIOD  = (1000000 / AXI_CLK_9_FREQ);

reg sys_clk0_r;
reg sys_clk1_r;
reg sys_clk2_r;
reg sys_clk3_r;
reg axi_clk_0_r;
reg axi_rst_0_r_n;
reg axi_clk_1_r;
reg axi_rst_1_r_n;
reg axi_clk_2_r;
reg axi_rst_2_r_n;
reg axi_clk_3_r;
reg axi_rst_3_r_n;
reg axi_clk_4_r;
reg axi_rst_4_r_n;
reg axi_clk_5_r;
reg axi_rst_5_r_n;
reg axi_clk_6_r;
reg axi_rst_6_r_n;
reg axi_clk_7_r;
reg axi_rst_7_r_n;
reg axi_clk_8_r;
reg axi_rst_8_r_n;
reg axi_clk_9_r;
reg axi_rst_9_r_n;

// synthesis translate off
////////////////////////////////////////////////////////////////////////////////
// Generate SYS Clock and Reset - 0
////////////////////////////////////////////////////////////////////////////////
initial
begin
  sys_clk0_r = 1'b0;
  #1
  sys_clk0_r = 1'b1;
  forever begin
    #(SYS_CLK0_TIME_PERIOD / 2) sys_clk0_r = ~sys_clk0_r;
  end
end

assign sys_clk0_p     =  sys_clk0_r;
assign sys_clk0_n     = ~sys_clk0_r;

////////////////////////////////////////////////////////////////////////////////
// Generate SYS Clock and Reset - 1
////////////////////////////////////////////////////////////////////////////////
initial
begin
  sys_clk1_r = 1'b0;
  #1
  sys_clk1_r = 1'b1;
  forever begin
    #(SYS_CLK1_TIME_PERIOD / 2) sys_clk1_r = ~sys_clk1_r;
  end
end

assign sys_clk1_p     =  sys_clk1_r;
assign sys_clk1_n     = ~sys_clk1_r;

////////////////////////////////////////////////////////////////////////////////
// Generate SYS Clock and Reset - 2
////////////////////////////////////////////////////////////////////////////////
initial
begin
  sys_clk2_r = 1'b0;
  #1
  sys_clk2_r = 1'b1;
  forever begin
    #(SYS_CLK2_TIME_PERIOD / 2) sys_clk2_r = ~sys_clk2_r;
  end
end

assign sys_clk2_p     =  sys_clk2_r;
assign sys_clk2_n     = ~sys_clk2_r;

////////////////////////////////////////////////////////////////////////////////
// Generate SYS Clock and Reset - 3
////////////////////////////////////////////////////////////////////////////////
initial
begin
  sys_clk3_r = 1'b0;
  #1
  sys_clk3_r = 1'b1;
  forever begin
    #(SYS_CLK3_TIME_PERIOD / 2) sys_clk3_r = ~sys_clk3_r;
  end
end

assign sys_clk3_p     =  sys_clk3_r;
assign sys_clk3_n     = ~sys_clk3_r;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-0 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_0_r = 1'b0;
  #1
  axi_clk_0_r = 1'b1;
  forever begin
    #(AXI_CLK_0_TIME_PERIOD / 2) axi_clk_0_r = ~axi_clk_0_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 0) begin
    axi_rst_0_r_n = 1'b0;
    #200000
    axi_rst_0_r_n = 1'b1;
  end else begin
    axi_rst_0_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_0_r);
    end
    axi_rst_0_r_n = 1'b1;
  end
end

assign axi_clk_0   = axi_clk_0_r;
assign axi_rst_0_n = axi_rst_0_r_n;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-1 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_1_r = 1'b0;
  #1
  axi_clk_1_r = 1'b1;
  forever begin
    #(AXI_CLK_1_TIME_PERIOD / 2) axi_clk_1_r = ~axi_clk_1_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 1) begin
    axi_rst_1_r_n = 1'b0;
    #200000
    axi_rst_1_r_n = 1'b1;
  end else begin
    axi_rst_1_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_1_r);
    end
    axi_rst_1_r_n = 1'b1;
  end
end

assign axi_clk_1   = axi_clk_1_r;
assign axi_rst_1_n = axi_rst_1_r_n;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-2 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_2_r = 1'b0;
  #1
  axi_clk_2_r = 1'b1;
  forever begin
    #(AXI_CLK_2_TIME_PERIOD / 2) axi_clk_2_r = ~axi_clk_2_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 2) begin
    axi_rst_2_r_n = 1'b0;
    #200000
    axi_rst_2_r_n = 1'b1;
  end else begin
    axi_rst_2_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_2_r);
    end
    axi_rst_2_r_n = 1'b1;
  end
end

assign axi_clk_2   = axi_clk_2_r;
assign axi_rst_2_n = axi_rst_2_r_n;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-3 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_3_r = 1'b0;
  #1
  axi_clk_3_r = 1'b1;
  forever begin
    #(AXI_CLK_3_TIME_PERIOD / 2) axi_clk_3_r = ~axi_clk_3_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 3) begin
    axi_rst_3_r_n = 1'b0;
    #200000
    axi_rst_3_r_n = 1'b1;
  end else begin
    axi_rst_3_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_3_r);
    end
    axi_rst_3_r_n = 1'b1;
  end
end

assign axi_clk_3   = axi_clk_3_r;
assign axi_rst_3_n = axi_rst_3_r_n;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-4 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_4_r = 1'b0;
  #1
  axi_clk_4_r = 1'b1;
  forever begin
    #(AXI_CLK_4_TIME_PERIOD / 2) axi_clk_4_r = ~axi_clk_4_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 4) begin
    axi_rst_4_r_n = 1'b0;
    #200000
    axi_rst_4_r_n = 1'b1;
  end else begin
    axi_rst_4_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_4_r);
    end
    axi_rst_4_r_n = 1'b1;
  end
end

assign axi_clk_4   = axi_clk_4_r;
assign axi_rst_4_n = axi_rst_4_r_n;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-5 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_5_r = 1'b0;
  #1
  axi_clk_5_r = 1'b1;
  forever begin
    #(AXI_CLK_5_TIME_PERIOD / 2) axi_clk_5_r = ~axi_clk_5_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 5) begin
    axi_rst_5_r_n = 1'b0;
    #200000
    axi_rst_5_r_n = 1'b1;
  end else begin
    axi_rst_5_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_5_r);
    end
    axi_rst_5_r_n = 1'b1;
  end
end

assign axi_clk_5   = axi_clk_5_r;
assign axi_rst_5_n = axi_rst_5_r_n;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-6 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_6_r = 1'b0;
  #1
  axi_clk_6_r = 1'b1;
  forever begin
    #(AXI_CLK_6_TIME_PERIOD / 2) axi_clk_6_r = ~axi_clk_6_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 6) begin
    axi_rst_6_r_n = 1'b0;
    #200000
    axi_rst_6_r_n = 1'b1;
  end else begin
    axi_rst_6_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_6_r);
    end
    axi_rst_6_r_n = 1'b1;
  end
end

assign axi_clk_6   = axi_clk_6_r;
assign axi_rst_6_n = axi_rst_6_r_n;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-7 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_7_r = 1'b0;
  #1
  axi_clk_7_r = 1'b1;
  forever begin
    #(AXI_CLK_7_TIME_PERIOD / 2) axi_clk_7_r = ~axi_clk_7_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 7) begin
    axi_rst_7_r_n = 1'b0;
    #200000
    axi_rst_7_r_n = 1'b1;
  end else begin
    axi_rst_7_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_7_r);
    end
    axi_rst_7_r_n = 1'b1;
  end
end

assign axi_clk_7   = axi_clk_7_r;
assign axi_rst_7_n = axi_rst_7_r_n;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-8 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_8_r = 1'b0;
  #1
  axi_clk_8_r = 1'b1;
  forever begin
    #(AXI_CLK_8_TIME_PERIOD / 2) axi_clk_8_r = ~axi_clk_8_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 8) begin
    axi_rst_8_r_n = 1'b0;
    #200000
    axi_rst_8_r_n = 1'b1;
  end else begin
    axi_rst_8_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_8_r);
    end
    axi_rst_8_r_n = 1'b1;
  end
end

assign axi_clk_8   = axi_clk_8_r;
assign axi_rst_8_n = axi_rst_8_r_n;

////////////////////////////////////////////////////////////////////////////////
// Generate AXI-9 Clock and Reset
////////////////////////////////////////////////////////////////////////////////
initial
begin
  axi_clk_9_r = 1'b0;
  #1
  axi_clk_9_r = 1'b1;
  forever begin
    #(AXI_CLK_9_TIME_PERIOD / 2) axi_clk_9_r = ~axi_clk_9_r;
  end
end

initial
begin
  if (NUM_OF_RESET > 9) begin
    axi_rst_9_r_n = 1'b0;
    #200000
    axi_rst_9_r_n = 1'b1;
  end else begin
    axi_rst_9_r_n = 1'b0;
    repeat (1000) begin
      @ (posedge axi_clk_9_r);
    end
    axi_rst_9_r_n = 1'b1;
  end
end

assign axi_clk_9   = axi_clk_9_r;
assign axi_rst_9_n = axi_rst_9_r_n;
// synthesis translate on

endmodule


