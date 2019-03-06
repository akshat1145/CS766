img = imread('hough_2.png');
thresh = 0.3;
edge_img=edge(img,'canny', thresh);
%c= corner(edge_img);
s=1;
for i=1:size(edge_img,1)
    for j=1:size(edge_img,2)
        if edge_img(i,j) ~= 0
            x1(s)=i;
            y1(s)=j;
            s=s+1;
        end
    end
end

x= transpose(x1);
y=transpose(y1);
mas(:,1)=x;
mas(:,2)=y;

n=size(x);
n=n(1);

rho=0;
ths=21 %theta bins
%create rho , theta matrix
for i=1:n
    for j=1:(ths+1)
    
    rho(i,j)= y(i)*cosd((180/ths)*(j-1)) - x(i)*sind((180/ths)*(j-1)) ;
    
    end
end



%disp("_____x values______")
%disp(x)
%disp("_____y values______")
%disp(y)
%disp("______rho_____")
%disp(rho)


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

%transfer back to xy space

for i=1:size(acc,1)
    for j=1:size(acc,2)
        if acc(i,j)>220 %allter acc threshold
            trans(a,1) = i; %store i
            trans(a,2) = j; %store theta
            a=a+1;
        end
    end
end
z=0;
%get respective x and y values
transs= sortrows(trans,2);
for i=1:size(trans,1)
    xD(i,1)=x(transs(i,1));
    yD(i,2)=y(transs(i,2));
end
disp(trans)
tr=size(trans,1)
disp(size(xD))
disp(size(yD))
disp(size(x))
disp(size(y))
x2=0;
y2=0;
m=0;
r=1;
hold on; plot(mas(:, 1), mas(:, 2), 'ws', 'MarkerFaceColor', [0 0 1]);
set(gca, 'YDir','reverse')
tr2=tr-10;
for i=6:tr2
    for j=i-5:i+5
  % j=i+1;
     x2=xD(j);
     y2=yD(j);
   % y2= x2*tand((180/4)*(trans(i,2)-1))+yD(i);
      %m=tand((180/ths)*(trans(i,2)-1));
      if ((yD(i)-y2)+( xD(i)-x2)<010) && (yD(i) ~=y(i))&& (x(i) ~=x(i)) 
          if (yD(i) ~=0) &&(xD(i) ~=0) && (x(i) ~=0) && (y(i) ~=0) 
      if sqrt(((yD(i)-y2)*(yD(i)-y2)+( xD(i)-x2)*( xD(i)-x2)))<10
          
                 Data(r,1)=xD(i)
                 Data(r,2)=x2
                 Data(r+1,1)= yD(i)
                 Data(r+1,2)= y2
                 r=r+2;
      end
          end
      end
      
    %line(xData,yData,'LineWidth',2, 'Color', [0, 1, 0]);
           
        x2=0;
        y2=0;    
    end
 %   line(Data(1:size(Data,1), 1), Data(1:size(Data,1), 2),...
  %      'LineWidth',1, 'Color', [1, 0, 0]);
end
for i=1:2:size(Data,1)
     tData(1,1)=Data(i,1);   
     tData(1,2)=Data(i,2);
   tData(2,1)=Data(i+1,1);
    tData(2,2)=Data(i+1,2);
   line(Data(1:size(Data,1), 1), Data(1:size(Data,1), 2),...
        'LineWidth',1, 'Color', [1, 0, 0]);
end
fh2 = figure; imshow(edge_img);
%  disp("**-**-xData--**-**")
% disp(xDta)
% disp("**-**-yData--**-**")
% disp(yDta)
%       
      
      
      