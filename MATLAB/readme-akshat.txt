ReadMe file for Akshat, HW-3. CS 766- Computer Vision




Question 3. b 



I have used a threshold for the accumulator as 200. This was primarily chosen on a hit and trial basis but has a logical explanation tooo. I am using corners(corner()) of the edge_img(edge()) which essentially translates to using the corners of the image which is pre processed to show edges only. Because these are corners, thet have some lines intersecting or originating through these points already.. So inroder to detect strong corners and remove the aliasing, the accumulator threshold is high. Also, I ahve taken the number of bins to be 20 in the paprticular submission but can be altered easily. An idea bin size would be around ~35. But this comes at its own computational cost. The code doesnot crash, but takes a long time to execute.



Question 3. c  



The accunulator threshold above is then passed and below and is further refined to detct anomolies such as vertical lines which would give a slope of infinity(tan(90)). Each point has its own slope and intercept. The points are then checked against an array of the other points to judge if they are a part of the line or not by the formula, (y2-y1) = m*(x2-x1). The points then go further with the criteria to check the value of m and prevent diagonal lines with m~1 from entering. This is an overfitting done to comply with the images in the assignment. 

The lines are drawn with Green color(0,1,0) with a width of 2. 



Question 3. d

  

The lines are already detected and segmented above to fall under the end points even though points on the same line might detect to be in the boxe dregion even if there is a gap. The is happening due to the Inage pre porcessign dialation and noise in the image in the form of labelings from wehre the image is downloaded.



Also, an additional file Trail2.m is uploaded inside the assignment zip which contains all the different functions at the same place with a few algorithms and conditions which are commented but could be used at specific instances.



Thanks.



(The code was built on Windows 10 in matab 2018b)  
