sh awk '{print \$2,\$3,\$4,\$5}' celldensitybbox.txt > roughcelldensitycoordinates.txt

sh sed 's/{/{{/' roughcelldensitycoordinates.txt | sed 's/}/} /' | sed 's/{/{/' | sed 's/}/}}/'  > celldensitycoordinates.txt

set a [open celldensitycoordinates.txt]

set a1 [read $a]

set b 5

foreach x $a1 {

create_placement_blockage -type partial -blocked_percentage 60 -boundary $x

incr b

}

close $a

create_placement -incremental

legalize_placement