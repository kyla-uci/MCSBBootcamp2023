%f =@(u,w) -5*u + 6*w   +0.1; %how rna changes
%g =@(u,w) -2*w + 1.2*u; %how protien changes
%
%dxdt = @(t,x)[f(x(1),x(2));
%              g(x(1),x(2))];
%
%[T, X] = ode45(dxdt, [0,150], [0.0,0.14] );
%%if two variables initial condition has two things
%figure; hold on;
%plot(T,X(:,1),'-r'); % red for RNA
%plot(T,X(:,2),'-', 'color', [0.5 0 1]); % purple for protein which is specified bu [0.5 0 1]
%ylabel('Molecular concentration (micromolar)')
%xlabel('Time (hours)')

k_aon = 10;
k_aoff = 10;
k_ion = 10;
k_ioff = 10;
k_icat = 10;
k_acat = 100;
k_tot = 1;
p_tot = 1;

f1 = @(i,ik,a,ap) -k_ion*(k_tot-ik)*i +k_ioff*ik+k_icat*ap;

f2 = @(i,ik,a,ap) k_ion*(k_tot - ik)*i - k_ioff*ik - k_acat*ik;

f3 = @(i,ik,a,ap) -k_aon*(p_tot-ap)*a + k_aoff*ap + k_acat*ik;
 
f4 = @(i,ik,a,ap) k_aon*(p_tot-ap)*a - k_aoff*ap -k_icat*ap;

dxdt = @(t,x)[f1(x(1),x(2),x(3),x(4));
              f2(x(1),x(2),x(3),x(4));
              f3(x(1),x(2),x(3),x(4));
              f4(x(1),x(2),x(3),x(4))];
              

[T, X] = ode45(dxdt, [0,1], [1, 0, 0, 0]);

figure; hold on;
plot(T,X(:,1),'-r'); % red for i
plot(T,X(:,2),'-', 'color', [0.5 0 1]); % purple for i which is specified bu [0.5 0 1]
plot(T, X(:,3),'-b');
plot(T,X(:,4), '-k');
ylabel('Molecular concentration (micromolar)')
xlabel('Time (hours)')