%% Load data
clear all
close all
clc

file05g=load('point5g.mat');
file2g=load('2g.mat');
file5g=load('5gnew.mat');
file10g=load('10g.mat');
data05g=file05g.dataPoint5g;
data2g=file2g.data2g;
data5g=file5g.data5g;
data10g=file10g.data10g;

resistance_05g = data05g.Resistance;
resistance_2g = data2g.Resistance;
resistance_5g = data5g.Resistance;
resistance_10g = data10g.Resistance;
%--------------------------
Tempcyc = data5g(data5g.Time < 164,:);
x = 234;

Virtualsensor1_05g = [];
Virtualsensor2_05g = [];
Virtualsensor3_05g = [];
Virtualsensor4_05g = [];

Virtualsensor1_2g = [];
Virtualsensor2_2g = [];
Virtualsensor3_2g = [];
Virtualsensor4_2g = [];

Virtualsensor1_5g = [];
Virtualsensor2_5g = [];
Virtualsensor3_5g = [];
Virtualsensor4_5g = [];

Virtualsensor1_10g = [];
Virtualsensor2_10g = [];
Virtualsensor3_10g = [];
Virtualsensor4_10g = [];

for N = 1:x
    Virtualsensor1_05g = [Virtualsensor1_05g; data05g(40 +(N-1)*160,:)]; %100
    Virtualsensor2_05g = [Virtualsensor2_05g; data05g(80 +(N-1)*160,:)]; %120
    Virtualsensor3_05g = [Virtualsensor3_05g; data05g(120 +(N-1)*160,:)]; %140
    Virtualsensor4_05g = [Virtualsensor4_05g; data05g(160 +(N-1)*160,:)]; %160
    
    Virtualsensor1_2g = [Virtualsensor1_2g; data2g(40 +(N-1)*160,:)]; %100
    Virtualsensor2_2g = [Virtualsensor2_2g; data2g(80 +(N-1)*160,:)]; %120
    Virtualsensor3_2g = [Virtualsensor3_2g; data2g(120 +(N-1)*160,:)]; %140
    Virtualsensor4_2g = [Virtualsensor4_2g; data2g(160 +(N-1)*160,:)]; %160
    
    Virtualsensor1_5g = [Virtualsensor1_5g; data5g(40 +(N-1)*160,:)]; %100
    Virtualsensor2_5g = [Virtualsensor2_5g; data5g(80 +(N-1)*160,:)]; %120
    Virtualsensor3_5g = [Virtualsensor3_5g; data5g(120 +(N-1)*160,:)]; %140
    Virtualsensor4_5g = [Virtualsensor4_5g; data5g(160 +(N-1)*160,:)]; %160
    
    Virtualsensor1_10g = [Virtualsensor1_10g; data10g(40 +(N-1)*160,:)]; %100
    Virtualsensor2_10g = [Virtualsensor2_10g; data10g(80 +(N-1)*160,:)]; %120
    Virtualsensor3_10g = [Virtualsensor3_10g; data10g(120 +(N-1)*160,:)]; %140
    Virtualsensor4_10g = [Virtualsensor4_10g; data10g(160 +(N-1)*160,:)]; %160
    disp(N)
end

for i=1:x
    mv(i,1)=mean(resistance_05g((35:40)+160*(i-1),1));
    mv(i,2)=mean(resistance_05g((75:80)+160*(i-1),1));
    mv(i,3)=mean(resistance_05g((115:120)+160*(i-1),1));
    mv(i,4)=mean(resistance_05g((155:160)+160*(i-1),1));
end

for i=1:x
    mv(i+x,1)=mean(resistance_2g((35:40)+160*(i-1),1));
    mv(i+x,2)=mean(resistance_2g((75:80)+160*(i-1),1));
    mv(i+x,3)=mean(resistance_2g((115:120)+160*(i-1),1));
    mv(i+x,4)=mean(resistance_2g((155:160)+160*(i-1),1));
end

for i=1:x
    mv(i+(2*x),1)=mean(resistance_5g((35:40)+160*(i-1),1));
    mv(i+(2*x),2)=mean(resistance_5g((75:80)+160*(i-1),1));
    mv(i+(2*x),3)=mean(resistance_5g((115:120)+160*(i-1),1));
    mv(i+(2*x),4)=mean(resistance_5g((155:160)+160*(i-1),1));
end
for i=1:x
    mv(i+(3*x),1)=mean(resistance_10g((35:40)+160*(i-1),1));
    mv(i+(3*x),2)=mean(resistance_10g((75:80)+160*(i-1),1));
    mv(i+(3*x),3)=mean(resistance_10g((115:120)+160*(i-1),1));
    mv(i+(3*x),4)=mean(resistance_10g((155:160)+160*(i-1),1));
