function yamukFISCikis(altsinir,a,c,d,b,ustsinir)

global  CIKIS mu_CIKIS;

alfa=1; CIKIS1=altsinir:0.001:a-0.001; CIKIS2=a:0.001:c-0.001; CIKIS3=c:0.001:d-0.001; CIKIS4=d:0.001:b-0.001; CIKIS5=b:0.001:ustsinir;
mu_CIKIS1=zeros(size(CIKIS1)); mu_CIKIS2=alfa*(CIKIS2-a)/(c-a); mu_CIKIS3=alfa*ones(size(CIKIS3)); mu_CIKIS4=alfa*(CIKIS4-b)/(d-b); mu_CIKIS5=zeros(size(CIKIS5));
CIKIS=[CIKIS1 CIKIS2 CIKIS3 CIKIS4 CIKIS5]; mu_CIKIS=[mu_CIKIS1 mu_CIKIS2 mu_CIKIS3 mu_CIKIS4 mu_CIKIS5]; plot(CIKIS,mu_CIKIS)

  end
 