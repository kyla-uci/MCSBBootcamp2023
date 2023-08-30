rMax = 3;
k=0.6;

x=zeros(1,nMax);
x(1) = 0.2;
nMax = 100;

M = []
M = (n,r)
for r=0:3
    
    for n=1:nMax
       x(n+1) = x(n) + r*(1-x(n)/k)*x(n)
end

figure(1); 
plot(x,'-ok');
ylabel('population (thousands')
xlabel('months')