end
%%
for i=1:4 %LOOP 4 TIMES FOR THE 4 TEMPERATURES
    COI((1:7),i)=mv((24:30),i);  %EXPOSURE 1 0.5g 5%RH (will be row 1:7 in score)
    COI((8:14),i)=mv((42:48),i); %EXPOSURE 2 0.5g 5%RH(-||- 8:14 -||-)
    COI((15:21),i)=mv((60:66),i); %EXPOSURE 3 0.5g 5%RH (...)
    COI((22:28),i)=mv((103:109),i);%EXPOSURE 1 0.5g 30%RH
    COI((29:35),i)=mv((121:127),i);%EXPOSURE 2 0.5g 30%RH
    COI((36:42),i)=mv((139:145),i);%EXPOSURE 3 0.5g 30%RH
    COI((43:49),i)=mv((181:187),i);%EXPOSURE 1 0.5g 60%RH
    COI((50:56),i)=mv((199:205),i);%EXPOSURE 2 0.5g 60%RH
    COI((57:63),i)=mv((217:223),i);%EXPOSURE 3 0.5g 60%RH
    
    COI((64:70),i)=mv((x+24:x+30),i);%EXPOSURE 1 2g 5%RH
    COI((71:77),i)=mv((x+42:x+48),i);%EXPOSURE 2 2g 5%RH
    COI((78:84),i)=mv((x+60:x+66),i);%EXPOSURE 3 2g 5%RH
    COI((85:91),i)=mv((x+103:x+109),i);%EXPOSURE 1 2g 30%RH
    COI((92:98),i)=mv((x+121:x+127),i);%EXPOSURE 2 2g 30%RH
    COI((99:105),i)=mv((x+139:x+145),i);%EXPOSURE 3 2g 30%RH
    COI((106:112),i)=mv((x+181:x+187),i);%EXPOSURE 1 2g 60%RH
    COI((113:119),i)=mv((x+199:x+205),i);%EXPOSURE 2 2g 60%RH
    COI((120:126),i)=mv((x+217:x+223),i);%EXPOSURE 3 2g 60%RH
    
    COI((127:133),i)=mv(((2*x)+24:(2*x)+30),i);%EXPOSURE 1 5g 5%RH
    COI((134:140),i)=mv(((2*x)+42:(2*x)+48),i);%EXPOSURE 2 5g 30%RH
    COI((141:147),i)=mv(((2*x)+60:(2*x)+66),i);%EXPOSURE 3 5g 60%RH
    COI((148:154),i)=mv(((2*x)+103:(2*x)+109),i);%EXPOSURE 1 5g 30%RH
    COI((155:161),i)=mv(((2*x)+121:(2*x)+127),i);%EXPOSURE 2 5g 30%RH
    COI((162:168),i)=mv(((2*x)+139:(2*x)+145),i);%EXPOSURE 3 5g 30%RH
    COI((169:175),i)=mv(((2*x)+181:(2*x)+187),i);%EXPOSURE 1 5g 60%RH
    COI((176:182),i)=mv(((2*x)+199:(2*x)+205),i);%EXPOSURE 2 5g 60%RH
    COI((183:189),i)=mv(((2*x)+217:(2*x)+223),i);%EXPOSURE 3 5g 60%RH
    
    COI((190:196),i)=mv((3*x+24:3*x+30),i);%EXPOSURE 1 10g 5%RH
    COI((197:203),i)=mv((3*x+42:3*x+48),i);%EXPOSURE 2 10g 5%RH
    COI((204:210),i)=mv((3*x+60:3*x+66),i);%EXPOSURE 3 10g 5%RH
    COI((211:217),i)=mv((3*x+103:3*x+109),i);%EXPOSURE 1 10g 30%RH
    COI((218:224),i)=mv((3*x+121:3*x+127),i);%EXPOSURE 2 10g 30%RH
    COI((225:231),i)=mv((3*x+139:3*x+145),i);%EXPOSURE 3 10g 30%RH
    COI((232:238),i)=mv((3*x+181:3*x+187),i);%EXPOSURE 1 10g 60%RH
    COI((239:245),i)=mv((3*x+199:3*x+205),i);%EXPOSURE 2 10g 60%RH
    COI((246:252),i)=mv((3*x+217:3*x+223),i);%EXPOSURE 3 10g 60%RH
    
    COI((253:259),i)=mv((18:24),i); %AIR from 0.5g 5%
    COI((260:266),i)=mv((94:100),i);%AIR from 0.5g 30%
    COI((267:273),i)=mv((170:176),i);%AIR from 0.5g 60%
    COI((274:280),i)=mv((x+18:x+24),i);%AIR from 2g 5%
    COI((281:287),i)=mv((x+94:x+100),i);%AIR from 2g 30%
    COI((288:294),i)=mv((x+170:x+176),i);%AIR from 2g 60%
    COI((295:301),i)=mv(((x*2)+18:(x*2)+24),i);%AIR from 5g 5%
    COI((302:308),i)=mv(((x*2)+94:(x*2)+100),i);%AIR from 5g 30%
    COI((309:315),i)=mv(((x*2)+170:(x*2)+176),i);%AIR from 5g 60%
    COI((316:322),i)=mv(((x*3)+18:(x*3)+24),i);%AIR from 10g 5%
    COI((323:329),i)=mv(((x*3)+94:(x*3)+100),i);%AIR from 10g 30%
    COI((330:336),i)=mv(((x*3)+170:(x*3)+176),i);%AIR from 10g 60%  
