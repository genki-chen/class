% File: c17_erlangb.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
C_1 = [1:10];
A_1 = linspace(0.1,10,50);
C_2 = [12:2:20];
A_2 = linspace(3,20,50);
C_3 = [30:10:100];
A_3 = linspace(13,120,50);
for i = 1:length(C_1)
   for j = 1:length(A_1)
      p_1(j,i) = erlang_b(A_1(j),C_1(i));
   end
end
for i = 1:length(C_2)
   for j = 1:length(A_2)
      p_2(j,i) = erlang_b(A_2(j),C_2(i));
   end
end
for i = 1:length(C_3)
   for j = 1:length(A_3)
      p_3(j,i) = erlang_b(A_3(j),C_3(i));
   end
end
%
% The following code plots the results.
x1 =     [.1 .1 .2 .2 .3 .3 .4 .4 .5 .5 .6 .6 .7 .7 .8 .8 .9 .9 ];
y1 = 10.^[-4 1 1 -4 -4 1 1 -4 -4 1 1 -4 -4 1 1 -4 -4 -1];
y2 =     [.1 .1 .2 .2 .3 .3 .4 .4 .5 .5 .6 .6 .7 .7 .8 .8 .9 .9];
x2 = 10.^[-1 3 3 -1 -1 3 3 -1 -1 3 3 -1 -1 3 3 -1 -1 3];
loglog(A_1,p_1,'k-',A_2,p_2,'k-',A_3,p_3,'k-',...
                  x1,y1,'k:',10*x1,y1,'k:',...
                  100*x1,y1,'k:',1000*x1,y1,'k:',...
                  x2,y2,'k:',x2,0.1*y2,'k:',x2,0.01*y2,'k:');
xlabel('Offered traffic (Erlangs)')
ylabel('Blocking probability')
axis([0.1 120 0.001 0.1])
text(.115, .115,'C=1')
text(.6, .115,'C=2')
text(1.18, .115,'3')
text(2, .115,'4')
text(2.8, .115,'5')
text(7, .115,'10')
text(9, .115,'12')
text(17, .115,'20')
text(27, .115,'30')
text(45, .115,'50')
text(100, .115,'100')
% End of script file.


