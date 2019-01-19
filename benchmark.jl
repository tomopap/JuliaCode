function makerandom(N)
	x = zeros(N);
	y = zeros(N);
	z = zeros(N);
	
	x = rand(N);
	y = rand(N);
	z = rand(N);
	
	icount = 0;
	for i = 1:N
		if x[i]^2+y[i]^2+z[i]^2 <= 1
			icount+=1;
		end
	end
	Vr = 4.0/3.0*pi;
	#println("volume: $(8*icount/N)  Ideal vol: $Vr")
	#println("Ratio: $(8*icount/N/Vr)")
end


gc();
N = 600000000;
@time makerandom(N);
gc();


