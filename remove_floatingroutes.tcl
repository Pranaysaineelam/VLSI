check_lvs -max_errors 0 -open_reporting  detailed > lvs.txt

sh awk '/floating/' lvs.txt > floating.txt

sh awk '{print \$10,\$11,\$12}' floating.txt > roughfloatingcoordinates.txt

sh sed 's/(/{{/' roughfloatingcoordinates.txt | sed 's/)/} /' | sed 's/(/{/' | sed 's/)./}}/'  > floatingcoordinates.txt

set f [open "floatingcoordinates.txt"]

while {[gets $f floatingcoordinates] >= 0} { 

remove_physical_objects [get_objects_by_location -within $floatingcoordinates]

}

close $f