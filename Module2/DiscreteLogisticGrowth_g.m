k=0.6;
nMax=1000;
M =50;%semcolon hides output
rRange = 3*(1:M)/M; %making a list of 1to50, 
% dividing by 50, then multiplying by three,
%to get this list of values from 0 to 3

figure(1); 
hold on %this enables you to add to the figure
for r=rRange  %for i in i of rRange
    x=zeros(1,nMax); %makes a matrix of zeros from 1 to nMax
    x(1) = 0.2; %setting first x value (matlab index starts at 0)
    for n=1:nMax %for i in i to nMax
       x(n+1) = x(n) + r*(1-x(n)/k)*x(n); 
       %x[i+1] = some function dependent on x[i]
    end
 v = r*ones(1,100); 
 %ones is an array  of 1000 1's, something for graphing
 scatter(v,x(nMax-99:nMax));
    % plot function taking v (99 long) and x[from 901 to 1000]
end
ylabel('population')%faster if outside of for loop
xlabel('r')
