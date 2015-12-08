Draw Bmp Text - Draw Language

0. Format
>> [Header] [Method] [Method] [Method]...

1. Header: Must write at begin. 
>> canvas [width] [height] color [R] [G] [B]
	Set the bitmap size and fill color. 

2. Method: Call after header.
	a. Set pen color
	>> pen [R] [G] [B]
		Set the pen color with RGB(0-255).
		Default is "255 255 255".
	b. Draw Shape
	>> draw [shape] at [point]
		Draw the shape to the point(top-left).
	c. Declare
	>> [NAME] as [shape]
	>> [NAME] as [point]
		Declare a shape or point.

3. Item: Only call by method, can not use directly.
	a. shape
	>> circle [radius]
		Create a circle with radius.
	>> rectangle [width] [height]
		Create a rectangle with size.
	>> [NAME]
		Get a shape with the name that has been declared.
	>> [shape] add [shape] shift [point]
		Create a shape that the second shape nail on the first shape at point.
	b. point
	>> [x] [y]
		Create a point.
	>> [NAME]
		Get a point with the name that has been declared.