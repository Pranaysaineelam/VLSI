puts "GIVE THE BOUNDARY WHERE TO PLACE THE PORTS "

gets stdin boundary

puts "GIVE THE LAYER "

gets stdin layers

puts "GIVE THE PIN_SPACING "

gets stdin pinspacing

puts "GIVE THE PORTS "

gets stdin ports

create_pin_guide -boundary $boundary  -layers $layers -pin_spacing $pinspacing [get_ports $ports*]

place_pins -ports [get_ports $ports*]

change_selection [get_ports $ports*]

return