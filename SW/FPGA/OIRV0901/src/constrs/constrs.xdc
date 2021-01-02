#-----------------------------------------------------------------------------
#  Project:  OpenIRV
#  Filename: constrs.xdc
#  Purpose:  OpenIRV project M-board v1.0.0 constraints file.
#-----------------------------------------------------------------------------
#  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
#  
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#  
#      http://www.apache.org/licenses/LICENSE-2.0
#  
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#-----------------------------------------------------------------------------

set_property BITSTREAM.CONFIG.CCLK_TRISTATE FALSE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.M2PIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.M1PIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.M0PIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.INITPIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.DONEPIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.CCLKPIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.PROGPIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.TCKPIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.TDIPIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.TDOPIN PULLNONE [current_design]
set_property BITSTREAM.CONFIG.TMSPIN PULLNONE [current_design]

#------------------------------------EXTCLK------------------------------------#

set_property PACKAGE_PIN F14 [get_ports extclk]
set_property IOSTANDARD LVCMOS33 [get_ports extclk]

#-------------------------------------TMDS-------------------------------------#

set_property PACKAGE_PIN U16 [get_ports tmds_d0_p]
set_property PACKAGE_PIN U17 [get_ports tmds_d1_p]
set_property PACKAGE_PIN R18 [get_ports tmds_d2_p]
set_property PACKAGE_PIN R14 [get_ports tmds_clk_p]

set_property IOSTANDARD TMDS_33 [get_ports tmds_d0_p]
set_property IOSTANDARD TMDS_33 [get_ports tmds_d0_n]
set_property IOSTANDARD TMDS_33 [get_ports tmds_d1_p]
set_property IOSTANDARD TMDS_33 [get_ports tmds_d1_n]
set_property IOSTANDARD TMDS_33 [get_ports tmds_d2_p]
set_property IOSTANDARD TMDS_33 [get_ports tmds_d2_n]
set_property IOSTANDARD TMDS_33 [get_ports tmds_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports tmds_clk_n]

#----------------------------------HyperRAM_R0---------------------------------#

set_property PACKAGE_PIN T1 [get_ports hram_r0_ck_p]
set_property PACKAGE_PIN U1 [get_ports hram_r0_ck_n]
set_property PACKAGE_PIN V5 [get_ports hram_r0_reset_n]
set_property PACKAGE_PIN V3 [get_ports hram_r0_cs_n]
set_property PACKAGE_PIN U2 [get_ports hram_r0_rwds]
set_property PACKAGE_PIN M3 [get_ports {hram_r0_dq[0]}]
set_property PACKAGE_PIN N3 [get_ports {hram_r0_dq[1]}]
set_property PACKAGE_PIN R2 [get_ports {hram_r0_dq[2]}]
set_property PACKAGE_PIN K2 [get_ports {hram_r0_dq[3]}]
set_property PACKAGE_PIN K1 [get_ports {hram_r0_dq[4]}]
set_property PACKAGE_PIN L1 [get_ports {hram_r0_dq[5]}]
set_property PACKAGE_PIN M2 [get_ports {hram_r0_dq[6]}]
set_property PACKAGE_PIN N1 [get_ports {hram_r0_dq[7]}]

set_property IOSTANDARD LVCMOS18 [get_ports hram_r0_ck_p]
set_property IOSTANDARD LVCMOS18 [get_ports hram_r0_ck_n]
set_property IOSTANDARD LVCMOS18 [get_ports hram_r0_reset_n]
set_property IOSTANDARD LVCMOS18 [get_ports hram_r0_cs_n]
set_property IOSTANDARD LVCMOS18 [get_ports hram_r0_rwds]
set_property IOSTANDARD LVCMOS18 [get_ports {hram_r0_dq[*]}]

#----------------------------------HyperRAM_R1---------------------------------#

set_property PACKAGE_PIN R3 [get_ports hram_r1_ck_p]
set_property PACKAGE_PIN T2 [get_ports hram_r1_ck_n]
set_property PACKAGE_PIN V7 [get_ports hram_r1_reset_n]
set_property PACKAGE_PIN V6 [get_ports hram_r1_cs_n]
set_property PACKAGE_PIN T6 [get_ports hram_r1_rwds]
set_property PACKAGE_PIN R4 [get_ports {hram_r1_dq[0]}]
set_property PACKAGE_PIN N5 [get_ports {hram_r1_dq[1]}]
set_property PACKAGE_PIN V4 [get_ports {hram_r1_dq[2]}]
set_property PACKAGE_PIN K6 [get_ports {hram_r1_dq[3]}]
set_property PACKAGE_PIN T3 [get_ports {hram_r1_dq[4]}]
set_property PACKAGE_PIN L5 [get_ports {hram_r1_dq[5]}]
set_property PACKAGE_PIN P6 [get_ports {hram_r1_dq[6]}]
set_property PACKAGE_PIN M6 [get_ports {hram_r1_dq[7]}]

