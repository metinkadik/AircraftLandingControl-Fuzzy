%Mamdani

global mu_giris CIKIS mu_CIKIS
altsinir_x=-10; ustsinir_x=1000; altsinir_y=-30; ustsinir_y=30; altsinir_z=-30; ustsinir_z=30;
X=altsinir_x:50:ustsinir_x; Y=altsinir_y:3:ustsinir_y;

for i=1:size(Y,2)
    for j=1:size(X,2)
        
    toplam_alan = 0;


x=X(j); y=Y(i); 


%Ýrtifa üyelik fonksiyonlarý
ucgenFISGiris(altsinir_x,0,0,500,ustsinir_x,x);     mu_x_S=mu_giris;
ucgenFISGiris(altsinir_x,0,300,800,ustsinir_x,x);     mu_x_A=mu_giris;
ucgenFISGiris(altsinir_x,300,800,1000,ustsinir_x,x);     mu_x_O=mu_giris;
ucgenFISGiris(altsinir_x,500,1000,1000,ustsinir_x,x);    mu_x_C=mu_giris;

%Hýz üyelik fonksiyonlarý
yamukFISGiris(altsinir_y,-30,-30,-20,-10,ustsinir_y,y);   mu_y_NC=mu_giris;
ucgenFISGiris(altsinir_y,-20,-10,0,ustsinir_y,y);         mu_y_NA=mu_giris;
ucgenFISGiris(altsinir_y,-10,0,10,ustsinir_y,y);          mu_y_SF=mu_giris;
ucgenFISGiris(altsinir_y,0,10,20,ustsinir_y,y);           mu_y_PA=mu_giris;
yamukFISGiris(altsinir_y,10,20,30,30,ustsinir_y,y);       mu_y_PC=mu_giris;

%Kontrol Kuvveti üyelik fonksiyonlarý
yamukFISCikis(altsinir_z,-30,-30,-20,-10,ustsinir_z); Z=CIKIS;  mu_NC=mu_CIKIS; 
ucgenFISCikis(altsinir_z,-20,-10,0,ustsinir_z);                 mu_NA=mu_CIKIS; 
ucgenFISCikis(altsinir_z,-10,0,10,ustsinir_z);                  mu_SF=mu_CIKIS; 
ucgenFISCikis(altsinir_z,0,10,20,ustsinir_z);                   mu_PA=mu_CIKIS; 
yamukFISCikis(altsinir_z,10,20,30,30,ustsinir_z);               mu_PC=mu_CIKIS; 

%Kurallar
mu_kural1=min(mu_x_S,mu_y_NC);
mu_kural2=min(mu_x_S,mu_y_NA);
mu_kural3=min(mu_x_S,mu_y_SF);
mu_kural4=min(mu_x_S,mu_y_PA);
mu_kural5=min(mu_x_S,mu_y_PC);
mu_kural6=min(mu_x_A,mu_y_NC);
mu_kural7=min(mu_x_A,mu_y_NA);
mu_kural8=min(mu_x_A,mu_y_SF);
mu_kural9=min(mu_x_A,mu_y_PA);
mu_kural10=min(mu_x_A,mu_y_PC);
mu_kural11=min(mu_x_O,mu_y_NC);
mu_kural12=min(mu_x_O,mu_y_NA);
mu_kural13=min(mu_x_O,mu_y_SF);
mu_kural14=min(mu_x_O,mu_y_PA);
mu_kural15=min(mu_x_O,mu_y_PC);
mu_kural16=min(mu_x_C,mu_y_NC);
mu_kural17=min(mu_x_C,mu_y_NA);
mu_kural18=min(mu_x_C,mu_y_SF);
mu_kural19=min(mu_x_C,mu_y_PA);
mu_kural20=min(mu_x_C,mu_y_PC);

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
plot(Z,mu_birlestirme);

%Durulastýrma
toplam_alan = sum(mu_birlestirme);
if toplam_alan == 0
    'Toplam Alan sýfýr';
end
z(i,j) = sum(mu_birlestirme.*Z)/toplam_alan;

    end 
end
size(X)
size(Y)
size(z)

figure
surf(X,Y,z);
xlabel('x');
ylabel('y');
zlabel('z');



