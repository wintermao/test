# TCL File Generated by Component Editor 13.0
# Sat Apr 28 18:37:14 CST 2018
# DO NOT MODIFY


# 
# wave_gen "wave_gen" v1.0
# mmh 2018.04.28.18:37:14
# wave generate
# 

# 
# request TCL package from ACDS 13.0
# 
package require -exact qsys 13.0


# 
# module wave_gen
# 
set_module_property DESCRIPTION "wave generate"
set_module_property NAME wave_gen
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP System
set_module_property AUTHOR mmh
set_module_property DISPLAY_NAME wave_gen
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL wave_gen
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file Cordic_Test.v VERILOG PATH hdl/Cordic_Test.v
add_fileset_file wave_gen.v VERILOG PATH hdl/wave_gen.v TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter AmpMax STD_LOGIC_VECTOR 16383
set_parameter_property AmpMax DEFAULT_VALUE 16383
set_parameter_property AmpMax DISPLAY_NAME {Amplitude Max}
set_parameter_property AmpMax TYPE STD_LOGIC_VECTOR
set_parameter_property AmpMax UNITS None
set_parameter_property AmpMax ALLOWED_RANGES {0:16383}
set_parameter_property AmpMax HDL_PARAMETER true
add_parameter AmpMin STD_LOGIC_VECTOR 0
set_parameter_property AmpMin DEFAULT_VALUE 0
set_parameter_property AmpMin DISPLAY_NAME {Amplitude Min}
set_parameter_property AmpMin TYPE STD_LOGIC_VECTOR
set_parameter_property AmpMin UNITS None
set_parameter_property AmpMin ALLOWED_RANGES {0:16383}
set_parameter_property AmpMin HDL_PARAMETER true
add_parameter FreqDiv STD_LOGIC_VECTOR 20
set_parameter_property FreqDiv DEFAULT_VALUE 20
set_parameter_property FreqDiv DISPLAY_NAME {Frequency division}
set_parameter_property FreqDiv TYPE STD_LOGIC_VECTOR
set_parameter_property FreqDiv UNITS None
set_parameter_property FreqDiv ALLOWED_RANGES {2:17179869183}
set_parameter_property FreqDiv HDL_PARAMETER true
add_parameter SamplePonint STD_LOGIC_VECTOR 256
set_parameter_property SamplePonint DEFAULT_VALUE 256
set_parameter_property SamplePonint DISPLAY_NAME {Sampling point number}
set_parameter_property SamplePonint TYPE STD_LOGIC_VECTOR
set_parameter_property SamplePonint UNITS None
set_parameter_property SamplePonint ALLOWED_RANGES {32 64 128 256 512 1024 2048 4096}
set_parameter_property SamplePonint HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n reset_n Input 1


# 
# connection point s0
# 
add_interface s0 avalon end
set_interface_property s0 addressUnits WORDS
set_interface_property s0 associatedClock clock
set_interface_property s0 associatedReset reset
set_interface_property s0 bitsPerSymbol 8
set_interface_property s0 burstOnBurstBoundariesOnly false
set_interface_property s0 burstcountUnits WORDS
set_interface_property s0 explicitAddressSpan 0
set_interface_property s0 holdTime 0
set_interface_property s0 linewrapBursts false
set_interface_property s0 maximumPendingReadTransactions 0
set_interface_property s0 readLatency 0
set_interface_property s0 readWaitTime 1
set_interface_property s0 setupTime 0
set_interface_property s0 timingUnits Cycles
set_interface_property s0 writeWaitTime 0
set_interface_property s0 ENABLED true
set_interface_property s0 EXPORT_OF ""
set_interface_property s0 PORT_NAME_MAP ""
set_interface_property s0 SVD_ADDRESS_GROUP ""

add_interface_port s0 avs_s0_chipselect chipselect Input 1
add_interface_port s0 avs_s0_write write Input 1
add_interface_port s0 avs_s0_read read Input 1
add_interface_port s0 avs_s0_writedata writedata Input 32
add_interface_port s0 avs_s0_readdata readdata Output 32
add_interface_port s0 avs_s0_address address Input 3
set_interface_assignment s0 embeddedsw.configuration.isFlash 0
set_interface_assignment s0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment s0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment s0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clk_source
# 
add_interface clk_source clock end
set_interface_property clk_source clockRate 0
set_interface_property clk_source ENABLED true
set_interface_property clk_source EXPORT_OF ""
set_interface_property clk_source PORT_NAME_MAP ""
set_interface_property clk_source SVD_ADDRESS_GROUP ""

add_interface_port clk_source clk_source clk Input 1


# 
# connection point dac
# 
add_interface dac conduit end
set_interface_property dac associatedClock clk_source
set_interface_property dac associatedReset reset
set_interface_property dac ENABLED true
set_interface_property dac EXPORT_OF ""
set_interface_property dac PORT_NAME_MAP ""
set_interface_property dac SVD_ADDRESS_GROUP ""

add_interface_port dac dac export Output 14