set_property IOSTANDARD LVCMOS18 [get_ports hram_r1_ck_p]
set_property IOSTANDARD LVCMOS18 [get_ports hram_r1_ck_n]
set_property IOSTANDARD LVCMOS18 [get_ports hram_r1_reset_n]
set_property IOSTANDARD LVCMOS18 [get_ports hram_r1_cs_n]
set_property IOSTANDARD LVCMOS18 [get_ports hram_r1_rwds]
set_property IOSTANDARD LVCMOS18 [get_ports {hram_r1_dq[*]}]

#----------------------------------SENSOR_IO-----------------------------------#

set_property PACKAGE_PIN A11 [get_ports {gpio_sensor[0]}]
set_property PACKAGE_PIN A9  [get_ports {gpio_sensor[1]}]
set_property PACKAGE_PIN A10 [get_ports {gpio_sensor[2]}]
set_property PACKAGE_PIN C12 [get_ports {gpio_sensor[3]}]
set_property PACKAGE_PIN A2  [get_ports {gpio_sensor[4]}]
set_property PACKAGE_PIN B3  [get_ports {gpio_sensor[5]}]
set_property PACKAGE_PIN C2  [get_ports {gpio_sensor[6]}]
set_property PACKAGE_PIN C1  [get_ports {gpio_sensor[7]}]
set_property PACKAGE_PIN A3  [get_ports {gpio_sensor[8]}]
set_property PACKAGE_PIN B2  [get_ports {gpio_sensor[9]}]
set_property PACKAGE_PIN A4  [get_ports {gpio_sensor[10]}]
set_property PACKAGE_PIN F4  [get_ports {gpio_sensor[11]}]
set_property PACKAGE_PIN A5  [get_ports {gpio_sensor[12]}]
set_property PACKAGE_PIN B5  [get_ports {gpio_sensor[13]}]
set_property PACKAGE_PIN A6  [get_ports {gpio_sensor[14]}]
set_property PACKAGE_PIN C7  [get_ports {gpio_sensor[15]}]
set_property PACKAGE_PIN A7  [get_ports {gpio_sensor[16]}]
set_property PACKAGE_PIN B7  [get_ports {gpio_sensor[17]}]
set_property PACKAGE_PIN A8  [get_ports {gpio_sensor[18]}]
set_property PACKAGE_PIN C10 [get_ports {gpio_sensor[19]}]

set_property IOSTANDARD LVCMOS25 [get_ports {gpio_sensor[*]}]

#-------------------------------CONFIG_SPI_FLASH-------------------------------#

set_property PACKAGE_PIN M13 [get_ports cnfg_cs_n]
set_property PACKAGE_PIN K17 [get_ports cnfg_mosi_miso_0]
set_property PACKAGE_PIN K18 [get_ports cnfg_miso_miso_1]
set_property PACKAGE_PIN L14 [get_ports cnfg_miso_2]
set_property PACKAGE_PIN M15 [get_ports cnfg_miso_3]

set_property IOSTANDARD LVCMOS33 [get_ports cnfg_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports cnfg_mosi_miso_0]
set_property IOSTANDARD LVCMOS33 [get_ports cnfg_miso_miso_1]
set_property IOSTANDARD LVCMOS33 [get_ports cnfg_miso_2]
set_property IOSTANDARD LVCMOS33 [get_ports cnfg_miso_3]

#------------------------------------FX2/AV------------------------------------#

set_property PACKAGE_PIN G16 [get_ports fx2_ifclk]
set_property PACKAGE_PIN P13 [get_ports av_clkin]

set_property IOSTANDARD LVCMOS33 [get_ports fx2_ifclk]
set_property IOSTANDARD LVCMOS33 [get_ports av_clkin]


set_property PACKAGE_PIN G18 [get_ports fx2_pa0]
set_property PACKAGE_PIN H17 [get_ports fx2_pa1_led_act_y]
set_property PACKAGE_PIN M17 [get_ports fx2_pa2]
set_property PACKAGE_PIN U11 [get_ports fx2_pa3_led_act_r]
set_property PACKAGE_PIN V15 [get_ports fx2_pa4]
set_property PACKAGE_PIN V14 [get_ports fx2_pa5]
set_property PACKAGE_PIN R15 [get_ports fx2_pa6]
set_property PACKAGE_PIN P14 [get_ports fx2_pa7_hdmi_cec]

