%Mamdani

global X mu_X mu_xi ;
altsinir_x=-10; ustsinir_x=1000; altsinir_y=-30; ustsinir_y=30; altsinir_z=-30; ustsinir_z=30;

xi=600; yi=-11; zi=0;


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

%Kontrol Kuvveti üyelik fonksiyonlarý
yamuk(altsinir_z,-30,-30,-20,-10,ustsinir_z,zi);  z_NC=X; mu_NC=mu_X; 
ucgen(altsinir_z,-20,-10,0,ustsinir_z,zi);        z_NA=X; mu_NA=mu_X; 
ucgen(altsinir_z,-10,0,10,ustsinir_z,zi);         z_SF=X; mu_SF=mu_X; 
ucgen(altsinir_z,0,10,20,ustsinir_z,zi);          z_PA=X; mu_PA=mu_X; 
yamuk(altsinir_z,10,20,30,30,ustsinir_z,zi);      z_PC=X; mu_PC=mu_X; 

%Kurallar
mu_kural1=min(mu_xi_S,mu_yi_NC);
mu_kural2=min(mu_xi_S,mu_yi_NA);
mu_kural3=min(mu_xi_S,mu_yi_SF);
mu_kural4=min(mu_xi_S,mu_yi_PA);
mu_kural5=min(mu_xi_S,mu_yi_PC);
mu_kural6=min(mu_xi_A,mu_yi_NC);
mu_kural7=min(mu_xi_A,mu_yi_NA);
mu_kural8=min(mu_xi_A,mu_yi_SF);
mu_kural9=min(mu_xi_A,mu_yi_PA);
mu_kural10=min(mu_xi_A,mu_yi_PC);
mu_kural11=min(mu_xi_O,mu_yi_NC);
mu_kural12=min(mu_xi_O,mu_yi_NA);
mu_kural13=min(mu_xi_O,mu_yi_SF);
mu_kural14=min(mu_xi_O,mu_yi_PA);
mu_kural15=min(mu_xi_O,mu_yi_PC);
mu_kural16=min(mu_xi_C,mu_yi_NC);
mu_kural17=min(mu_xi_C,mu_yi_NA);
mu_kural18=min(mu_xi_C,mu_yi_SF);
mu_kural19=min(mu_xi_C,mu_yi_PA);
mu_kural20=min(mu_xi_C,mu_yi_PC);

%Sonuçlar
mu_sonuc1=mu_kural1*mu_PC;
mu_sonuc2=mu_kural2*mu_PC;
mu_sonuc3=mu_kural3*mu_SF;
mu_sonuc4=mu_kural4*mu_NA;
mu_sonuc5=mu_kural5*mu_NA;
mu_sonuc6=mu_kural6*mu_PC;
mu_sonuc7=mu_kural7*mu_PA;
mu_sonuc8=mu_kural8*mu_SF;
mu_sonuc9=mu_kural9*mu_NA;
mu_sonuc10=mu_kural10*mu_NC;
mu_sonuc11=mu_kural11*mu_PA;
mu_sonuc12=mu_kural12*mu_SF;
mu_sonuc13=mu_kural13*mu_NA;
mu_sonuc14=mu_kural14*mu_NC;
mu_sonuc15=mu_kural15*mu_NC;
mu_sonuc16=mu_kural16*mu_SF;
mu_sonuc17=mu_kural17*mu_NA;
mu_sonuc18=mu_kural18*mu_NC;
mu_sonuc19=mu_kural19*mu_NC;
mu_sonuc20=mu_kural20*mu_NC;

%Birleþtirme
birlestirme1=max(max(max(max(mu_sonuc1,mu_sonuc2),max(mu_sonuc3,mu_sonuc4)),max(max(mu_sonuc5,mu_sonuc6),max(mu_sonuc7,mu_sonuc8))),max(max(max(mu_sonuc9,mu_sonuc10),max(mu_sonuc11,mu_sonuc12)),max(max(mu_sonuc13,mu_sonuc14),max(mu_sonuc15,mu_sonuc16))));
birlestirme2=max(max(mu_sonuc17,mu_sonuc18),max(mu_sonuc19,mu_sonuc20));
mu_birlestirme=max(birlestirme1,birlestirme2);
figure
plot(X,mu_birlestirme);

%Durulastýrma
toplam_alan = sum(mu_birlestirme);
if toplam_alan == 0
    'Toplam Alan sýfýr';
end
z = sum(mu_birlestirme.*X)/toplam_alan;


h=[z,z,z,z,z,z,z,z,z,z,z];
line(h,0:0.1:1,'Color','red','LineStyle','--');
xlabel(['z = ',num2str(z)]);
display(z)

