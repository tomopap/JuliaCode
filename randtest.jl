function RandTest(N)
	l1(N)=rand(1:N, 1).*rand(1:N, 1).*rand(1:N, 1);
	l2(N)=rand(1:N, 1).*rand(1:N, 1).*rand(1:N, 1);
	l3(N)=rand(1:N, 1).*rand(1:N, 1).*rand(1:N, 1);
	icount::Int128=0
	for i=1:N
		for j=1:N
			for k=1:N
				if l1(N)[1]+l2(N)[1]+l3(N)[1] <= N^3
					icount+=1
				end
			end
		end
	end
	return(float(icount/N^3))
end