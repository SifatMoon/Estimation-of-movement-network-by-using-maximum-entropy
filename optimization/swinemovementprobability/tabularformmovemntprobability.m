Tb1= xlsread('movementprobability.xlsx', 1);

Ad=(Tb1(:,1:4));
nogroup=7;
dist=5; 
distgrp=5;
atable=zeros(nogroup,nogroup);
for i=1:nogroup*nogroup*distgrp
    
    if(Ad(i,3)==dist)
        atable(Ad(i,1),Ad(i,2)) = Ad(i,4);
    end
end
sifu=1;