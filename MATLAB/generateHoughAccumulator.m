function hough_img = generateHoughAccumulator(img, theta_num_bins, rho_num_bins)
figure;
imshow(corner(img));
thresh = 0.03;
edge_img=edge(img,'canny', thresh);
c= corner(edge_img);
sz = size(c);
x=0;
y=0;
  y=c(:,2);
  x=c(:,1);
x= transpose(x);
y=transpose(y);
n=size(c);
n=n(1);

   rho=0;
for i=1:n
    for j=1:5
    
    rho(i,j)= y(i)*cosd((180/4)*(j-1)) - x(i)*sind((180/4)*(j-1)) ;
    
    end
end



 

