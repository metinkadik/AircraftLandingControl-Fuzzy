%Sugeno

global X mu_X mu_xi ;
altsinir_x=-10; ustsinir_x=1000; altsinir_y=-30; ustsinir_y=30; altsinir_z=-30; ustsinir_z=30;

xi=500; yi=0; zi=0;

c1=30; c2=30; c3=0; c4=-15; c5=-15; c6=30; c7=15; c8=0; c9=-15; c10=-30; c11=15; c12=0; c13=-15; c14=-30; c15=-30; 
 c16=0; c17=-15; c18=-30; c19=-30; c20=-30;


%Ýrtifa üyelik fonksiyonlarý
ucgen(altsinir_x,0,0,500,ustsinir_x,xi);       x_S=X; mu_S=mu_X; mu_xi_S=mu_xi;
ucgen(altsinir_x,0,300,800,ustsinir_x,xi);     x_A=X; mu_A=mu_X; mu_xi_A=mu_xi;
ucgen(altsinir_x,300,800,1000,ustsinir_x,xi);     x_O=X; mu_O=mu_X; mu_xi_O=mu_xi;
ucgen(altsinir_x,500,1000,1000,ustsinir_x,xi);    x_C=X; mu_C=mu_X; mu_xi_C=mu_xi;

%Hýz üyelik fonksiyonlarý
yamuk(altsinir_y,-30,-30,-20,-10,ustsinir_y,yi);  y_NC=X; mu_NCy=mu_X; mu_yi_NC=mu_xi;
ucgen(altsinir_y,-20,-10,0,ustsinir_y,yi);        y_NA=X; mu_NAy=mu_X; mu_yi_NA=mu_xi;
ucgen(altsinir_y,-10,0,10,ustsinir_y,yi);         y_SF=X; mu_SFy=mu_X; mu_yi_SF=mu_xi;
ucgen(altsinir_y,0,10,20,ustsinir_y,yi);          y_PA=X; mu_PAy=mu_X; mu_yi_PA=mu_xi;
yamuk(altsinir_y,10,20,30,30,ustsinir_y,yi);      y_PC=X; mu_PCy=mu_X; mu_yi_PC=mu_xi;


z1=c1;
z2=c2;
z3=c3;
z4=c4;
z5=c5;
z6=c6;
z7=c7;
z8=c8;
z9=c9;
z10=c10;
z11=c11;
z12=c12;
z13=c13;
z14=c14;
z15=c15;
z16=c16;
z17=c17;
z18=c18;
z19=c19;
z20=c20;


%Kurallar
w1=min(mu_xi_S,mu_yi_NC);
w2=min(mu_xi_S,mu_yi_NA);
w3=min(mu_xi_S,mu_yi_SF);
w4=min(mu_xi_S,mu_yi_PA);
w5=min(mu_xi_S,mu_yi_PC);
w6=min(mu_xi_A,mu_yi_NC);
w7=min(mu_xi_A,mu_yi_NA);
w8=min(mu_xi_A,mu_yi_SF);
w9=min(mu_xi_A,mu_yi_PA);
w10=min(mu_xi_A,mu_yi_PC);
w11=min(mu_xi_O,mu_yi_NC);
w12=min(mu_xi_O,mu_yi_NA);
w13=min(mu_xi_O,mu_yi_SF);
w14=min(mu_xi_O,mu_yi_PA);
w15=min(mu_xi_O,mu_yi_PC);
w16=min(mu_xi_C,mu_yi_NC);
w17=min(mu_xi_C,mu_yi_NA);
w18=min(mu_xi_C,mu_yi_SF);
w19=min(mu_xi_C,mu_yi_PA);
w20=min(mu_xi_C,mu_yi_PC);


%Sonuçlarýn aðýrlýklý toplamý

SAT=w1*z1+w2*z2+w3*z3+w4*z4+w5*z5+w6*z6+w7*z7+w8*z8+w9*z9+w10*z10+w11*z11+w12*z12+w13*z13+w14*z14+w15*z15+w16*z16+w17*z17+w18*z18+w19*z19+w20*z20;
%plot(X,SAT);
%Durulaþtýrma
toplam_agirlik=w1+w2+w3+w4+w5+w6+w7+w8+w9+w10+w11+w12+w13+w14+w15+w16+w17+w18+w19+w20;
if toplam_agirlik == 0
    'Aðýrlýk Merkezi Yönteminde Toplam Alan Sýfýr!';
end
z=SAT/toplam_agirlik;

h=[z,z,z,z,z,z,z,z,z,z,z];
line(h,0:0.1:1,'Color','red','LineStyle','--');
xlabel(['z = ',num2str(z)]);
display(z)


