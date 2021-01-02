/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: dma_ctrl_fsm.v
 *  Purpose:  DMA control FSM. Current module manages entire data flow.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module dma_ctrl_fsm #
(
    parameter   integer C_SENSOR_RES_X = 336,
    parameter   integer C_SENSOR_RES_Y = 256,
    parameter   integer C_IMAGE_AVERAGING_ENABLE = 0,
    
    /* This address should be aligned to 0x100000 */
    parameter   [31:0]  C_RAM_BUFFERS_BASE_ADDR = 32'h2000_0000
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axis_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXIS_RAW:S_AXIS_RTEMP:S_AXIS_EQUAL:M_AXIS_BIAS:M_AXIS_GAIN:M_AXIS_OFST:M_AXIS_AVGI:S_AXIS_AVGO:M_AXIS_SENSOR_CMD:M_AXIS_OSD:M_AXIS_CNSMR_0:M_AXIS_CNSMR_1:M_AXIS_CNSMR_2:M_AXIS_CNSMR_3:M_AXIS_CNSMR_4:S_AXIS_MM2S:M_AXIS_S2MM:M_AXIS_MM2S_CMD:S_AXIS_MM2S_STS:M_AXIS_S2MM_CMD:S_AXIS_S2MM_STS, ASSOCIATED_RESET axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axis_aclk,
    
    input   wire            fsm_aresetn,
    
    input   wire            sof_raw_in,
    input   wire            sof_avg_in,
    input   wire            eol_strb,
    
    input   wire            fifo_raw_prog_empty,
    input   wire            fifo_avgo_prog_empty,
    input   wire            fifo_equal_prog_empty,
    
    input   wire            fifo_bias_prog_full,
    input   wire            fifo_avgi_prog_full,
    input   wire            fifo_gain_prog_full,
    input   wire            fifo_ofst_prog_full,
    input   wire            fifo_osd_prog_full,
    input   wire            fifo_cnsmr_0_prog_full,
    input   wire            fifo_cnsmr_1_prog_full,
    input   wire            fifo_cnsmr_2_prog_full,
    input   wire            fifo_cnsmr_3_prog_full,
    input   wire            fifo_cnsmr_4_prog_full,
    
    /* Slave AXIS sensor raw image row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_RAW, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW TDATA"  *)          input   wire    [31:0]  s_axis_raw_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW TVALID" *)          input   wire            s_axis_raw_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW TREADY" *)          output  wire            s_axis_raw_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW TLAST"  *)          input   wire            s_axis_raw_tlast,
    
    /* Slave AXIS sensor row temperature/feedback ??? */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_RTEMP, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RTEMP TDATA"  *)        input   wire    [31:0]  s_axis_rtemp_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RTEMP TVALID" *)        input   wire            s_axis_rtemp_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RTEMP TREADY" *)        output  wire            s_axis_rtemp_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RTEMP TLAST"  *)        input   wire            s_axis_rtemp_tlast,

    /* Slave AXIS equalized image row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_EQUAL, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL TDATA"  *)        input   wire    [31:0]  s_axis_equal_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL TVALID" *)        input   wire            s_axis_equal_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL TREADY" *)        output  wire            s_axis_equal_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL TLAST"  *)        input   wire            s_axis_equal_tlast,

    /* Master AXIS sensor bias row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_BIAS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_BIAS TDATA"  *)         output  wire    [31:0]  m_axis_bias_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_BIAS TVALID" *)         output  wire            m_axis_bias_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_BIAS TREADY" *)         input   wire            m_axis_bias_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_BIAS TLAST"  *)         output  wire            m_axis_bias_tlast,
    
    /* Master AXIS sensor NUC gain row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_GAIN, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_GAIN TDATA"  *)         output  wire    [31:0]  m_axis_gain_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_GAIN TVALID" *)         output  wire            m_axis_gain_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_GAIN TREADY" *)         input   wire            m_axis_gain_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_GAIN TLAST"  *)         output  wire            m_axis_gain_tlast,
    
    /* Master AXIS sensor NUC offset row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_OFST, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OFST TDATA"  *)         output  wire    [31:0]  m_axis_ofst_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OFST TVALID" *)         output  wire            m_axis_ofst_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OFST TREADY" *)         input   wire            m_axis_ofst_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OFST TLAST"  *)         output  wire            m_axis_ofst_tlast,
    
    /* Master AXIS frame averaging output row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_AVGI, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGI TDATA"  *)         output  wire    [31:0]  m_axis_avgi_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGI TVALID" *)         output  wire            m_axis_avgi_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGI TREADY" *)         input   wire            m_axis_avgi_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGI TLAST"  *)         output  wire            m_axis_avgi_tlast,
    
    /* Slave AXIS frame averaging input row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_AVGO, TDATA_NUM_BYTES 4, TD    EST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGO TDATA"  *)         input   wire    [31:0]  s_axis_avgo_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGO TVALID" *)         input   wire            s_axis_avgo_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGO TREADY" *)         output  wire            s_axis_avgo_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGO TLAST"  *)         input   wire            s_axis_avgo_tlast,
    
    /* Master AXIS sensor command */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_SENSOR_CMD, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_SENSOR_CMD TDATA"  *)   output  wire    [31:0]  m_axis_sensor_cmd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_SENSOR_CMD TVALID" *)   output  wire            m_axis_sensor_cmd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_SENSOR_CMD TREADY" *)   input   wire            m_axis_sensor_cmd_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_SENSOR_CMD TLAST"  *)   output  wire            m_axis_sensor_cmd_tlast,
    
    /* Master AXIS OSD (On Screen Display) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_OSD, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OSD TDATA"  *)          output  wire    [31:0]  m_axis_osd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OSD TVALID" *)          output  wire            m_axis_osd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OSD TREADY" *)          input   wire            m_axis_osd_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OSD TUSER"  *)          output  wire    [3:0]   m_axis_osd_tuser,
    
    /* Master AXIS to consumer 0 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CNSMR_0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_0 TDATA"  *)      output  wire    [31:0]  m_axis_cnsmr_0_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_0 TVALID" *)      output  wire            m_axis_cnsmr_0_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_0 TREADY" *)      input   wire            m_axis_cnsmr_0_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_0 TUSER"  *)      output  wire    [3:0]   m_axis_cnsmr_0_tuser,
    
    /* Master AXIS to consumer 1 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CNSMR_1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_1 TDATA"  *)      output  wire    [31:0]  m_axis_cnsmr_1_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_1 TVALID" *)      output  wire            m_axis_cnsmr_1_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_1 TREADY" *)      input   wire            m_axis_cnsmr_1_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_1 TUSER"  *)      output  wire    [3:0]   m_axis_cnsmr_1_tuser,
    
    /* Master AXIS to consumer 2 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CNSMR_2, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_2 TDATA"  *)      output  wire    [31:0]  m_axis_cnsmr_2_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_2 TVALID" *)      output  wire            m_axis_cnsmr_2_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_2 TREADY" *)      input   wire            m_axis_cnsmr_2_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_2 TUSER"  *)      output  wire    [3:0]   m_axis_cnsmr_2_tuser,
    
    /* Master AXIS to consumer 3 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CNSMR_3, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_3 TDATA"  *)      output  wire    [31:0]  m_axis_cnsmr_3_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_3 TVALID" *)      output  wire            m_axis_cnsmr_3_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_3 TREADY" *)      input   wire            m_axis_cnsmr_3_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_3 TUSER"  *)      output  wire    [3:0]   m_axis_cnsmr_3_tuser,
    
    /* Master AXIS to consumer 4 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CNSMR_4, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_4 TDATA"  *)      output  wire    [31:0]  m_axis_cnsmr_4_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_4 TVALID" *)      output  wire            m_axis_cnsmr_4_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_4 TREADY" *)      input   wire            m_axis_cnsmr_4_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CNSMR_4 TUSER"  *)      output  wire    [3:0]   m_axis_cnsmr_4_tuser,
    
    /* DataMover MM2S (read from memory) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_MM2S, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TDATA"  *)         input   wire    [31:0]  s_axis_mm2s_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TKEEP"  *)         input   wire    [3:0]   s_axis_mm2s_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TVALID" *)         input   wire            s_axis_mm2s_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TREADY" *)         output  wire            s_axis_mm2s_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TLAST"  *)         input   wire            s_axis_mm2s_tlast,
    
    /* DataMover S2MM (write to memory) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_S2MM, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TDATA"  *)         output  reg     [31:0]  m_axis_s2mm_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TKEEP"  *)         output  wire    [3:0]   m_axis_s2mm_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TVALID" *)         output  reg             m_axis_s2mm_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TREADY" *)         input   wire            m_axis_s2mm_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TLAST"  *)         output  reg             m_axis_s2mm_tlast,
    
    /* DataMover MM2S command interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_MM2S_CMD, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S_CMD TDATA"  *)     output  reg     [71:0]  m_axis_mm2s_cmd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S_CMD TVALID" *)     output  reg             m_axis_mm2s_cmd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S_CMD TREADY" *)     input   wire            m_axis_mm2s_cmd_tready,
    
    /* DataMover MM2S status interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_MM2S_STS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TDATA"  *)     input   wire    [7:0]   s_axis_mm2s_sts_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TKEEP"  *)     input   wire    [0:0]   s_axis_mm2s_sts_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TVALID" *)     input   wire            s_axis_mm2s_sts_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TREADY" *)     output  reg             s_axis_mm2s_sts_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TLAST"  *)     input   wire            s_axis_mm2s_sts_tlast,
    
    /* DataMover S2MM command interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_S2MM_CMD, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM_CMD TDATA"  *)     output  reg     [71:0]  m_axis_s2mm_cmd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM_CMD TVALID" *)     output  reg             m_axis_s2mm_cmd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM_CMD TREADY" *)     input   wire            m_axis_s2mm_cmd_tready,
    
    /* DataMover S2MM status interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_S2MM_STS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TDATA"  *)     input   wire    [7:0]   s_axis_s2mm_sts_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TKEEP"  *)     input   wire    [0:0]   s_axis_s2mm_sts_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TVALID" *)     input   wire            s_axis_s2mm_sts_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TREADY" *)     output  reg             s_axis_s2mm_sts_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TLAST"  *)     input   wire            s_axis_s2mm_sts_tlast
);

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    /* Check base address alignment to 0x100000 */
    generate
        if ((C_RAM_BUFFERS_BASE_ADDR & 32'h000f_ffff) != 32'h0000_0000) begin
            //INVALID_PARAMETER invalid_parameter_msg();
            initial begin
                $error("Invalid parameter!");
            end
        end
    endgenerate
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
                                                                    // 336*3*2B = 0x7E0 (extended 3 frames)
    localparam  [31:0]  RAW_FRAME_BUFFER_OFFSET   = 32'h0000_07E0,  // 336*256*2B = 0x2A000 = 168K
                        ROW_TEMP_BUFFER_OFFSET    = 32'h0002_A7F4,  // 259 DWORDs
                        SENSOR_CMD_RAM_OFFSET     = 32'h0002_AC00,  // 5 DWORDs
                        CTRL_REG_CPU2FSM_OFFSET   = 32'h0002_AC14,  // 1 DWORD
                        CTRL_REG_FSM2CPU_OFFSET   = 32'h0002_AC18,  // 1 DWORD
                                                                    // 57 reserved DWORDs
                        BIAS_FRAME_BUFFER_OFFSET  = 32'h0002_AD00,  // 336*256*1B = 0x15000 = 84K
                        GAIN_FRAME_BUFFER_OFFSET  = 32'h0003_FD00,  // 336*256*2B = 0x2A000 = 168K
                        OFST_FRAME_BUFFER_OFFSET  = 32'h0006_9D00,  // 336*256*2B = 0x2A000 = 168K
                        AVG_FRAME_BUFFER_OFFSET   = 32'h0009_3D00,  // 336*256*4B = 0x54000 = 336K
                        EQUAL_FRAME_BUFFER_OFFSET = 32'h000E_7D00,  // 336*256*1B = 0x15000 = 84K
                        OSD_FRAME_BUFFER_0_OFFSET = 32'h000F_CD00,  // 320*240*2B = 0x25800 = 150K
                        OSD_FRAME_BUFFER_1_OFFSET = 32'h0012_2500;  // 320*240*2B = 0x25800 = 150K
    
    localparam  [3:0]   DMA_XFER_OKAY           = 4'b1000,
                        DMA_XFER_SLVERR         = 4'b0100,
                        DMA_XFER_DECERR         = 4'b0010,
                        DMA_XFER_INTERR         = 4'b0001;
    
    localparam  [2:0]   EQUAL                   = 3'd0,     // 8-bit equalized sensor image
                        CNSMR0                  = 3'd1,     // HDMI channel 0
                        CNSMR1                  = 3'd2,     // HDMI channel 1
                        CNSMR2                  = 3'd3,     // USB
                        CNSMR3                  = 3'd4,     // AV
                        OSD                     = 3'd5,     // OSD for LCD
                        CNSMR4                  = 3'd6;     // LCD
    
    localparam  [2:0]   CTRL_REG_FSM2CPU_ID     = 3'd0,
                        RAW_ROW_FIFO_ID         = 3'd1,
                        AVGO_ROW_FIFO_ID        = 3'd2,
                        ROW_TEMP_FIFO_ID        = 3'd3,
                        EQUAL_ROW_FIFO_ID       = 3'd4;
    
    localparam  [3:0]   BIAS_ROW_FIFO_ID        = 4'd0,
                        GAIN_ROW_FIFO_ID        = 4'd1,
                        OFST_ROW_FIFO_ID        = 4'd2,
                        AVGI_ROW_FIFO_ID        = 4'd3,
                        OSD_ROW_FIFO_ID         = 4'd4,
                        CNSMR0_FIFO_ID          = 4'd5,
                        CNSMR1_FIFO_ID          = 4'd6,
                        CNSMR2_FIFO_ID          = 4'd7,
                        CNSMR3_FIFO_ID          = 4'd8,
                        CNSMR4_FIFO_ID          = 4'd9,
                        CTRL_REG_CPU2FSM_ID     = 4'd10,
                        SENSOR_CMD_ID           = 4'd11;
    
    
    reg     [31:0]  ctrl_reg_cpu2fsm = {32{1'b0}};
    reg     [31:0]  ctrl_reg_fsm2cpu = {32{1'b0}};
    
    reg             raw_fifo_load_ena     = 1'b0;
    reg             equal_fifo_load_ena   = 1'b0;
    reg             osd_double_buffer_sel = 1'b0;
    
    // S2MM
    reg             s2mm_xfer_ena = 1'b0;
    reg     [2:0]   master_select = 3'b000;
    
    
    assign  m_axis_s2mm_tkeep = {4{1'b1}};
    
    always @(*) begin
        (* parallel_case *)
        case (master_select)
            RAW_ROW_FIFO_ID: begin
                m_axis_s2mm_tdata  = s_axis_raw_tdata;
                m_axis_s2mm_tlast  = s_axis_raw_tlast;
                m_axis_s2mm_tvalid = s_axis_raw_tvalid & s2mm_xfer_ena;
            end
            
            AVGO_ROW_FIFO_ID: begin
                m_axis_s2mm_tdata  = s_axis_avgo_tdata;
                m_axis_s2mm_tlast  = s_axis_avgo_tlast;
                m_axis_s2mm_tvalid = s_axis_avgo_tvalid & s2mm_xfer_ena;
            end
            
            ROW_TEMP_FIFO_ID: begin
                m_axis_s2mm_tdata  = s_axis_rtemp_tdata;
                m_axis_s2mm_tlast  = s_axis_rtemp_tlast;
                m_axis_s2mm_tvalid = s_axis_rtemp_tvalid & s2mm_xfer_ena;
            end
            
            EQUAL_ROW_FIFO_ID: begin
                m_axis_s2mm_tdata  = s_axis_equal_tdata;
                m_axis_s2mm_tlast  = s_axis_equal_tlast;
                m_axis_s2mm_tvalid = s_axis_equal_tvalid & s2mm_xfer_ena;
            end
            
            CTRL_REG_FSM2CPU_ID: begin
                m_axis_s2mm_tdata  = ctrl_reg_fsm2cpu;
                m_axis_s2mm_tlast  = 1'b1;
                m_axis_s2mm_tvalid = s2mm_xfer_ena;
            end
            
            default: begin
                m_axis_s2mm_tdata  = {32{1'b0}};
                m_axis_s2mm_tlast  = 1'b0;
                m_axis_s2mm_tvalid = 1'b0;
            end
        endcase
    end
    
    
    assign  s_axis_raw_tready   = (s2mm_xfer_ena & m_axis_s2mm_tready & (master_select == RAW_ROW_FIFO_ID)) | (~raw_fifo_load_ena);
    assign  s_axis_avgo_tready  =  s2mm_xfer_ena & m_axis_s2mm_tready & (master_select == AVGO_ROW_FIFO_ID);
    assign  s_axis_rtemp_tready =  s2mm_xfer_ena & m_axis_s2mm_tready & (master_select == ROW_TEMP_FIFO_ID);
    assign  s_axis_equal_tready = (s2mm_xfer_ena & m_axis_s2mm_tready & (master_select == EQUAL_ROW_FIFO_ID)) | (~equal_fifo_load_ena);
    // ctrl_reg_fsm2cpu logic does not need axis_tready
    
    // MM2S
    reg             mm2s_xfer_eof = 1'b0;
    reg             mm2s_xfer_ena = 1'b0;
    reg     [3:0]   slave_select  = 4'b0000;
    
    assign  m_axis_bias_tdata      = s_axis_mm2s_tdata;
    assign  m_axis_bias_tvalid     = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == BIAS_ROW_FIFO_ID);
    assign  m_axis_bias_tlast      = s_axis_mm2s_tlast;
    
    assign  m_axis_gain_tdata      = s_axis_mm2s_tdata;
    assign  m_axis_gain_tvalid     = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == GAIN_ROW_FIFO_ID);
    assign  m_axis_gain_tlast      = s_axis_mm2s_tlast;
    
    assign  m_axis_ofst_tdata      = s_axis_mm2s_tdata;
    assign  m_axis_ofst_tvalid     = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == OFST_ROW_FIFO_ID);
    assign  m_axis_ofst_tlast      = s_axis_mm2s_tlast;
    
    assign  m_axis_avgi_tdata      = s_axis_mm2s_tdata;
    assign  m_axis_avgi_tvalid     = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == AVGI_ROW_FIFO_ID);
    assign  m_axis_avgi_tlast      = s_axis_mm2s_tlast;
    
    assign  m_axis_osd_tdata       = s_axis_mm2s_tdata;
    assign  m_axis_osd_tvalid      = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == OSD_ROW_FIFO_ID);
    assign  m_axis_osd_tuser       = {{2{s_axis_mm2s_tlast & mm2s_xfer_eof}}, 2'b00};
    
    assign  m_axis_cnsmr_0_tdata   = s_axis_mm2s_tdata;
    assign  m_axis_cnsmr_0_tvalid  = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CNSMR0_FIFO_ID);
    assign  m_axis_cnsmr_0_tuser   = {s_axis_mm2s_tlast & mm2s_xfer_eof, 3'b000};
    
    assign  m_axis_cnsmr_1_tdata   = s_axis_mm2s_tdata;
    assign  m_axis_cnsmr_1_tvalid  = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CNSMR1_FIFO_ID);
    assign  m_axis_cnsmr_1_tuser   = {s_axis_mm2s_tlast & mm2s_xfer_eof, 3'b000};
    
    assign  m_axis_cnsmr_2_tdata   = s_axis_mm2s_tdata;
    assign  m_axis_cnsmr_2_tvalid  = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CNSMR2_FIFO_ID);
    assign  m_axis_cnsmr_2_tuser   = {s_axis_mm2s_tlast & mm2s_xfer_eof, 3'b000};
    
    assign  m_axis_cnsmr_3_tdata   = s_axis_mm2s_tdata;
    assign  m_axis_cnsmr_3_tvalid  = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CNSMR3_FIFO_ID);
    assign  m_axis_cnsmr_3_tuser   = {s_axis_mm2s_tlast & mm2s_xfer_eof, 3'b000};
    
    assign  m_axis_cnsmr_4_tdata   = s_axis_mm2s_tdata;
    assign  m_axis_cnsmr_4_tvalid  = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CNSMR4_FIFO_ID);
    assign  m_axis_cnsmr_4_tuser   = {s_axis_mm2s_tlast & mm2s_xfer_eof, 3'b000};
    
    
    wire    ctrl_reg_cpu2fsm_tvalid = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CTRL_REG_CPU2FSM_ID);
    
    assign  m_axis_sensor_cmd_tdata  = s_axis_mm2s_tdata;
    assign  m_axis_sensor_cmd_tvalid = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == SENSOR_CMD_ID);
    assign  m_axis_sensor_cmd_tlast  = s_axis_mm2s_tlast;
    
    
    reg     slave_axis_tready;
    
    always @(*) begin
        (* parallel_case *)
        case (slave_select)
            BIAS_ROW_FIFO_ID:    slave_axis_tready = m_axis_bias_tready;
            GAIN_ROW_FIFO_ID:    slave_axis_tready = m_axis_gain_tready;
            OFST_ROW_FIFO_ID:    slave_axis_tready = m_axis_ofst_tready;
            AVGI_ROW_FIFO_ID:    slave_axis_tready = m_axis_avgi_tready;
            OSD_ROW_FIFO_ID:     slave_axis_tready = m_axis_osd_tready;
            CNSMR0_FIFO_ID:      slave_axis_tready = m_axis_cnsmr_0_tready;
            CNSMR1_FIFO_ID:      slave_axis_tready = m_axis_cnsmr_1_tready;
            CNSMR2_FIFO_ID:      slave_axis_tready = m_axis_cnsmr_2_tready;
            CNSMR3_FIFO_ID:      slave_axis_tready = m_axis_cnsmr_3_tready;
            CNSMR4_FIFO_ID:      slave_axis_tready = m_axis_cnsmr_4_tready;
            CTRL_REG_CPU2FSM_ID: slave_axis_tready = 1'b1;
            SENSOR_CMD_ID:       slave_axis_tready = m_axis_sensor_cmd_tready;
            default:             slave_axis_tready = 1'b0;
        endcase
    end
    
    assign  s_axis_mm2s_tready = slave_axis_tready & mm2s_xfer_ena;

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    /* Memory-mapped DMA control registers */
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn | ~fsm_aresetn) begin
            ctrl_reg_cpu2fsm <= {32{1'b0}};
            ctrl_reg_fsm2cpu <= {32{1'b0}};
        end else begin  
            if (ctrl_reg_cpu2fsm_tvalid) begin
                ctrl_reg_cpu2fsm <= s_axis_mm2s_tdata;
            end
            
            // debug mirror
            ctrl_reg_fsm2cpu <= ~ctrl_reg_cpu2fsm;
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn | ~fsm_aresetn) begin
            raw_fifo_load_ena     <= 1'b0;
            equal_fifo_load_ena   <= 1'b0;
            osd_double_buffer_sel <= 1'b0;
        end else begin
            /* Raw buffer refresh flag */
            if (s_axis_raw_tvalid & s_axis_raw_tlast & s_axis_raw_tready) begin
                raw_fifo_load_ena <= ctrl_reg_cpu2fsm[0];
            end
            
            /* Equalized buffer refresh flag */
            if (s_axis_equal_tvalid & s_axis_equal_tlast & s_axis_equal_tready) begin
                equal_fifo_load_ena <= ctrl_reg_cpu2fsm[1];
            end
            
            /* OSD dual buffer toggle flag */
            if (m_axis_osd_tvalid & m_axis_osd_tready & m_axis_osd_tuser[3]) begin
                osd_double_buffer_sel <= ctrl_reg_cpu2fsm[2];
            end
        end
    end

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    /* Main data streaming module. Current FSM manages
     * data movement by AXI-DataMover IP-core */
    
    localparam  [4:0]   ST_ERROR                = 5'd0,
                        ST_RESET                = 5'd1,
                        ST_SWITCH_CNSMR         = 5'd2,
                        
                        ST_DATMOV_S2MM_CMD_0    = 5'd3,
                        ST_DATMOV_S2MM_CMD_1    = 5'd4,
                        ST_DATMOV_S2MM_XFER     = 5'd5,
                        ST_GET_S2MM_XFER_STAT   = 5'd6,
    
                        ST_DATMOV_MM2S_CMD_0    = 5'd7,
                        ST_DATMOV_MM2S_CMD_1    = 5'd8,
                        ST_DATMOV_MM2S_XFER     = 5'd9,                        
                        ST_GET_MM2S_XFER_STAT   = 5'd10,                        

                        ST_SEND_BIAS_ROW        = 5'd11,
                        ST_SEND_AVGI_ROW        = 5'd12,
                        ST_SEND_GAIN_ROW        = 5'd13,
                        ST_SEND_OFST_ROW        = 5'd14,
                        
                        ST_GET_RAW_ROW          = 5'd15,
                        ST_GET_AVGO_ROW         = 5'd16,
                        ST_GET_ROW_TEMP         = 5'd17,
                        
                        ST_GET_REG_CPU2FSM      = 5'd18,
                        ST_SEND_REG_FSM2CPU     = 5'd19,
                        ST_SEND_SENSOR_CMD      = 5'd20,
                        
                        ST_GET_EQUAL_ROW        = 5'd21,
                        ST_HANDLE_CNSMR0        = 5'd22,
                        ST_HANDLE_CNSMR1        = 5'd23,
                        ST_HANDLE_CNSMR2        = 5'd24,
                        ST_HANDLE_CNSMR3        = 5'd25,
                        ST_SEND_OSD_ROW         = 5'd26,
                        ST_HANDLE_CNSMR4        = 5'd27;
                        
    reg         [4:0]   state       = ST_RESET;
    reg         [4:0]   state_next  = ST_RESET;
    
    reg         [2:0]   fifo_sel = 3'd0;
    
    reg                 eol_flag = 1'b0;
    
    reg         [31:0]  raw_frame_ptr   = {32{1'b0}};
    reg         [31:0]  avgo_frame_ptr  = {32{1'b0}};
    reg         [31:0]  rtemp_frame_ptr = {32{1'b0}};
    reg         [31:0]  bias_frame_ptr  = {32{1'b0}};
    reg         [31:0]  gain_frame_ptr  = {32{1'b0}};
    reg         [31:0]  ofst_frame_ptr  = {32{1'b0}};
    reg         [31:0]  avgi_frame_ptr  = {32{1'b0}};
    reg         [31:0]  equal_frame_ptr = {32{1'b0}};
    
    reg         [31:0]  osd_frame_ptr    = {32{1'b0}};
    reg         [31:0]  cnsmr0_frame_ptr = {32{1'b0}};
    reg         [31:0]  cnsmr1_frame_ptr = {32{1'b0}};
    reg         [31:0]  cnsmr2_frame_ptr = {32{1'b0}};
    reg         [31:0]  cnsmr3_frame_ptr = {32{1'b0}};
    reg         [31:0]  cnsmr4_frame_ptr = (C_SENSOR_RES_X * 8) + 8;
    
    reg         [31:0]  byte_offset;
    reg         [22:0]  btt_cnt;
    
    
    wire        [71:0]  datmov_cmd =    { 
                                            4'b0000,        // RSVD
                                            4'b0000,        // TAG (Command TAG)
                                            byte_offset,    // Memory address byte offset
                                            1'b0,           // DRR (DRE ReAlignment Request)
                                            1'b1,           // EOF (End of Frame)
                                            6'b000000,      // DSA (DRE Stream Alignment)
                                            1'b1,           // Access type (0 - fix, 1 - inc)
                                            btt_cnt         // Bytes to transfer count
                                        };
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn | ~fsm_aresetn) begin
            mm2s_xfer_eof <= 1'b0;
            mm2s_xfer_ena <= 1'b0;
            s2mm_xfer_ena <= 1'b0;
            
            state <= ST_RESET;
        end else begin
            
            /* Reset frame pointers at the SOF */
            if (sof_raw_in) begin
                raw_frame_ptr   <= {32{1'b0}};
                avgo_frame_ptr  <= {32{1'b0}};
                rtemp_frame_ptr <= {32{1'b0}};
                bias_frame_ptr  <= {32{1'b0}};
                gain_frame_ptr  <= {32{1'b0}};
                ofst_frame_ptr  <= {32{1'b0}};
                avgi_frame_ptr  <= {32{1'b0}};
                equal_frame_ptr <= {32{1'b0}};
                
                eol_flag <= 1'b1;   // to fill all FIFOs at SOF
            end
        
            /* Registering EOL flag */
            if (eol_strb) begin
                eol_flag <= 1'b1;
            end
            
            /* Data management FSM */
            case (state)
                
                /* Unrecoverable error */
                ST_ERROR: begin
                    state <= state;
                end
                
                ST_RESET: begin
                    mm2s_xfer_eof <= 1'b0;
                    mm2s_xfer_ena <= 1'b0;
                    s2mm_xfer_ena <= 1'b0;
                    
                    state <= ST_SWITCH_CNSMR;                  
                end
                
                ST_SWITCH_CNSMR: begin
                    if (eol_flag) begin
                        /* Here we fill FIFOs that must be mandatory filled 
                         * after each EOL request with highest priority */
                        eol_flag <= 1'b0;
                        state <= ST_SEND_BIAS_ROW;
                    end else begin
                        fifo_sel <= fifo_sel + 1'b1;
                        
                        case (fifo_sel)
                            EQUAL:   state <= ST_GET_EQUAL_ROW;
                            CNSMR0:  state <= ST_HANDLE_CNSMR0;
                            CNSMR1:  state <= ST_HANDLE_CNSMR1;
                            CNSMR2:  state <= ST_HANDLE_CNSMR2;
                            CNSMR3:  state <= ST_HANDLE_CNSMR3;
                            OSD:     state <= ST_SEND_OSD_ROW;
                            CNSMR4:  state <= ST_HANDLE_CNSMR4;
                            
                            default: state <= ST_HANDLE_CNSMR1;
                        endcase
                    end
                end
                
                ST_SEND_BIAS_ROW: begin
                    if (~fifo_bias_prog_full) begin
                        slave_select <= BIAS_ROW_FIFO_ID;     
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (BIAS_FRAME_BUFFER_OFFSET + bias_frame_ptr);       
                        bias_frame_ptr <= bias_frame_ptr + 32'd336;         // 336 pix x 8 bit = 336 bytes = 84 DWORDs
                        btt_cnt <= 23'd336;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_SEND_AVGI_ROW;
                    end else begin
                        state <= ST_SEND_AVGI_ROW;
                    end
                end
                
                ST_SEND_AVGI_ROW: begin
                    if (C_IMAGE_AVERAGING_ENABLE) begin
                        if (~fifo_avgi_prog_full) begin
                            slave_select <= AVGI_ROW_FIFO_ID;
                            byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (AVG_FRAME_BUFFER_OFFSET + avgi_frame_ptr);
                            avgi_frame_ptr <= avgi_frame_ptr + 32'd1344;    // 336 pix x 32 bit = 1344 bytes = 336 DWORDs
                            btt_cnt <= 23'd1344;
                            state <= ST_DATMOV_MM2S_CMD_0;
                            state_next <= ST_SEND_GAIN_ROW;
                        end else begin
                            state <= ST_SEND_GAIN_ROW;
                        end
                    end else begin
                        state <= ST_SEND_GAIN_ROW;
                    end
                end
                
                ST_SEND_GAIN_ROW: begin
                    if (~fifo_gain_prog_full) begin
                        slave_select <= GAIN_ROW_FIFO_ID;        
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (GAIN_FRAME_BUFFER_OFFSET + gain_frame_ptr);      
                        gain_frame_ptr <= gain_frame_ptr + 32'd672;         // 336 pix x 16 bit = 672 bytes = 168 DWORDs
                        btt_cnt <= 23'd672;
                        state <= ST_DATMOV_MM2S_CMD_0;      
                        state_next <= ST_SEND_OFST_ROW;      
                    end else begin      
                        state <= ST_SEND_OFST_ROW;       
                    end  
                end
                
                ST_SEND_OFST_ROW: begin     
                    if (~fifo_ofst_prog_full) begin
                        slave_select <= OFST_ROW_FIFO_ID;        
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (OFST_FRAME_BUFFER_OFFSET + ofst_frame_ptr);      
                        ofst_frame_ptr <= ofst_frame_ptr + 32'd672;         // 336 pix x 16 bit = 672 bytes = 168 DWORDs
                        btt_cnt <= 23'd672;
                        state <= ST_DATMOV_MM2S_CMD_0;      
                        state_next <= ST_GET_RAW_ROW;      
                    end else begin      
                        state <= ST_GET_RAW_ROW;       
                    end     
                end
                
                ST_GET_RAW_ROW: begin
                    if (~fifo_raw_prog_empty & raw_fifo_load_ena) begin
                        master_select <= RAW_ROW_FIFO_ID;
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (RAW_FRAME_BUFFER_OFFSET + raw_frame_ptr);
                        raw_frame_ptr <= raw_frame_ptr + 32'd672;           // 336 pix x 16 bit = 672 bytes = 168 DWORDs
                        btt_cnt <= 23'd672;
                        state <= ST_DATMOV_S2MM_CMD_0;
                        state_next <= ST_GET_AVGO_ROW;
                    end else begin      
                        state <= ST_GET_AVGO_ROW;
                    end     
                end
                
                ST_GET_AVGO_ROW: begin
                    if (C_IMAGE_AVERAGING_ENABLE) begin
                        if (~fifo_avgo_prog_empty) begin
                            master_select <= AVGO_ROW_FIFO_ID;
                            byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (AVG_FRAME_BUFFER_OFFSET + avgo_frame_ptr);
                            avgo_frame_ptr <= avgo_frame_ptr + 32'd1344;    // 336 pix x 32 bit = 1344 bytes = 336 DWORDs
                            btt_cnt <= 23'd1344;
                            state <= ST_DATMOV_S2MM_CMD_0;
                            state_next <= ST_GET_ROW_TEMP;
                        end else begin
                            state <= ST_GET_ROW_TEMP;
                        end
                    end else begin
                        state <= ST_GET_ROW_TEMP;
                    end
                end
                
                ST_GET_ROW_TEMP: begin
                    if (s_axis_rtemp_tvalid) begin
                        master_select <= ROW_TEMP_FIFO_ID;
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (ROW_TEMP_BUFFER_OFFSET + rtemp_frame_ptr);
                        rtemp_frame_ptr <= rtemp_frame_ptr + 32'd4;
                        btt_cnt <= 23'd4;
                        state <= ST_DATMOV_S2MM_CMD_0;
                        state_next <= ST_GET_REG_CPU2FSM;
                    end else begin
                        state <= ST_GET_REG_CPU2FSM;
                    end
                end
                
                ST_GET_REG_CPU2FSM: begin
                    slave_select <= CTRL_REG_CPU2FSM_ID;
                    byte_offset <= C_RAM_BUFFERS_BASE_ADDR | CTRL_REG_CPU2FSM_OFFSET;
                    btt_cnt <= 23'd4;
                    state <= ST_DATMOV_MM2S_CMD_0;
                    state_next <= ST_SEND_REG_FSM2CPU;
                end
                
                ST_SEND_REG_FSM2CPU: begin
                    master_select <= CTRL_REG_FSM2CPU_ID;
                    byte_offset <= C_RAM_BUFFERS_BASE_ADDR | CTRL_REG_FSM2CPU_OFFSET;
                    btt_cnt <= 23'd4;
                    state <= ST_DATMOV_S2MM_CMD_0;                     
                    state_next <= ST_SEND_SENSOR_CMD;
                end
                
                ST_SEND_SENSOR_CMD: begin
                    slave_select <= SENSOR_CMD_ID;
                    byte_offset <= C_RAM_BUFFERS_BASE_ADDR | SENSOR_CMD_RAM_OFFSET;
                    btt_cnt <= 23'd20;
                    state <= ST_DATMOV_MM2S_CMD_0;
                    state_next <= ST_SWITCH_CNSMR;                    
                end
                
                /* We should monitor state of this FIFO not only after EOL,
                 * because due to data processing delay this FIFO will be 
                 * filled with a latency of several rows */
                ST_GET_EQUAL_ROW: begin
                    if (~fifo_equal_prog_empty & equal_fifo_load_ena) begin
                        master_select <= EQUAL_ROW_FIFO_ID;        
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (EQUAL_FRAME_BUFFER_OFFSET + equal_frame_ptr);      
                        equal_frame_ptr <= equal_frame_ptr + 32'd336;   // 336 pix x 8 bit = 336 bytes = 84 DWORDs
                        btt_cnt <= 23'd336;
                        state <= ST_DATMOV_S2MM_CMD_0;
                        /* Continue to readout this FIFO to prevent possible overflow */
                        state_next <= ST_GET_EQUAL_ROW;      
                    end else begin      
                        state <= ST_SWITCH_CNSMR;       
                    end
                end
                
                /* HDMI CH0 */
                ST_HANDLE_CNSMR0: begin
                    if (~fifo_cnsmr_0_prog_full) begin
                        slave_select <= CNSMR0_FIFO_ID;
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (EQUAL_FRAME_BUFFER_OFFSET + cnsmr0_frame_ptr);
                        if (cnsmr0_frame_ptr >= (C_SENSOR_RES_X * (C_SENSOR_RES_Y - 1))) begin
                            mm2s_xfer_eof <= 1'b1;
                            cnsmr0_frame_ptr <= {32{1'b0}};
                        end else begin
                            cnsmr0_frame_ptr <= cnsmr0_frame_ptr + 32'd336;
                        end
                        btt_cnt <= 23'd336;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_SWITCH_CNSMR;
                    end else begin
                        state <= ST_SWITCH_CNSMR;
                    end
                end
                
                /* HDMI CH1 */
                ST_HANDLE_CNSMR1: begin
                    if (~fifo_cnsmr_1_prog_full) begin
                        slave_select <= CNSMR1_FIFO_ID;
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (EQUAL_FRAME_BUFFER_OFFSET + cnsmr1_frame_ptr);
                        if (cnsmr1_frame_ptr >= (C_SENSOR_RES_X * (C_SENSOR_RES_Y - 2))) begin
                            mm2s_xfer_eof <= 1'b1;
                            cnsmr1_frame_ptr <= {32{1'b0}};
                        end else begin
                            cnsmr1_frame_ptr <= cnsmr1_frame_ptr + 32'd672;
                        end
                        btt_cnt <= 23'd672;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_SWITCH_CNSMR;
                    end else begin
                        state <= ST_SWITCH_CNSMR;
                    end
                end
                
                /* USB */
                ST_HANDLE_CNSMR2: begin
                    if (~fifo_cnsmr_2_prog_full) begin
                        slave_select <= CNSMR2_FIFO_ID;
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (EQUAL_FRAME_BUFFER_OFFSET + cnsmr2_frame_ptr);
                        if (cnsmr2_frame_ptr >= (C_SENSOR_RES_X * (C_SENSOR_RES_Y - 1))) begin
                            mm2s_xfer_eof <= 1'b1;
                            cnsmr2_frame_ptr <= {32{1'b0}};
                        end else begin
                            cnsmr2_frame_ptr <= cnsmr2_frame_ptr + 32'd336;
                        end
                        btt_cnt <= 23'd336;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_SWITCH_CNSMR;
                    end else begin
                        state <= ST_SWITCH_CNSMR;
                    end
                end
                
                /* AV */
                ST_HANDLE_CNSMR3: begin
                    if (~fifo_cnsmr_3_prog_full) begin
                        slave_select <= CNSMR3_FIFO_ID;
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (EQUAL_FRAME_BUFFER_OFFSET + cnsmr3_frame_ptr);
                        if (cnsmr3_frame_ptr >= (C_SENSOR_RES_X * (C_SENSOR_RES_Y - 1))) begin
                            mm2s_xfer_eof <= 1'b1;
                            cnsmr3_frame_ptr <= {32{1'b0}};
                        end else begin
                            if (cnsmr3_frame_ptr >= (C_SENSOR_RES_X * (C_SENSOR_RES_Y - 2))) begin  // TODO: progressive/interlace switch!!!
                                cnsmr3_frame_ptr <= 32'd336;
                            end else begin
                                cnsmr3_frame_ptr <= cnsmr3_frame_ptr + 32'd672;
                            end
                        end
                        btt_cnt <= 23'd336;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_SWITCH_CNSMR;
                    end else begin
                        state <= ST_SWITCH_CNSMR;
                    end
                end
                
                /* OSD for LCD */
                ST_SEND_OSD_ROW: begin
                    if (~fifo_osd_prog_full) begin
                        slave_select <= OSD_ROW_FIFO_ID;
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (((osd_double_buffer_sel)? OSD_FRAME_BUFFER_1_OFFSET : OSD_FRAME_BUFFER_0_OFFSET) + osd_frame_ptr);
                        if (osd_frame_ptr >= (320 * 2 * (240 - 1))) begin
                            mm2s_xfer_eof <= 1'b1;
                            osd_frame_ptr <= {32{1'b0}};
                        end else begin
                            osd_frame_ptr <= osd_frame_ptr + 32'd640;
                        end
                        btt_cnt <= 23'd640;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_SWITCH_CNSMR;
                    end else begin
                        state <= ST_SWITCH_CNSMR;
                    end
                end
                
                /* LCD */
                ST_HANDLE_CNSMR4: begin
                    if (~fifo_cnsmr_4_prog_full) begin
                        slave_select <= CNSMR4_FIFO_ID;
                        byte_offset <= C_RAM_BUFFERS_BASE_ADDR | (EQUAL_FRAME_BUFFER_OFFSET + cnsmr4_frame_ptr);
                        if (cnsmr4_frame_ptr >= (C_SENSOR_RES_X * 248 - 8 - 320)) begin
                            mm2s_xfer_eof <= 1'b1;
                            cnsmr4_frame_ptr <= (C_SENSOR_RES_X * 8) + 8;
                        end else begin
                            cnsmr4_frame_ptr <= cnsmr4_frame_ptr + 32'd336;
                        end
                        btt_cnt <= 23'd320;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_SWITCH_CNSMR;
                    end else begin
                        state <= ST_SWITCH_CNSMR;
                    end
                end
                
                /* Generate S2MM command for DataMover */
                ST_DATMOV_S2MM_CMD_0: begin
                    m_axis_s2mm_cmd_tdata <= datmov_cmd;
                    m_axis_s2mm_cmd_tvalid <= 1'b1;
                    state <= ST_DATMOV_S2MM_CMD_1;
                end
                
                /* Wait S2MM command to be accepted */
                ST_DATMOV_S2MM_CMD_1: begin
                    if (m_axis_s2mm_cmd_tready) begin
                        m_axis_s2mm_cmd_tvalid <= 1'b0;
                        s2mm_xfer_ena <= 1'b1;
                        state <= ST_DATMOV_S2MM_XFER;
                    end
                end
                
                /* Wait S2MM transfer to be done */
                ST_DATMOV_S2MM_XFER: begin
                    if (m_axis_s2mm_tvalid & m_axis_s2mm_tready & m_axis_s2mm_tlast) begin
                        s2mm_xfer_ena <= 1'b0;
                        s_axis_s2mm_sts_tready <= 1'b1;
                        state <= ST_GET_S2MM_XFER_STAT;
                    end
                end
                
                /* Check S2MM transfer status */
                ST_GET_S2MM_XFER_STAT: begin
                    if (s_axis_s2mm_sts_tvalid) begin
                        s_axis_s2mm_sts_tready <= 1'b0;
                        if (s_axis_s2mm_sts_tdata[7:4] == DMA_XFER_OKAY) begin
                            state <= state_next;
                        end else begin
                            state <= ST_ERROR;
                        end
                    end
                end              
                
                /* Generate MM2S command for DataMover */
                ST_DATMOV_MM2S_CMD_0: begin
                    m_axis_mm2s_cmd_tdata <= datmov_cmd;
                    m_axis_mm2s_cmd_tvalid <= 1'b1;
                    state <= ST_DATMOV_MM2S_CMD_1;
                end
                
                /* Wait MM2S command to be accepted */
                ST_DATMOV_MM2S_CMD_1: begin
                    if (m_axis_mm2s_cmd_tready) begin
                        m_axis_mm2s_cmd_tvalid <= 1'b0;
                        mm2s_xfer_ena <= 1'b1;
                        state <= ST_DATMOV_MM2S_XFER;
                    end
                end
                
                /* Wait MM2S transfer to be done */
                ST_DATMOV_MM2S_XFER: begin  
                    if (s_axis_mm2s_tvalid & s_axis_mm2s_tready & s_axis_mm2s_tlast) begin
                        mm2s_xfer_eof <= 1'b0;
                        mm2s_xfer_ena <= 1'b0;
                        s_axis_mm2s_sts_tready <= 1'b1;
                        state <= ST_GET_MM2S_XFER_STAT;
                    end
                end
                
                /* Check MM2S transfer status */
                ST_GET_MM2S_XFER_STAT: begin
                    if (s_axis_mm2s_sts_tvalid) begin
                        s_axis_mm2s_sts_tready <= 1'b0;
                        if (s_axis_mm2s_sts_tdata[7:4] == DMA_XFER_OKAY) begin
                            state <= state_next;
                        end else begin
                            state <= ST_ERROR;
                        end
                    end
                end
                
                default: begin
                    state <= ST_ERROR;
                end
                
            endcase
        end
    end
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
