#using PyPlot
Nprm = 6;
N = 500;
x =4pi/N*[0:N];
y = exp(-0.2x).*sin(2.3x+1.0).*cos(3.3x+1.2);
p = zeros(Nprm);
q = zeros(Nprm);
pbest= zeros(Nprm);
f(x, p)=p[1]*exp(x*p[4]).*sin(x*p[2]+p[3]).*cos(x*p[5]+p[6]);
ressum0=1e9; 
PyPlot.plt.scatter(x, y);
PyPlot.plt.plot(x, f(x, p));
Niter = 2000000;
dumping=0.9;
resbest = 1e9;
for i=1:Niter
	for j = 1:Nprm
	   p[j]=3.3*(rand(1)[1]-0.5)+q[j];
	end

       #p[2]=30.0*(rand(1)[1]-0.5)+q[2];
       #p[3]=10.0*(rand(1)[1]-0.5)+q[3];
       dy = y -f(x, p);
       res = dy.^2;
       ressum = sum(res);
       if ressum0 > ressum
           println("res($i):$ressum");
		   ressum0 = ressum;
		   for j=1:Nprm
		   		q[j]=p[j];
		   end
		   #q[2]=p[2];
		   #q[3]=p[3];
       end
end
PyPlot.plt.plot(x, f(x, q));
PyPlot.plt.grid(true)
println("Residual sum of square: $ressum0");
println(q);