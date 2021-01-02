/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: gpio_concat.v
 *  Purpose:  GPIO concatenation module to simplify AXI GPIO block design.
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


module gpio_concat
(
    output  wire    [3:0]   gpio,
    
    input   wire            btn_0,
    input   wire            btn_1,
    input   wire            btn_2,
    input   wire            btn_3
);
    
    assign  gpio[0] = btn_0;
    assign  gpio[1] = btn_1;
    assign  gpio[2] = btn_2;
    assign  gpio[3] = btn_3;
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