set_property IOSTANDARD LVCMOS33 [get_ports fx2_pa0]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_pa1_led_act_y]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_pa2]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_pa3_led_act_r]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_pa4]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_pa5]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_pa6]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_pa7_hdmi_cec]


set_property PACKAGE_PIN N15 [get_ports {fx2_pb[0]}]
set_property PACKAGE_PIN L17 [get_ports {fx2_pb[1]}]
set_property PACKAGE_PIN L16 [get_ports {fx2_pb[2]}]
set_property PACKAGE_PIN M16 [get_ports {fx2_pb[3]}]
set_property PACKAGE_PIN C18 [get_ports {fx2_pb[4]}]
set_property PACKAGE_PIN C17 [get_ports {fx2_pb[5]}]
set_property PACKAGE_PIN D18 [get_ports {fx2_pb[6]}]
set_property PACKAGE_PIN D17 [get_ports {fx2_pb[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {fx2_pb[*]}]


set_property PACKAGE_PIN P17 [get_ports {fx2_av_pd[0]}]
set_property PACKAGE_PIN P15 [get_ports {fx2_av_pd[1]}]
set_property PACKAGE_PIN R13 [get_ports {fx2_av_pd[2]}]
set_property PACKAGE_PIN R12 [get_ports {fx2_av_pd[3]}]
set_property PACKAGE_PIN T13 [get_ports {fx2_av_pd[4]}]
set_property PACKAGE_PIN T12 [get_ports {fx2_av_pd[5]}]
set_property PACKAGE_PIN T11 [get_ports {fx2_av_pd[6]}]
set_property PACKAGE_PIN V12 [get_ports {fx2_av_pd[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {fx2_av_pd[*]}]


set_property PACKAGE_PIN P16 [get_ports fx2_rdy0_slrd]
set_property PACKAGE_PIN N18 [get_ports fx2_rdy1_slwr]
set_property PACKAGE_PIN E17 [get_ports fx2_ctl0_flaga]
set_property PACKAGE_PIN F18 [get_ports fx2_ctl1_flagb]
set_property PACKAGE_PIN G17 [get_ports fx2_ctl2_flagc]

set_property IOSTANDARD LVCMOS33 [get_ports fx2_rdy0_slrd]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_rdy1_slwr]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_ctl0_flaga]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_ctl1_flagb]
set_property IOSTANDARD LVCMOS33 [get_ports fx2_ctl2_flagc]

#-------------------------------------LCD--------------------------------------#

set_property PACKAGE_PIN L18 [get_ports lcd_led_ctrl]
set_property PACKAGE_PIN R7 [get_ports lcd_spi_dat]
set_property PACKAGE_PIN R6 [get_ports lcd_spi_sck]
set_property PACKAGE_PIN U7 [get_ports lcd_spi_rst_n]

set_property IOSTANDARD LVCMOS33 [get_ports lcd_led_ctrl]
set_property IOSTANDARD LVCMOS18 [get_ports lcd_spi_dat]
set_property IOSTANDARD LVCMOS18 [get_ports lcd_spi_sck]
set_property IOSTANDARD LVCMOS18 [get_ports lcd_spi_rst_n]

#------------------------------------SD_CARD-----------------------------------#

set_property PACKAGE_PIN F15 [get_ports sdio_cmd]
set_property PACKAGE_PIN D14 [get_ports sdio_clk]
set_property PACKAGE_PIN E16 [get_ports {sdio_dat[0]}]
set_property PACKAGE_PIN E15 [get_ports {sdio_dat[1]}]
set_property PACKAGE_PIN H16 [get_ports {sdio_dat[2]}]
set_property PACKAGE_PIN E14 [get_ports {sdio_dat[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports sdio_cmd]
set_property IOSTANDARD LVCMOS33 [get_ports sdio_clk]
set_property IOSTANDARD LVCMOS33 [get_ports {sdio_dat[*]}]

#--------------------------------------I2C-------------------------------------#

set_property PACKAGE_PIN D15 [get_ports i2c_sda]
set_property PACKAGE_PIN J16 [get_ports i2c_scl]
set_property PACKAGE_PIN E18 [get_ports i2c_irq_n]

set_property IOSTANDARD LVCMOS33 [get_ports i2c_sda]
set_property IOSTANDARD LVCMOS33 [get_ports i2c_scl]
set_property IOSTANDARD LVCMOS33 [get_ports i2c_irq_n]

#-------------------------------SENSOR_PWR_CTRL--------------------------------#

set_property PACKAGE_PIN U12 [get_ports sensor_bias_boost_pwr_ena]
set_property PACKAGE_PIN B13 [get_ports sensor_core_pwr_ena]
set_property PACKAGE_PIN A13 [get_ports sensor_bias_pwr_ena]
set_property PACKAGE_PIN F13 [get_ports sensor_io_pwr_ena_n]
set_property PACKAGE_PIN B17 [get_ports sensor_bias_volt_sel]

set_property IOSTANDARD LVCMOS33 [get_ports sensor_bias_boost_pwr_ena]
set_property IOSTANDARD LVCMOS33 [get_ports sensor_core_pwr_ena]
set_property IOSTANDARD LVCMOS33 [get_ports sensor_bias_pwr_ena]
set_property IOSTANDARD LVCMOS33 [get_ports sensor_io_pwr_ena_n]
set_property IOSTANDARD LVCMOS33 [get_ports sensor_bias_volt_sel]

#----------------------------SHUTTER_AND_FOCUS_CTRL----------------------------#

set_property PACKAGE_PIN P18 [get_ports shtr_drive_ena]
set_property PACKAGE_PIN R17 [get_ports focus_drive_ena]
set_property PACKAGE_PIN H15 [get_ports focus_sensor_pulse]

set_property IOSTANDARD LVCMOS33 [get_ports shtr_drive_ena]
set_property IOSTANDARD LVCMOS33 [get_ports focus_drive_ena]
set_property IOSTANDARD LVCMOS33 [get_ports focus_sensor_pulse]

#-------------------------------GPIO_AUX_SPI_I2C-------------------------------#

set_property PACKAGE_PIN A14 [get_ports gpio_aux_spi_sck]
set_property PACKAGE_PIN B15 [get_ports gpio_aux_spi_cs_0]
set_property PACKAGE_PIN A16 [get_ports gpio_aux_spi_cs_1]
set_property PACKAGE_PIN B14 [get_ports gpio_aux_spi_miso]
set_property PACKAGE_PIN A15 [get_ports gpio_aux_spi_mosi]

set_property IOSTANDARD LVCMOS33 [get_ports gpio_aux_spi_sck]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_aux_spi_cs_0]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_aux_spi_cs_1]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_aux_spi_miso]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_aux_spi_mosi]


