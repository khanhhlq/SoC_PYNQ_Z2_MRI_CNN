transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_23
vlib riviera/processing_system7_vip_v1_0_25
vlib riviera/xil_defaultlib
vlib riviera/axi_datamover_v5_1_38
vlib riviera/axi_sg_v4_1_21
vlib riviera/axi_dma_v7_1_38
vlib riviera/smartconnect_v1_0
vlib riviera/proc_sys_reset_v5_0_17
vlib riviera/axi_register_slice_v2_1_37
vlib riviera/generic_baseblocks_v2_1_2
vlib riviera/fifo_generator_v13_2_15
vlib riviera/axi_data_fifo_v2_1_37
vlib riviera/axi_protocol_converter_v2_1_38

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_23 riviera/axi_vip_v1_1_23
vmap processing_system7_vip_v1_0_25 riviera/processing_system7_vip_v1_0_25
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_datamover_v5_1_38 riviera/axi_datamover_v5_1_38
vmap axi_sg_v4_1_21 riviera/axi_sg_v4_1_21
vmap axi_dma_v7_1_38 riviera/axi_dma_v7_1_38
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap proc_sys_reset_v5_0_17 riviera/proc_sys_reset_v5_0_17
vmap axi_register_slice_v2_1_37 riviera/axi_register_slice_v2_1_37
vmap generic_baseblocks_v2_1_2 riviera/generic_baseblocks_v2_1_2
vmap fifo_generator_v13_2_15 riviera/fifo_generator_v13_2_15
vmap axi_data_fifo_v2_1_37 riviera/axi_data_fifo_v2_1_37
vmap axi_protocol_converter_v2_1_38 riviera/axi_protocol_converter_v2_1_38

vlog -work xilinx_vip  -incr "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"C:/AMDDesignTools/2026.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/AMDDesignTools/2026.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_23  -incr "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/4d28/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_25  -incr "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/conv1_system/ip/conv1_system_processing_system7_0_0/sim/conv1_system_processing_system7_0_0.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_control_s_axi.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_flow_control_loop_delay_pipe.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_hls_deadlock_idx0_monitor.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_4ns_15ns_16_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_4ns_15s_15_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_5ns_11ns_13_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_5ns_13ns_14_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_5ns_15s_15_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_5s_16s_16_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_6ns_5s_15_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_6ns_6s_15_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_6ns_9ns_14_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_6ns_13ns_14_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_6ns_13s_15_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_6ns_15ns_16_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_6s_16ns_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_6s_16s_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7ns_12ns_15_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7ns_13ns_15_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7ns_13s_16_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7ns_14ns_16_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7ns_15ns_16_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7ns_15s_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7ns_16s_16_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7ns_16s_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7s_16s_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_7s_17s_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_8s_14s_16_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_8s_14s_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_8s_15s_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_8s_16ns_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mac_muladd_8ns_8s_16s_17_4_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mul_8ns_8ns_15_1_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mul_8ns_8s_16_1_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mul_17s_32ns_49_2_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mul_18s_32ns_50_2_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_mul_19s_32ns_51_2_1.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_pool_top_RAM_2P_BRAM_1R1W.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_regslice_both.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_row_mid_RAM_2P_BRAM_1R1W.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls_row_old_RAM_2P_BRAM_1R1W.v" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog/conv1_hls.v" \
"../../../bd/conv1_system/ip/conv1_system_conv1_hls_0_0/sim/conv1_system_conv1_hls_0_0.v" \

vcom -work axi_datamover_v5_1_38 -93  -incr \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/0f0c/hdl/axi_datamover_v5_1_rfs.vhd" \

vcom -work axi_sg_v4_1_21 -93  -incr \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/b193/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_38 -93  -incr \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/5b02/hdl/axi_dma_v7_1_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/conv1_system/ip/conv1_system_axi_dma_0_0/sim/conv1_system_axi_dma_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/conv1_system/ip/conv1_system_axi_smc_0/bd_0/sim/bd_f305.v" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \

vcom -work proc_sys_reset_v5_0_17 -93  -incr \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/9438/hdl/proc_sys_reset_v5_0_rfs.vhd" \

vcom -work smartconnect_v1_0 -93  -incr \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/21d5/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/21d5/hdl/sc_ultralite_v1_0_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/conv1_system/ip/conv1_system_axi_smc_0/bd_0/ip/ip_0/sim/bd_f305_sc_ul_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/c7d2/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work axi_register_slice_v2_1_37  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/8c55/hdl/axi_register_slice_v2_1_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/conv1_system/ip/conv1_system_axi_smc_0/sim/conv1_system_axi_smc_0.sv" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/conv1_system/ip/conv1_system_rst_ps7_0_50M_0/sim/conv1_system_rst_ps7_0_50M_0.vhd" \

vlog -work generic_baseblocks_v2_1_2  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/0c28/hdl/generic_baseblocks_v2_1_rfs.v" \

vlog -work fifo_generator_v13_2_15  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/084a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_15 -93  -incr \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/084a/hdl/fifo_generator_v13_2_vh_sim_rfs.vhd" \

vlog -work fifo_generator_v13_2_15  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/084a/hdl/fifo_generator_v13_2_vl_sim_rfs.v" \

vlog -work axi_data_fifo_v2_1_37  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/a62a/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_38  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/b706/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/ec67/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/df05/hdl" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/e6f3/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ipshared/00fe/hdl/verilog" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+../../../../conv1_vivado.gen/sources_1/bd/conv1_system/ip/conv1_system_conv1_hls_0_0/drivers/conv1_hls_v1_0/src" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/conv1_system/ip/conv1_system_axi_mem_intercon_imp_auto_pc_0/sim/conv1_system_axi_mem_intercon_imp_auto_pc_0.v" \
"../../../bd/conv1_system/ip/conv1_system_axi_mem_intercon_1_imp_auto_pc_0/sim/conv1_system_axi_mem_intercon_1_imp_auto_pc_0.v" \
"../../../bd/conv1_system/sim/conv1_system.v" \

vlog -work xil_defaultlib \
"glbl.v"

