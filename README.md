# Image Digitizer

##### A MATLAB GUI tool for extracting data points from 2D X-Y graphs.

### System requirements

To run from MATLAB: any operating system with MATLAB (version R2014a or newer) installed can run this app. It also works on the remote end of a Linux server that has MATLAB installed (you need to have X11 enabled when you access the server).

To run without MATLAB: Windows or Mac.

### Features and limitations

The features of this GUI app are a subset of another free app called [Engauge Digitizer](http://markummitchell.github.io/engauge-digitizer/). But this GUI app is faster to oparate (fewer mouse clicks) if you only want to do the simplest thing: extract points from a 2D X-Y graph.

### Very brief tutorial in 8 steps

1. Download the whole repository, unzip it as a folder.

2. From the folder, run `ImgDigitizer.m` from MATLAB. Or `ImgDigitizer4k.m` if you are using a 4k monitor or higher. (Alternatively, you can add the folder into as an eligible MATLAB search path [[what's a search path](https://www.mathworks.com/help/matlab/search-path.html)], and then type `ImgDigitizer` or `ImgDigitizer4k` directly from MATLAB's command window.)

*(Click [here](https://github.com/jsh9/Image-Digitizer/releases) to download the binary executable if you do not have MATLAB, or you prefer to run a compiled executable file.)*

3. This window pops out:  
![](https://github.com/jsh9/Image-Digitizer-in-MATLAB/blob/master/screenshots/screenshot1_startup.png?raw=true)

4. Load an image from the hard drive. There are three sample images in this repository. Take `Image3.png` for example:  
![](https://github.com/jsh9/Image-Digitizer-in-MATLAB/blob/master/screenshots/screenshot2_load_image.png?raw=true)

5. Select the scales (linear or logarithmic) for X and Y axes, and then fill in the upper/lower limits of axes; and then use your mouse to pick the lower-left and the upper-right corner of the axes frame.  
![](https://github.com/jsh9/Image-Digitizer-in-MATLAB/blob/master/screenshots/screenshot3_pick_reference.png?raw=true)

6. Click "Start" to stark picking desired points on the graph. MATLAB prints a cyan/magenta mark on each point you pick.  
![](https://github.com/jsh9/Image-Digitizer-in-MATLAB/blob/master/screenshots/screenshot4_pick_points.png?raw=true)

7. Hit "Enter" when you have finished picking the points. Then a new MATLAB figure window pops out, which displays the points you picked.  
![](https://github.com/jsh9/Image-Digitizer-in-MATLAB/blob/master/screenshots/screenshot5_results.png?raw=true)

8. Click the "Export data" button, then a CSV file will be saved to the MATLAB home directory. The content of the CSV file looks like this:  
![](https://github.com/jsh9/Image-Digitizer-in-MATLAB/blob/master/screenshots/screenshot6_csv_contents.png?raw=true)

### License
Copyright (c) 2014-2019, Jian Shi. See LICENSE.txt file for details.
