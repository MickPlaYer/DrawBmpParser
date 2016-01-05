# Draw Bmp Text - Draw Language #

## Format ##
```
[Header] [Method] [Method] [Method]...
```

## Header: Must write at begin. ##
```
canvas [width] [height] color [R] [G] [B]
```
Set the bitmap size and fill color.

## Method: Call after header. ##
### Set pen color ###
```
pen [R] [G] [B]
```
Set the pen color with RGB(0-255).<br>
Default is ```255 255 255```.

### Draw Shape ###
```
draw [shape] at [point]
```
Draw the shape to the point(top-left).

### Declare ###
```
[NAME] as [shape]
```
```
[NAME] as [point]
```
Declare a shape or point.

## Item: Only call by method, can not use directly. ##
### shape ###
```
circle [radius]
```
Create a circle with radius.
```
rectangle [width] [height]
```
Create a rectangle with size.
```
[NAME]
```
Get a shape with the name that has been declared.
```
[shape] add [shape] shift [point]
```
Create a shape that the second shape nail on the first shape at point.

### point ###
```
[x] [y]
```
Create a point.
```
[NAME]
```
Get a point with the name that has been declared.
