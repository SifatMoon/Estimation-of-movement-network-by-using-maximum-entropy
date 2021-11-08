% Sifat Afroj Moon
% Farm level network development from the estimated movement probability
% "Network Development" Subsection in the paper "Estimation of swine movement network at farm level in the US from the Census of Agriculture data"

Tb= readtable('central.xlsx');
A=table2array(Tb(:,3:20));

% %for county benton, iowa
% pig=[41, 149, 289, 393, 2050, 8112, 129644];
% farm = [8, 5, 4, 3, 6, 12, 26];

pig=A(:,2:8);
farm= A(:,10:16);
cfarm=cumsum(farm,2);
cpig=cumsum(pig,2);
groupnumber=7;
TotalFarm= sum(sum(farm));
TotalPig= sum(sum(pig));
TotalCounty= 12;
Tb1= readtable('distmatrix.xlsx');
dist=table2array(Tb1(:,1:TotalCounty));
f=zeros(TotalFarm,4);% column1= farm number, column2= number of pig ,column3= farm size group, column4=county
nodes= zeros(TotalPig, 4);%column1=node number, column2=farm number, column3= farm size group, column4=county
group=[1 24; 25 49; 50 99; 100 199; 200 499; 500 999; 1000 pig(7)];
d0=[0.001489857	0.001358658	0.001388991	0.001400697	0.001454277	0.001464129	0.00150831
    0.001398929	0.001508094	0.001375522	0.001412961	0.001439353	0.001461119	0.001511215
    0.001282609	0.001172595	0.001805469	0.001497905	0.001558077	0.001606609	0.001626441
    0.001058245	0.00110642	0.001419963	0.002391302	0.001769483	0.001951975	0.002103853
    0	0	0	0.001746067	0.007179568	0.00608446	0.005344699
    0	0	0	0.002530823	0.008779385	0.014344919	0.008821325
    0	0	0	0	0	0	0.0117828
    ];
d2=[0.001333461	0.001302879	0.001383467	0.001407639	0.001440353	0.001451125	0.001497203
    0.001337365	0.001296159	0.001376757	0.00141143	0.001437554	0.001446306	0.001498766
    0.001240795	0.001152847	0.001351623	0.001403994	0.001540248	0.001558902	0.001634096
    0.001007796	0.000776804	0.001290646	0.001333742	0.001700596	0.001740316	0.001970759
    0	0	0	0.000576814	0.002455393	0.003412165	0.004491694
    0	0	0	0	0.002021324	0.004096121	0.006375377
    0	0	0	0	0	0	0
    ];

d3=[0.001321181	0.001290479	0.001384046	0.001394328	0.001442162	0.001444933	0.001505647
    0.001326176	0.001300928	0.00138997	0.001391475	0.0014372	0.001439286	0.001498718
    0.00123502	0.001162607	0.001353473	0.001396635	0.001482398	0.001500379	0.001631214
    0.000963335	0.00079903	0.001319472	0.001392201	0.001620361	0.001670181	0.001997529
    0	0	0	0.000287042	0.002072697	0.002257646	0.004553538
    0	0	0	0	0.00075033	0.001207587	0.006595801
    0	0	0	0	0	0	0
    ];

d4=[0.001309212	0.001292924	0.001370829	0.001390698	0.001443516	0.00145875	0.001515628
    0.00131014	0.001291232	0.001370554	0.001391909	0.00144533	0.001460874	0.001513003
    0.00118906	0.0011582	0.001336179	0.001372517	0.001495741	0.001519035	0.001669313
    0.000914802	0.00084307	0.001236377	0.001353403	0.00162719	0.001686859	0.002023335
    0	0	0	9.96E-05	0.001938217	0.002266772	0.004869327
    0	0	0	0	0.000175357	0.000708784	0.007360692
    0	0	0	0	0	0	0
    ];

d5=[0.001264402	0.001281827	0.001304067	0.001409318	0.001452207	0.00151692	0.001561329
    0.001291561	0.001287656	0.001303275	0.001400278	0.001449294	0.001510876	0.001542273
    0.001148942	0.001155434	0.001186427	0.001461407	0.001473118	0.00168293	0.001744161
    0.000989199	0.000838762	0.000977095	0.001417917	0.00160569	0.001985582	0.002083673
    0	0	0	0.000109144	0.000891748	0.003998626	0.004480194
    0	0	0	0	0	0.00339539	0.005475538
    0	0	0	0	0	0	0.0000019
    ];
k=1;
f(1: TotalFarm,1)=1:TotalFarm;
l=0;
for c=1:TotalCounty
    k=1;
    for i= 1: groupnumber
        % g= randi(10, 1, farm(c,i));
        if(farm(c,i)~=0 ) &&(pig(c,i) ~=0)
            if(i~=groupnumber)
                
                [g,v]= randfixedsum(farm(c,i),1,pig(c,i),group(i,1),group(i,2));
            else
                [g,v]= randfixedsum(farm(c,i),1,pig(c,i),group(i,1),pig(c,i));
            end
            sg= sum(g);
            g=g/sg;
            g= g*pig(c,i);
            f(k+l:cfarm(c,i)+l,2)=round(g);
            f(k+l:cfarm(c,i)+l,3)=i;
            f(k+l:cfarm(c,i)+l,4)=c;
            k=cfarm(c,i)+1;
        end
    end
    
    l=k-1 +l;
end
nodes(1:sum(f(:,2)),1)=1:sum(f(:,2));
k=1;
cf=cumsum(f(:,2));
cpig=zeros(TotalCounty,groupnumber);
for i= 1:TotalFarm
    nodes(k:cf(i),2)= i;
    nodes(k:cf(i),3)= f(i, 3);
    nodes(k:cf(i),4)= f(i, 4);
    cpig(f(i, 4),f(i, 3))=cpig(f(i, 4),f(i, 3))+ f(i,2);
    k=cf(i)+1;
end
cpig=cumsum(cpig,2);
l=1;
k=1;
listfarm=zeros(TotalFarm,TotalFarm);
for i=1: sum(f(:,2))
    
    for c=1: TotalCounty
        
        k=1;
        for j=1:groupnumber
            d=dist(nodes(i,4), c);
            if(d==0)
                dd=d0(nodes(i, 3),j);
            end
            if(d==2)
                dd=d2(nodes(i, 3),j);
            end
            if(d==3)
                dd=d3(nodes(i, 3),j);
            end
            if(d==4)
                dd=d4(nodes(i, 3),j);
            end
            if(d==5)
                dd=d5(nodes(i, 3),j);
            end
            x=rand();
            if(x<= dd)
                if(pig(c,j)>0)
                    %                      if(c>5)
                    %                          ss=1
                    %                      end
                    list(l,1)=nodes(i,1);
                    list(l,2)= randsample(k:cpig(c,j),1);
                    %             nodes(list(l,1),2)
                    %             nodes(list(l,2),2)
                    if(c>1)
                        list(l,2)=list(l,2)+ sum(cpig(1:c-1,7));
                    end
                    xxxx=nodes(list(l,2),2)
                    listfarm(nodes(list(l,1),2), nodes(list(l,2),2) ) =listfarm(nodes(list(l,1),2), nodes(list(l,2),2) )+1;
                    l=l+1;
                end
                
            end
            if(pig(c,j)>0)
                k=cpig(c,j)+1;
            end
        end
        
    end
end
l=1;
for i=1:TotalFarm
    for j=1:TotalFarm
        if(listfarm(i,j)>0)
            adjlist(l,1)=i;
            adjlist(l,2)=j;
            adjlist(l,3)=listfarm(i,j);
            l=l+1;
            
        end
    end
end

sifu=1;