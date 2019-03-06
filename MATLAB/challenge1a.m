img = imread('hough_1.png');
figure;
imshow(img)
figure;
thresh = 0.03;
edge_img=edge(img,'sobel', thresh);
imshow(edge_img);
figure;
thresh = 0.1;
edge_img=(edge(img,'canny', thresh));
imshow(edge_img);


 