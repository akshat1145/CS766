img = imread('hough_2.png');
thresh = 0.3;
edge_img=edge(img,'canny', thresh);
c= corner(edge_img);
sz = size(c)
x=0;
y=0;
  y=c(:,2);
  x=c(:,1);

x= transpose(x);
y=transpose(y);

n=size(c);
n=n(1);
rho=0;
ths=21 %theta bins
%create rho , theta matrix
for i=1:n
    for j=1:(ths+1)
    
    rho(i,j)= y(i)*cosd((180/ths)*(j-1)) - x(i)*sind((180/ths)*(j-1)) ;
    
    end
end


disp("*-*-*-*")
min(rho);
max(rho);
%scale rho to 0,255
ac = rho - min(rho);
r =max( max(ac));

for i=1:size(ac,1)
    for j=1:size(ac,2)
        acc(i,j)= (255*ac(i,j))/(r);
    end
end
%scalled rho
disp(acc)
disp("**-**-tans--**-**")
a=1;
%transfer back to x,y

for i=1:size(acc,1)
    for j=1:size(acc,2)
        if acc(i,j)>200 %allter acc threshold
            trans(a,1) = i; %store i
            trans(a,2) = j; %store theta
            a=a+1;
        end
    end
end
z=0;
%get respective x and y values

for i=1:size(trans,1)
    xD(i)=x(trans(i));
    yD(i)=y(trans(i));
end
disp(trans)
tr=size(trans,1);
x2=0;
y2=0;
m=0;
r=1;
hold on; plot(c(:, 1), c(:, 2), 'ws', 'MarkerFaceColor', [0 0 1]);
set(gca, 'YDir','reverse')
for i=1:tr
    for j=1:sz
     x2=x(j);
     y2=y(j);
   % y2= x2*tand((180/4)*(trans(i,2)-1))+yD(i);
      m=tand((180/ths)*(trans(i,2)-1));
       if  (m<0.5) && (m>30) 
           
            if ((xD(i)-x2)*m == yD(i)-y2) %&& ((yD(i)-y2)+( xD(i)-x2)~=0)
   
       
                 Data(r,1)=xD(i);
                 Data(r+1,1)=x2;
                 Data(r,2)= yD(i);
                 Data(r+1,2)= y2;
                 r=r+2;
        end
   
        
    %line(xData,yData,'LineWidth',2, 'Color', [0, 1, 0]);
             end
        x2=0;
        y2=0;    
    end

end
for i=1:2:size(Data,1)
    tData(1,1)=Data(i,1);
    tData(1,2)=Data(i,2);
    tData(2,1)=Data(i+1,1);
    tData(2,2)=Data(i+1,2);
    line(tData(1:2, 1), tData(1:2, 2),...
        'LineWidth',1, 'Color', [1, 0, 0]);
end
fh2 = figure; imshow(edge_img);
 disp("**-**-xData--**-**")
disp(xDta)
disp("**-**-yData--**-**")
disp(yDta)
