###############################################################################
# Created by write_sdc
# Fri Feb 23 07:38:37 2024
###############################################################################
current_design spm
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name core_clock -period 10.0000 [get_ports {clk}]
set_propagated_clock [get_clocks {core_clock}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
