// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:clk_gen_sim:1.0
// IP Revision: 0

(* X_CORE_INFO = "clk_gen_sim_v1_0_0_0,Vivado 2019.1.0" *)
(* CHECK_LICENSE_TYPE = "design_1_clk_gen_sim_0_0,clk_gen_sim_v1_0_0_0,{}" *)
(* CORE_GENERATION_INFO = "design_1_clk_gen_sim_0_0,clk_gen_sim_v1_0_0_0,{x_ipProduct=Vivado 2019.1.0,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=clk_gen_sim,x_ipVersion=1.0,x_ipCoreRevision=0,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,SYS_CLK0_FREQ=400.000,SYS_CLK1_FREQ=400.000,SYS_CLK2_FREQ=400.000,SYS_CLK3_FREQ=400.000,NUM_OF_AXI_CLK=1,AXI_CLK_0_FREQ=300,AXI_CLK_1_FREQ=300,AXI_CLK_2_FREQ=300,AXI_CLK_3_FREQ=300,AXI_CLK_4_FREQ=300,AXI_CLK_5_FREQ=300,AXI_CLK_6_FREQ=300,AXI_CLK_7_FREQ=300,AXI_CLK_8_FREQ=300,AXI_CLK_9_FREQ=\
300}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
`timescale 1ps/1ps
module  clk_gen_sim_0 (
  axi_clk_in_0
  ,axi_rst_in_0_n
  ,axi_clk_0
  ,axi_rst_0_n
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI_CLK_IN_0, ASSOCIATED_RESET axi_rst_in_0_n, FREQ_HZ 300000000, PHASE 0.000, CLK_DOMAIN design_1_axi_clk_in_0_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 AXI_CLK_IN_0 CLK" *)
input wire axi_clk_in_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI_RST_IN_0_N, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 AXI_RST_IN_0_N RST" *)
input wire axi_rst_in_0_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI_CLK_0, ASSOCIATED_RESET axi_rst_0_n, FREQ_HZ 300000000, PHASE 0.000, CLK_DOMAIN design_1_clk_gen_sim_0_0_axi_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 AXI_CLK_0 CLK" *)
output wire axi_clk_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI_RST_0_N, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 AXI_RST_0_N RST" *)
output wire axi_rst_0_n;

`ifdef MODEL_TECH
  `define SIMULATION_MODE
`elsif INCA
  `define SIMULATION_MODE
`elsif VCS
  `define SIMULATION_MODE
`elsif XILINX_SIMULATOR
  `define SIMULATION_MODE
`elsif _VCP
  `define SIMULATION_MODE
`endif

`ifndef SIMULATION_MODE
assign axi_clk_0   = axi_clk_in_0;
assign axi_rst_0_n = axi_rst_in_0_n;

`else
//synthesis translate off
  clk_gen_sim_v1_0_0 #(
    .SYS_CLK0_FREQ(400.000),
    .SYS_CLK1_FREQ(400.000),
    .SYS_CLK2_FREQ(400.000),
    .SYS_CLK3_FREQ(400.000),
    .NUM_OF_AXI_CLK(1),
    .NUM_OF_RESET(0),
    .AXI_CLK_0_FREQ(300),
    .AXI_CLK_1_FREQ(300),
    .AXI_CLK_2_FREQ(300),
    .AXI_CLK_3_FREQ(300),
    .AXI_CLK_4_FREQ(300),
    .AXI_CLK_5_FREQ(300),
    .AXI_CLK_6_FREQ(300),
    .AXI_CLK_7_FREQ(300),
    .AXI_CLK_8_FREQ(300),
    .AXI_CLK_9_FREQ(300)
  ) inst (
    .axi_clk_in_0(axi_clk_in_0)
    ,.axi_rst_in_0_n(axi_rst_in_0_n)
    ,.axi_clk_0(axi_clk_0)
    ,.axi_rst_0_n(axi_rst_0_n)
    ,.axi_clk_in_1(1'B0)
    ,.axi_rst_in_1_n(1'B0)
    ,.axi_clk_1()
    ,.axi_rst_1_n()
    ,.axi_clk_in_2(1'B0)
    ,.axi_rst_in_2_n(1'B0)
    ,.axi_clk_2()
    ,.axi_rst_2_n()
    ,.axi_clk_in_3(1'B0)
    ,.axi_rst_in_3_n(1'B0)
    ,.axi_clk_3()
    ,.axi_rst_3_n()
    ,.axi_clk_in_4(1'B0)
    ,.axi_rst_in_4_n(1'B0)
    ,.axi_clk_4()
    ,.axi_rst_4_n()
    ,.axi_clk_in_5(1'B0)
    ,.axi_rst_in_5_n(1'B0)
    ,.axi_clk_5()
    ,.axi_rst_5_n()
    ,.axi_clk_in_6(1'B0)
    ,.axi_rst_in_6_n(1'B0)
    ,.axi_clk_6()
    ,.axi_rst_6_n()
    ,.axi_clk_in_7(1'B0)
    ,.axi_rst_in_7_n(1'B0)
    ,.axi_clk_7()
    ,.axi_rst_7_n()
    ,.axi_clk_in_8(1'B0)
    ,.axi_rst_in_8_n(1'B0)
    ,.axi_clk_8()
    ,.axi_rst_8_n()
    ,.axi_clk_in_9(1'B0)
    ,.axi_rst_in_9_n(1'B0)
    ,.axi_clk_9()
    ,.axi_rst_9_n()
    ,.sys_clk0_in_p(1'B0)
    ,.sys_clk0_in_n(1'B0)
    ,.sys_clk0_p()
    ,.sys_clk0_n()
    ,.sys_clk1_in_p(1'B0)
    ,.sys_clk1_in_n(1'B0)
    ,.sys_clk1_p()
    ,.sys_clk1_n()
    ,.sys_clk2_in_p(1'B0)
    ,.sys_clk2_in_n(1'B0)
    ,.sys_clk2_p()
    ,.sys_clk2_n()
    ,.sys_clk3_in_p(1'B0)
    ,.sys_clk3_in_n(1'B0)
    ,.sys_clk3_p()
    ,.sys_clk3_n()
  );
//synthesis translate on
`endif
endmodule
