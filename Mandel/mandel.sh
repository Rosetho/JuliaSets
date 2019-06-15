#!/bin/bash
#bash implemetation of the mandelbrot set
i=0	
j=0

#i real, j is imaginary
#z^2 +c where z=0 and c varies
#foreach pixel: map to c, iter loop, 
while [ $i -lt 30  ] 
	do 
		while [ $j -lt 30 ] 
			do
				zre=0
				zim=0
				#[0,10]->[-2,2] mapping
				cre=$((i*4/19-2))
				cim=$((j*4/19-2))

				it=0
				
				while [ $it -lt 100 ] && [ $((zre*zre + zim*zim)) -le 4 ] 
					do
						zretmp=$((zre*zre - zim*zim+  $cre))
						zim=$((2*zre*zim + $cim))
						zre=$zretmp
						((it++))
					done
				
				if [ $it -eq 100 ]
					then
						printf "* "
					else 	
						printf "$it "
				fi
		
				((j++))
			done
		((i++))
		j=0
		printf "\n"
	done