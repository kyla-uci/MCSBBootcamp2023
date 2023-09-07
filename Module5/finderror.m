function sse = finderror(x) %x is a vector

lambda = x(1); %taking certain values from the vector
theta = x(2);
alpha = x(3);
initial_od = x(4);
my_time = [0,30,59,89,118,148,183];


f = @(n) lambda*n*(1-(n/theta)^alpha);

dndt = @(t,x2)[f(x2)];

[T,x_simulated] = ode45(dndt, my_time, initial_od);

raw_data = [0.09,0.12,0.20,0.38,0.58,0.76,1.10];
bacteria = reshape(raw_data, size(x_simulated));

%figure; hold on
%plot(my_time,x_simulated);
%plot(my_time,bacteria);
%xlabel('time (min)')
%ylabel('Bacteria [N]')
%legend('N_{sim}', 'N_{exp}')

sse = sum((x_simulated - bacteria).^2);
end

