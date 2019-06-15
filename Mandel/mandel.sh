#!/bin/bash
#bash implemetation of the mandelbrot set
i=0	
j=0

#i real, j is imaginary
#z^2 +c where z=0 and c varies
while [ $i -lt 20  ] do 
	while [ $j -lt 20 ] do
		zre=0
		zim=0
		
		#map cre from i
		#map cim from j
		it=0
		while [ $it < 100 ] && [ $((zre*zre + zim*zim)) -lt 2 ] do
			$zretmp=$((zre*zre - zim*zim+ $cre))
			$zim=$((2*zre*zim + $cim))
			$zre=$zretmp


		
		done
		if [ $j == $i ]
			then
				printf " "
			else 	
				printf "* "
		fi
		((j++))
	done
	((i++))
	j=0
	printf "\n"
done