set num_signals [ gtkwave::getNumFacs ]
set signals [ list ]
puts "Number of signals: $num_signals"

for { set i 0 } { $i < $num_signals } { incr i } {
    set signal_name [ gtkwave::getFacName $i ]
    if { ![ string match "*.*" $signal_name ] } {
        puts "    $i: $signal_name"
        lappend signals $signal_name
    }
}

set ret_value [ gtkwave::addSignalsFromList $signals ]
