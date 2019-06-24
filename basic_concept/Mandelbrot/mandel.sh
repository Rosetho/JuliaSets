#!/bin/bash

i=0
j=0



#[A, B] --> [a, b]
#[0, 9] --> [-2, 2]
#(val - A)*(b-a)/(B-A) + a
while [ $i -lt 10 ] 
	do 
		while [ $j -lt 10 ] 
			do
				it=0
				cre=`echo "scale=2;$i*4/9-2" | bc -l`
				cim=`echo "scale=2;$j*4/9-2" | bc -l`
				zre=0
				zim=0

				mag=`echo "scale=2;$zre*$zre+$zim*$zim" | bc -l`
				check=`echo "$((check))<=4" | bc`
				while [ "$it" -lt 50 ]
				# && [ $check -eq 0 ]
					do
						tmp=`echo "scale=2;$zre*$zre-$zim*$zim+$cre" | bc -l`
						#zim=`echo "scale=2;2*$zre*$zim+$cim" | bc -l`
						#zre=`echo "scale=2;$tmp" | bc -l`
						#check=`echo "sclae=2;$zre*$zre+$zim*$zim" | bc -l`
						((it++))
					done

				echo "$tmp" | bc

			
				#printf "($cre,$cim)"
				((j++))
			done
		((i++))
		j=0
		printf "\n"

	done
