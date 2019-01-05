function ucgenFISCikis(altsinir,a,c,b,ustsinir)

global CIKIS mu_CIKIS;


alfa=1; CIKIS1=altsinir:0.001:a-0.001; CIKIS2=a:0.001:c-0.001; CIKIS3=c:0.001:b-0.001; CIKIS4=b:0.001:ustsinir;
mu_CIKIS1=zeros(size(CIKIS1)); mu_CIKIS2=alfa*(CIKIS2-a)/(c-a); mu_CIKIS3=alfa*(CIKIS3-b)/(c-b); mu_CIKIS4=zeros(size(CIKIS4));
CIKIS=[CIKIS1 CIKIS2 CIKIS3 CIKIS4]; mu_CIKIS=[mu_CIKIS1 mu_CIKIS2 mu_CIKIS3 mu_CIKIS4]; plot(CIKIS,mu_CIKIS)

end

