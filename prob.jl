using Distributions
using PyPlot

function Prob(balls, num_s, num_ex)
	rr=0
	bb=0
	ww=0
	h=zeros(num_ex)
	k=1
	z=zeros(num_s*num_ex)
	bbx=zeros(num_s)
	bb0=0
	bb1=0
	bb2=0
	bb3=0
	bb4=0
	bb5=0

	for i=1:num_s
		bbp=0
		spt=shuffle(balls)
		for m=1:num_ex
			h[m]=spt[m]
		end
		#h=sample(balls, num_ex)
		for j=1:num_ex
			z[k]=h[j]
			if h[j]==1
				rr+=1
			elseif h[j]==2
				bb+=1
				bbp+=1
			elseif h[j]==3
				ww+=1
			else
			end
			k+=1
		end
	bbx[i]=bbp
	if bbp == 0
		bb0+=1
	elseif bbp == 1
		bb1+=1
	elseif bbp == 2
		bb2+=1
	elseif bbp == 3
		bb3+=1
	elseif bbp == 4
		bb4+=1
	elseif bbp == 5
		bb5+=1
	else
	end
	
	end
	print("\n\n")
	print("Red: ", rr, "\tBlue: ", bb, "\tWhite: ", ww, "\n\n")
	print("Pr: ", rr/(num_s*num_ex)*100, " [%]\tPb: ", bb/(num_s*num_ex)*100, " [%]\tPw: ", ww/(num_s*num_ex)*100, " [%] \n\n")
  	print("bb0: ", bb0, "\tbb1: ", bb1, "\tbb2: ", bb2, "\tbb3: ", bb3, "\tbb4: ", bb4, "\tbb5: ", bb5, "\n\n")
  	print("Pb0: ", bb0/(num_s)*100, " [%]\tPb1: ", bb1/(num_s)*100, " [%]\tPb2: ", bb2/(num_s)*100, " [%] \n\nPb3: ", bb3/(num_s)*100, " [%]\tPb4: ", bb4/(num_s)*100, " [%]\tPb5: ", bb5/(num_s)*100, " [%]\n")
	return(z, bbx)
end

xr=[1, 1, 1]
xb=[2, 2, 2, 2, 2]
xw=[3, 3, 3, 3, 3, 3, 3]
balls=[xr, xb, xw]
(z, bbx)=Prob(balls, 1000, 5);
PyPlot.plt.hist(z);
PyPlot.plt.hist(bbx);
