%Persamaan 1 : y = 3x^3-5x^2+4x-7, dengan y = 1
%y1 = 3x^3-5x^2+4x-7 ; y2 = 1
figure(4);
%Plot Kurva
x = linspace(0,2.5);
f1 = @(x) 3*x.^3-5*x.^2+4*x-7;
f2 = @(x) 1+0*x;
y1 = f1(x);
y2 = f2(x);
plot(x,y1,x,y2)

%Menggambar sumbu x dan y
line([-0.5,3],[0,0])  %Sumbu X
line([0,0],[-8,20])  %Sumbu Y

%Annotation
gtext('y_1 = 3x^3-5x^2+4x-7')
gtext('y_2 = 1')
gtext('Akar')


%Persamaan 2 : y = e^x-x^2, dengan y = 0
%y1 = e^x ; y2 = x^2
figure(5);
%Plot Kurva
x = linspace(-1.5,1.5);
f1 = @(x) exp(x);
f2 = @(x) x.^2;
y1 = f1(x);
y2 = f2(x);
plot(x,y1,x,y2)

%Menggambar sumbu x dan y
line([-2,2],[0,0])  %Sumbu X
line([0,0],[-1,5])  %Sumbu Y

%Annotation
gtext('y_1 = e^x')
gtext('y_2 = x^2')
gtext('Akar')


%Persamaan 3 : y = log(x+2)+2x-3, dengan y = 0
%y1 = log(x+2) ; y2 = 3-2x
figure(6);
%Plot Kurva
x = linspace(-1,2);
f1 = @(x) log(x+2);
f2 = @(x) 3-2*x;
y1 = f1(x);
y2 = f2(x);
plot(x,y1,x,y2)

%Menggambar sumbu x dan y
line([-1.5,2.5],[0,0])  %Sumbu X
line([0,0],[-2,5.5])  %Sumbu Y

%Annotation
gtext('y_1 = log(x+2)')
gtext('y_2 = 3-2x')
gtext('Akar')
