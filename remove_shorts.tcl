check_lvs -max_errors 0 -open_reporting  detailed > lvs.txt

sh awk '/short/' lvs.txt > short.txt

sh awk '{print \$10,\$11,\$12}' short.txt > roughshortcoordinates.txt

sh sed 's/(/{{/' roughshortcoordinates.txt | sed 's/)/} /' | sed 's/(/{/' | sed 's/)./}}/'  > shortcoordinates.txt

set f [open "shortcoordinates.txt"]

while {[gets $f shortcoordinates] >= 0} { 
    remove_physical_objects [get_objects_by_location -intersect $shortcoordinates -classes via -classes net]
}

close $f
