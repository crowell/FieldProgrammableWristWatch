
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name spart3count -dir "X:/Desktop/EC311_Labs/spart3count/planAhead_run_1" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top spart3count $srcset
set_param project.paUcfFile  "spart3count.ucf"
set hdlfile [add_files [list {OneTenMux.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {fast_clock.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {clk_divider.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {BCD_MUX1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {BCD_LED1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {spart3count.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "spart3count.ucf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
