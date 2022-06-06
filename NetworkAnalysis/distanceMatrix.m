% Classified the counties according to their continuous distance
%Sifat Afroj Moon

Tb1= xlsread('locationCentraliowa.xlsx', 1);
Ad=(Tb1(:,1:2));
noCounty= length(Ad);
distBwCounty = zeros(noCounty, noCounty);
dismatrix = zeros(noCounty, noCounty);
%6 set of distance. 1= less than 20 km ; 2= distance in 20-100km; 3= distance in 100-200km; 4= distance in 200-400 km; 5= distance is 400- 1000km; 6= distance is more than 1000km

for i= 1: noCounty
    for j= i+1:noCounty
        distBwCounty(i,j) = DistBwn2GeoCordinate(Ad(i, 1), Ad(i, 2), Ad(j, 1), Ad(j,2))/1000;
        distBwCounty(j,i)= distBwCounty(i,j);
        if (distBwCounty(i,j)<=20)
            dismatrix(i,j)=1;
        elseif ((distBwCounty(i,j)>20) && (distBwCounty(i,j)<=100))
            dismatrix(i,j)=2;
        elseif ((distBwCounty(i,j)>100) && (distBwCounty(i,j)<=200))
            dismatrix(i,j)=3;
        elseif ((distBwCounty(i,j)>200) && (distBwCounty(i,j)<=400))
            dismatrix(i,j)=4;
        elseif ((distBwCounty(i,j)>400) && (distBwCounty(i,j)<=1000))
            dismatrix(i,j)=5;
        else
            dismatrix(i,j)=6;
        end
        dismatrix(j,i)= dismatrix(i,j);
    end
end
sw= zeros(noCounty, 3*noCounty);
for i= 1: noCounty
    for j= 1: noCounty
        sw(i, (j-1)*3 + 1)= i;
        sw(i, (j-1)*3 + 2)= j;
        sw(i, (j-1)*3 + 3) = dismatrix(i,j);
    end
end

fs='';
for i= 1: noCounty
    s1='(%d, %d):%d,';
    %s2=', ';
    if(i~=noCounty)
        fs= strcat(fs,s1);
    else
        fs= strcat(fs,s1,'\n');
    end
    
end

file= fopen('distancematrixdata.txt','w');
%fprintf(file,'source target type\n');
fprintf(file,fs,sw');
fclose(file);
