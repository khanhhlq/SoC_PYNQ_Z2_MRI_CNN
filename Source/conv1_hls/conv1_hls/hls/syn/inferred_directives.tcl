# Inferred from performance & pipeline pragmas/directives
set_directive_array_partition conv1_hls/pool_top -dim=1 -type=cyclic -factor=2 pool_top
set_directive_loop_flatten conv1_hls/COL_LOOP