set_property PACKAGE_PIN B16 [get_ports gpio_aux_i2c_sda]
set_property PACKAGE_PIN A17 [get_ports gpio_aux_i2c_scl]

set_property IOSTANDARD LVCMOS33 [get_ports gpio_aux_i2c_sda]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_aux_i2c_scl]

#-----------------------------------EXT_GPIO-----------------------------------#

set_property PACKAGE_PIN D16 [get_ports ext_gpio_0_buf]
set_property PACKAGE_PIN E12 [get_ports ext_gpio_0_dir]
set_property PACKAGE_PIN M18 [get_ports ext_gpio_0_oc]

set_property IOSTANDARD LVCMOS33 [get_ports ext_gpio_0_buf]
set_property IOSTANDARD LVCMOS33 [get_ports ext_gpio_0_dir]
set_property IOSTANDARD LVCMOS33 [get_ports ext_gpio_0_oc]


set_property PACKAGE_PIN D12 [get_ports ext_gpio_1_buf]
set_property PACKAGE_PIN C13 [get_ports ext_gpio_1_dir]
set_property PACKAGE_PIN B18 [get_ports ext_gpio_1_oc]

set_property IOSTANDARD LVCMOS33 [get_ports ext_gpio_1_buf]
set_property IOSTANDARD LVCMOS33 [get_ports ext_gpio_1_dir]
set_property IOSTANDARD LVCMOS33 [get_ports ext_gpio_1_oc]


set_property PACKAGE_PIN H14 [get_ports ext_gpi_buf]

set_property IOSTANDARD LVCMOS33 [get_ports ext_gpi_buf]

#------------------------------POWER_KEEP_TRIGGER------------------------------#

set_property PACKAGE_PIN J13 [get_ports pwr_fd_clk]
set_property PACKAGE_PIN H13 [get_ports pwr_fd_dat]

set_property IOSTANDARD LVCMOS33 [get_ports pwr_fd_clk]
set_property IOSTANDARD LVCMOS33 [get_ports pwr_fd_dat]

#------------------------------------BUTTONS-----------------------------------#

set_property PACKAGE_PIN G15 [get_ports {btn[0]}]
set_property PACKAGE_PIN J14 [get_ports {btn[1]}]
set_property PACKAGE_PIN E13 [get_ports {btn[2]}]
set_property PACKAGE_PIN V13 [get_ports {btn[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {btn[*]}]

#------------------------------------------------------------------------------#

#set_property IOB TRUE [all_outputs]
#set_property IOB TRUE [all_inputs]
