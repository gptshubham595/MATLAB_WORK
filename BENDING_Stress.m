%BENDING EQUATIONS FOR BEAMS-

%M/I = ?/y = E/R
%Where, M= bending moment,

  %I=Moment of inertia of the area of cross section.

  %?=Bending stress

  %y=distance of extreme fibre from the neutral axis

  %E=Young�s modulus

  %R=radius of curvature.
  
 %-------------------------------------------------
 
 %Q1:A cantilever of length 2m fails when a load of 2kN is applied at the
 %free end. If the section of the beam is 40x60 mm find stress at the failure.
 
 %SOL:   
 
 p1 = [6 8];                         % First Point
 p2 = [6 6];                         % Second Point
 dp = p2-p1;                         % Difference
 
 p3 = [0 1.5];                         % First Point
 p4 = [6 1.5];                         % Second Point
 dp2 = p4-p3;                         % Difference
 
 p5 = [2.8 1.8];                         % First Point
 
 figure(1)
 quiver(p1(1),p1(2),dp(1),dp(2),0)
 hold on
 rectangle('Position',[0 2 6 4])
 axis([0 15 0 10])
 text(p1(1),p1(2), sprintf('   2kN',p1))
 text(p5(1),p5(2), sprintf('2m',p5))
 hold on 
 rectangle('Position',[8 2 2 4])
 text(p1(1)+4.1,p1(2)-4, sprintf('60mm',p1))
 text(p5(1)+5.4,p5(2), sprintf('40mm',p5))
 
 
 %M/I=sigm/y=E/R
 %M=sigma Z
 %Z=bd^2/6
 b=40;
 d=60;
 Z=(b*(d^2))/6.0
 W=2000;
 L=2000;
 M= W*L
 sigma=M/Z
 txt={['Z=' num2str(Z)],['M=' num2str(M)],['\sigma=' num2str(sigma)]};
 text(p1(1)+6,p1(2)+1,txt );
 
 
 %Q2:A square beam 20mm X 20mm in section and 2m
%long is simply supported at the ends. The beam
%fails when a point load of 400N is applied at the
%centre of the beam. What uniformly distributed
%load per meter length will break a cantilever of
%the same material 40mm wide, 60mm deep and
%3m long?
 
%SOL:
%square :20mm x 20mm
Ls=2000;
Ws=400;
b=20;
d=20;
Zs=b*(d^2)/6.0
Ms=Ws*Ls/4.0
sigmas=Ms*6.0/(b*(d^2))
%Rectangle : 40mmx60mm
Lr=3000;
b=40;
d=60;
Zr=b*(d^2)/6.0
Mr=sigmas*Zr
Wr=2*Mr/(Lr^2);
Wr=Wr*1000


%Q3:A timber beam of rectangular section of length 8m
%is simply supported. The beam carries a U.D.L. of
%12 kN/m run over the entire length and a point
%load of 10 kN at 3m from the left support. If the
%depth is two times the width and the stress in the
%timber is not to exceed 8 N/mm2
%, find the suitable
%dimensions of the section.

%SOL:
figure(2);
line([0 20],[20 20],'Marker','.','LineStyle','-','LineWidth',5)
axis([0 30 0 30])
text(3,17,'3m');

text(10,14,'8m');
hold on
quiver(0,18,8,0,0)
hold on
quiver(0,13,20,0,0) 
hold on
quiver(8,28,0,-7,0) 
text(8,27,'  10kN');
text(14,22,'  12kN');
hold on
quiver(0.2,10,0,10,0)
text(0.2,10,'  R_A');
hold on
quiver(20,10,0,10,0)
text(20,10,'  R_B');    
hold on
th = linspace( pi/2, -pi/2, 100);
R = 1;  %or whatever radius you want

y = R*cos(th) + 20;
for c = 1:2:20
    x = R*sin(th)+c;
    hold on
    plot(x,y); 
end
L=8;
w=12000;
W=10000;
sigma=8.0;
Rb=(w*sigma*4+W*3)/sigma
Ra=w-Rb
Fb=-Rb
Fa=Ra
Fc=18250;
x=4.3125;
M=Rb*x-w*x*x/2.0
%Z=b*d*d/2.0 d=2b z=2b^3/3
Z=M*1000/sigma
b=((3/2)*Z)^(1/3)
d=2*b

 txt={['Z=' num2str(Z)],['M=' num2str(M)],['\sigma=' num2str(sigma)]};
 text(22,25,txt );


%Q4:A simple beam AB is there , find Moment of Inertia , c=216.29mm then
%find sigma max at Top and bottom.
%SOL:
figure(3);
subplot(2,1,1);
hold on;
M=50000;
c=0.21629;
I=4.74*10^(-4);
y=0.15971;
sigma_bend_max=M*c/I
sigma_bend_top=M*y/I
[X1,map1]=imread('img.png');
[X2,map2]=imread('img2.png');
subplot(1,2,1), imshow(X1,map1)
subplot(1,2,2), imshow(X2,map2)

%Q5: A Beam is bent in the form of semi circle of radius 2.5m. Beam is with
%12mm radius , Young's Modulus is given by E=70Gpa. Find sigma and Moment 
figure(5);
R=12;
th = linspace( pi/2, -pi/2, 100);
y = R*cos(th) + 20;
x = R*sin(th)+20;
 axis([0 40 0 40])
plot(x,y,'Marker','.','LineStyle','-','LineWidth',5)
COM=4*R/(3000*pi);
rho=2.5;
E=70*10^9;
%M=IE/R;
d=24/1000;
I=pi*d^4/64.0
M=I*E/rho
sigma=COM*E/rho
text(18,26,{['M=' num2str(M)],['I=' num2str(I)],['COM=' num2str(COM)],['\sigma=' num2str(sigma)]})