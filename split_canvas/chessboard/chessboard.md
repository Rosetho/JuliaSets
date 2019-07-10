Filling up the screen with enough Julia sets results in the corresponding mandelbrot set. 

For each partition, perform a Julia calculation
nested while loop to dictate which partitiion
	nested for loop maps pixels by rows using Julia function.

Julia function:
	pull  : <i>a scaler based on the partition size and size of the plane. Needed to keep the field around the mouse relevant. </i>
	z : <i>the pixel value remapped to a complex plane based on the partition.</i>
	c : <i>mouse pixel value remapped based on the size of a single partition.</i>


	returns iteration: 

	 
