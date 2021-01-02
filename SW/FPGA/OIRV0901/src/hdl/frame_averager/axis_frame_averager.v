/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_frame_averager.v
 *  Purpose:  AXI4-Stream frame averaging module. Temporary averaging buffer
 *            is located in any external memory array.
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


module axis_frame_averager #
(
    parameter   AVERAGER_BYPASS = 1
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axis_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXIS_AVGI:M_AXIS_AVGO:S_AXIS_IMG:M_AXIS_IMG, ASSOCIATED_RESET axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axis_aclk,
    
    input   wire    [2:0]   average_level,
    input   wire            sof_raw_in,
    output  wire            sof_avg_out,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_AVGI, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGI TDATA"  *) input   wire    [31:0]  s_axis_avgi_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGI TVALID" *) input   wire            s_axis_avgi_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGI TREADY" *) output  wire            s_axis_avgi_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGI TLAST"  *) input   wire            s_axis_avgi_tlast,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_AVGO, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGO TDATA"  *) output  wire    [31:0]  m_axis_avgo_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGO TVALID" *) output  wire            m_axis_avgo_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGO TREADY" *) input   wire            m_axis_avgo_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGO TLAST"  *) output  wire            m_axis_avgo_tlast,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_IMG, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IMG TDATA"  *)  input   wire    [15:0]  s_axis_img_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IMG TVALID" *)  input   wire            s_axis_img_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IMG TREADY" *)  output  wire            s_axis_img_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IMG TLAST"  *)  input   wire            s_axis_img_tlast,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_IMG, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG TDATA"  *)  output  wire    [15:0]  m_axis_img_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG TVALID" *)  output  wire            m_axis_img_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG TREADY" *)  input   wire            m_axis_img_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG TLAST"  *)  output  wire            m_axis_img_tlast
);
    
    localparam  DSP_PIPE_DELAY = 4;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    generate
    if (AVERAGER_BYPASS == 0) begin
        
        reg                 sof_avg         = 1'b0;
        reg                 avg_pix_tvalid  = 1'b0;
        reg         [6:0]   avg_frame_cnt   = 7'd0;
        reg         [6:0]   avg_ref_value   = 7'd0;
        reg         [2:0]   average_level_1 = 3'd0;
        
        reg         [31:0]  dsp_C_mask = {32{1'b0}};
        
        always @(posedge axis_aclk) begin
            if (~axis_aresetn) begin
                avg_pix_tvalid <= 1'b0;
                dsp_C_mask <= {32{1'b0}};
            end else begin
                if (sof_raw_in) begin
                    if (average_level_1 != 3'd0) begin
                        if (avg_frame_cnt == 7'd0) begin
                            avg_pix_tvalid  <= 1'b0;
                            avg_frame_cnt   <= avg_frame_cnt + 1'b1;
                            average_level_1 <= average_level;
                            dsp_C_mask      <= {32{1'b0}};
                        end else begin
                            if (avg_frame_cnt == avg_ref_value) begin
                                avg_pix_tvalid <= 1'b1;
                                avg_frame_cnt  <= 7'd0;
                            end else begin
                                avg_pix_tvalid <= 1'b0;
                                avg_frame_cnt  <= avg_frame_cnt + 1'b1;
                            end
                            
                            dsp_C_mask <= {32{1'b1}};
                        end
                    end else begin
                        average_level_1 <= average_level;
                        avg_pix_tvalid  <= 1'b1;
                        avg_frame_cnt   <= 7'd0;
                        dsp_C_mask      <= {32{1'b0}};
                    end
                end
            end
        end
        
        
        /* New SOF strobe for averaged data stream */
        always @(posedge axis_aclk) begin
            if (~axis_aresetn) begin
                sof_avg <= 1'b0;
            end else begin
                if (sof_raw_in) begin
                    if (average_level_1 != 3'd0) begin
                        if (avg_frame_cnt == 7'd0) begin
                            sof_avg <= 1'b1;
                        end else begin
                            sof_avg <= 1'b0;
                        end
                    end else begin
                        sof_avg <= 1'b1;
                    end
                end else begin
                    sof_avg <= 1'b0;
                end
            end
        end
        
        assign sof_avg_out = sof_avg;

/*-------------------------------------------------------------------------------------------------------------------------------------*/
        
        wire    [47:0]  dsp_P_tdata;
        wire            dsp_P_tvalid;
        wire            dsp_P_tready;
        wire            dsp_P_tlast;
        
        
        /* P = (D-A)*B+C */
        axis_dsp_linear_func axis_dsp_linear_func_inst
        (
            .axis_aclk              ( axis_aclk           ),
            .axis_aresetn           ( axis_aresetn        ),
            .dsp_func_sel           ( 1'b0                ),    // (D-A)*B+C
            
            .dsp_D_s_axis_tdata     ({{4{1'b0}}, s_axis_img_tdata[13:0]}),
            .dsp_D_s_axis_tvalid    ( s_axis_img_tvalid   ),
            .dsp_D_s_axis_tready    ( s_axis_img_tready   ),
            .dsp_D_s_axis_tlast     ( s_axis_img_tlast    ),
            
            .dsp_A_s_axis_tdata     ( 18'd0               ),
            .dsp_A_s_axis_tvalid    ( 1'b1                ),
            .dsp_A_s_axis_tready    ( /*------NC------*/  ),
            .dsp_A_s_axis_tlast     ( 1'b1                ),
            
            .dsp_B_s_axis_tdata     ( 18'd1               ),
            .dsp_B_s_axis_tvalid    ( 1'b1                ),
            .dsp_B_s_axis_tready    ( /*------NC------*/  ),
            .dsp_B_s_axis_tlast     ( 1'b1                ),
            
            .dsp_C_s_axis_tdata     ( {{16{1'b0}}, s_axis_avgi_tdata & dsp_C_mask}),
            .dsp_C_s_axis_tvalid    ( s_axis_avgi_tvalid  ),
            .dsp_C_s_axis_tready    ( s_axis_avgi_tready  ),
            .dsp_C_s_axis_tlast     ( s_axis_avgi_tlast   ),
            
            .dsp_P_m_axis_tdata     ( dsp_P_tdata         ),
            .dsp_P_m_axis_tvalid    ( dsp_P_tvalid        ),
            .dsp_P_m_axis_tready    ( dsp_P_tready        ),
            .dsp_P_m_axis_tlast     ( dsp_P_tlast         )
        );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
        wire    [31:0]  m0_axis_tdata;
        wire            m0_axis_tvalid;
        wire            m0_axis_tready;
        wire            m0_axis_tlast;
        
        wire    [31:0]  m1_axis_tdata;
        wire            m1_axis_tvalid;
        wire            m1_axis_tready;
        wire            m1_axis_tlast;
        
        
        axis_2w_splitter #
        (
            .AXIS_TDATA_WIDTH (32),
            .AXIS_TUSER_WIDTH (1)
        )
        axis_2w_splitter_inst
        (
            .axis_aclk          ( axis_aclk         ), 
            .axis_aresetn       ( axis_aresetn      ), 
            
            .s_axis_tdata       ( dsp_P_tdata[31:0] ), 
            .s_axis_tvalid      ( dsp_P_tvalid      ), 
            .s_axis_tready      ( dsp_P_tready      ), 
            .s_axis_tlast       ( dsp_P_tlast       ), 
            .s_axis_tuser       ( 1'b0              ), 
            
            .m_axis_0_tdata     ( m0_axis_tdata     ), 
            .m_axis_0_tvalid    ( m0_axis_tvalid    ), 
            .m_axis_0_tready    ( m0_axis_tready    ), 
            .m_axis_0_tlast     ( m0_axis_tlast     ), 
            .m_axis_0_tuser     ( /*------NC-----*/ ), 
            
            .m_axis_1_tdata     ( m1_axis_tdata     ), 
            .m_axis_1_tvalid    ( m1_axis_tvalid    ), 
            .m_axis_1_tready    ( m1_axis_tready    ), 
            .m_axis_1_tlast     ( m1_axis_tlast     ),
            .m_axis_1_tuser     ( /*------NC-----*/ )
        );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

        reg     [13:0]  avg_result;
        
        
        always @(*) begin
            case (average_level_1)
                /* No averaging */
                3'd0: begin
                    avg_ref_value = 7'd0;
                    avg_result = m0_axis_tdata[13:0];
                end
                
                /* 2x averaging */
                3'd1: begin
                    avg_ref_value = 7'd1;
                    avg_result = m0_axis_tdata[14:1];
                end
                
                /* 4x averaging */
                3'd2: begin
                    avg_ref_value = 7'd3;
                    avg_result = m0_axis_tdata[15:2];
                end
                
                /* 8x averaging */
                3'd3: begin
                    avg_ref_value = 7'd7;
                    avg_result = m0_axis_tdata[16:3];
                end
                
                /* 16x averaging */
                3'd4: begin
                    avg_ref_value = 7'd15;
                    avg_result = m0_axis_tdata[17:4];
                end
                
                /* 32x averaging */
                3'd5: begin
                    avg_ref_value = 7'd31;
                    avg_result = m0_axis_tdata[18:5];
                end
                
                /* 64x averaging */
                3'd6: begin
                    avg_ref_value = 7'd63;
                    avg_result = m0_axis_tdata[19:6];
                end
                
                /* 128x averaging */
                3'd7: begin
                    avg_ref_value = 7'd127;
                    avg_result = m0_axis_tdata[20:7];
                end
            endcase
        end
        
        
        assign m_axis_img_tdata   = {{2{1'b0}}, avg_result};
        assign m_axis_img_tvalid  = m0_axis_tvalid & avg_pix_tvalid;
        assign m_axis_img_tlast   = m0_axis_tlast;
        assign m0_axis_tready     = m_axis_img_tready;
        
        assign m_axis_avgo_tdata  = m1_axis_tdata;
        assign m_axis_avgo_tvalid = m1_axis_tvalid;
        assign m_axis_avgo_tlast  = m1_axis_tlast;
        assign m1_axis_tready     = m_axis_avgo_tready;
        
    end else begin
        
        assign sof_avg_out = sof_raw_in;
        
        assign s_axis_avgi_tready = 1'b0;
        
        assign m_axis_avgo_tdata  = {32{1'b0}};
        assign m_axis_avgo_tvalid = 1'b0;
        assign m_axis_avgo_tlast  = 1'b0;
        
        assign m_axis_img_tdata   = s_axis_img_tdata;
        assign m_axis_img_tvalid  = s_axis_img_tvalid;
        assign m_axis_img_tlast   = s_axis_img_tlast;
        assign s_axis_img_tready  = m_axis_img_tready;
        
    end
    endgenerate
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
