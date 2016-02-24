# BikeDisplay
Creating a bike wheel display using a rotating LED strip.

##Components

####Hardware
- Arduino Nano
- ws2812b LED Strip (RGB, Individually Addressable)
- Reed Switch + Magnet
- 5V Battery (60mA/LED + 200ma should be plenty; 2.1A seems OK while using 17 LEDs)

####Software

#####[BikeDisplay.ino](https://github.com/mkogerd/BikeDisplay/blob/master/BikeDisplay.ino) 
This is the main arduino program (I've been using an arduino nano).

#####[GenerateArrayLED.m](https://github.com/mkogerd/BikeDisplay/blob/master/GenerateArrayLED.m)
This is the matlab image processing algorithm that creates an array of an image that an LED strip can read.

#####[Print3DArray.m](https://github.com/mkogerd/BikeDisplay/blob/master/Print3DArray.m)
This is the matlab function for converting a 3D-array into a format that can be used in the programming language C. This is meant to be used in conjuction with *GenerateArrayLED.m*'s output.

#####[Display Images](https://github.com/mkogerd/BikeDisplay/blob/master/Display Images)
This folder contains a collection of images (raw, proccessed, and in .txt format) created for reference and quick access.