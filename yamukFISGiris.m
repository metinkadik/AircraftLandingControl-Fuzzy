function yamukFISGiris(altsinir,a,c,d,b,ustsinir,giris)

global mu_giris;

alfa=1;
  if giris>=a&&giris<=c
       mu_giris=alfa*(giris-a)/(c-a)
  elseif giris>=c&&giris<=d
      mu_giris=alfa
  elseif giris>=d&&giris<=b
      mu_giris=alfa*(giris-b)/(d-b)
  else 
      mu_giris=0
  end
 