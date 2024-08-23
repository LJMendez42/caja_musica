

#Musical Box

This project was designed for use by blind people, so the musical notes are written in Braille on the keyboard. The motivation is to provide a tool for blind people to play their melodies and listen to them. This program has as input an array of keys, where each time a key is pressed, its bit changes to one, the simulation also receives the time that this key was pressed since this is a physical input variable. In the physical implementation, the musical notes were written in braille.




# Sobel filter and greatest common divisor

This project encompasses two distinct functionalities.The first functionality is an edge detection filter that utilizes the Sobel algorithm, while the second functionality calculates the greatest common divisor of two positive 8-bit numbers."     

## Sobel filter

The project is an implementation of an edge detection filter using the Sobel algorithm.

To process an image, a 3x3 kernel is convoluted with a matrix of neighboring pixels with the same dimensions. After obtaining the convolution value, its magnitude  is determined, and then a binarization process is applied.


### How to use Sobel filter?

Besides the clock and reset signals, the input signals include 'prep_allowed_i'  and 'input_px_gray_i.' To initiate processing, the 'prep_allowed_i' signal must  first be set high. Subsequently, the 9 neighboring pixels surrounding the pixel of interest are sent one by one into the 'input_px_gray_i' input. A two-clock-cycle  delay is observed between sending each set of 9 pixels to allow for the convolution process and the subsequent capture of the resulting pixel in the 'output_px_sobel_o' signal. This process is repeated for the entire resolution of the image.

## Greatest common divisor GCD

The project calculates de greatest common divisor of two positive 8-bit numbers, as its name say, it is the largest positive number that divides both numbers. 

The GCD is calculated using subtractions and the following Lemma: 
#### Lemma 1
If a and b are any positive integers, not both zero and a is greater than b, then GCD(a, b) = GCD(a - b, b). 

The circuit performs subtractions until the two numbers are equal, and that  equal number becomes the result. This method relies on the fact that GCD(a, a) equals a.


### How to use Greatest common divisor GCD?

Please input two numbers for which you wish to calculate the greatest common divisor,  storing them in the 'operand_a' and 'operand_b' variables. The program initiates  once you set the 'enable' signal to high following a reset. The calculation concludes when the 'gcd_done' variable is set to high.