end
COI_mean=mean(COI);
COI_std=std(COI);
COI_norm=((COI-COI_mean)./COI_std);

% Define colors for PCA
c1=[0.2 0 0]; %dark red - 5%RH 0.5g
c2=[0.5 0 0]; %dark red - 5%RH 2g
c3=[0.7 0 0]; %dark red - 5%RH 5g
c4=[1 0 0]; %red - 5%RH 10g

c5=[0 0.2 0]; %dark green - 30%RH 0.5g
c6=[0 0.5 0]; %dark green - 30%RH 2g
c7=[0 0.7 0]; %dark green - 30%RH 5g
c8=[0 1 0]; %green- 30%RH 10g

c9=[0 0 0.2]; %dark blue - 60%RH 0.5g
c10=[0 0 0.5]; %dark blue - 60%RH 2g
c11=[0 0 0.7]; %dark blue - 60%RH 5g
c12=[0 0 1]; %blue - 60%RH 10g

c13=[1 0.1 0.6]; %AIR

for i=1:7
    colors{i}=c1;
    colors{i+7}=c1;
    colors{i+14}=c1;
    colors{i+21}=c5;
    colors{i+28}=c5;
    colors{i+35}=c5;
    colors{i+42}=c9;
    colors{i+49}=c9;
    colors{i+56}=c9;
    
    colors{i+63}=c2;
    colors{i+70}=c2;
    colors{i+77}=c2;
    colors{i+84}=c6;
    colors{i+91}=c6;
    colors{i+98}=c6;
    colors{i+105}=c10;
    colors{i+112}=c10;
    colors{i+119}=c10;
    
    colors{i+126}=c3;
    colors{i+133}=c3;
    colors{i+140}=c3;
    colors{i+147}=c7;
    colors{i+154}=c7;
    colors{i+161}=c7;
    colors{i+168}=c11;
    colors{i+175}=c11;
    colors{i+182}=c11;
    
    colors{i+189}=c4;
    colors{i+196}=c4;
    colors{i+203}=c4;
    colors{i+210}=c8;
    colors{i+217}=c8;
    colors{i+224}=c8;
    colors{i+231}=c12;
    colors{i+238}=c12;
    colors{i+245}=c12;
    
    colors{i+252}=c13;
    colors{i+259}=c13;
    colors{i+266}=c13;
    colors{i+273}=c13;
    colors{i+280}=c13;
    colors{i+287}=c13;
    colors{i+294}=c13;
    colors{i+301}=c13;
    colors{i+308}=c13;
    colors{i+315}=c13;
    colors{i+322}=c13;
    colors{i+329}=c13;
    
end

[coeff,score,latent,tsq,exp]=pca(COI_norm(:,:)); 

figure(1)
plot(Tempcyc.Time, Tempcyc.Resistance)
figure(2)
plot(data5g.Time, data5g.Resistance)
figure(3)
plot(Virtualsensor1_5g.Time, Virtualsensor1_5g.Resistance)
title('100°C')
figure(4)
plot(Virtualsensor2_5g.Time, Virtualsensor2_5g.Resistance)
title('120°C')
figure(5)
plot(Virtualsensor2_5g.Time, Virtualsensor3_5g.Resistance)
title('140°C')
figure(6)
plot(Virtualsensor2_5g.Time, Virtualsensor4_5g.Resistance)
title('160°C')
figure(7)
plot(mv(:,2))

figure(8)
for i=1:336
  hold on;
  plot(score(i,1),score(i,2),'^','markersize',4,'linewidth',2,'color',colors{i});
end
explain =(latent/sum(latent))*100;
xlabel(strcat('PC1 (%)= ',num2str(explain(1))));
ylabel(strcat('PC2 (%)= ',num2str(explain(2))));
figure(9)
vbls = {'100','120','140','160'}; % Labels for the variables
biplot(coeff(:,1:3),'Scores',score(:,1:3),'VarLabels',vbls);
