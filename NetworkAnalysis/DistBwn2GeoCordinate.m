function dX=DistBwn2GeoCordinate(lat1,long1, lat2, long2)
R= 6371*10^3;


phi1=degtorad(lat1);
phi2=degtorad(lat2);
delphi= degtorad(lat2-lat1);
dellam= degtorad(long2- long1);

a= (sin(delphi/2))^2 + cos(phi1)*cos(phi2)*(sin(dellam/2))^2;

c= 2*atan2(sqrt(a),sqrt(1-a));

dX= R*c;% dx is in meter