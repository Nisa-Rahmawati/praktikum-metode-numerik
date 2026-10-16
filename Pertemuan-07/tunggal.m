%Persamaan 1 : y = 3x^3-5x^2+4x-7, dengan y = 1  ->  f(x) = 3x^3-5x^2+4x-8
figure(1);
%Plot Kurva
x = linspace(0,2.5);
f = @(x) 3*x.^3-5*x.^2+4*x-7-1;
y = f(x);
plot(x,y)

%Menggambar sumbu x dan y
line([-0.5,3],[0,0])  %Sumbu X
line([0,0],[-10,20])  %Sumbu Y

%Annotation
gtext('y = 3x^3-5x^2+4x-8')
gtext('Akar')


%Persamaan 2 : y = e^x-x^2, dengan y = 0
figure(2);
%Plot Kurva
x = linspace(-1.5,1.5);
f = @(x) exp(x)-x.^2;
y = f(x);
plot(x,y)

%Menggambar sumbu x dan y
line([-2,2],[0,0])  %Sumbu X
line([0,0],[-3,3])  %Sumbu Y

%Annotation
gtext('y = e^x-x^2')
gtext('Akar')


%Persamaan 3 : y = log(x+2)+2x-3, dengan y = 0
figure(3);
%Plot Kurva
x = linspace(-1,2);
f = @(x) log(x+2)+2*x-3;
y = f(x);
plot(x,y)

%Menggambar sumbu x dan y
line([-1.5,2.5],[0,0])  %Sumbu X
line([0,0],[-6,3])  %Sumbu Y

%Annotation
gtext('y = log(x+2)+2x-3')
gtext('Akar')
