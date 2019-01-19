
using Plots

function Ids_HEMT(vds::Float64, vgs::Float64)

	# Ids = beta*Wg/Lg*(Imax+vgs^Ngs)/(Imax+vgs^Ngs)*tanh(alpha*vds)

	um = 1.0e-6;
	cm = 1.0e-2;

	beta = 1.0e-3;
	Wg = 10*um;
	Lg = 0.2*um;
	Imax = 30.0;
	Ngs = 2.0;
	alpha = 3.0;
	Vth = -8.0;

    gamma = 1e-2;
    lambda = 5e-3;
    VBR = 6.0;
    IBR = 5e-2;
    NBR = 0.5;
    VBRe = 7.0;
    IBRe = 0e-3;
    NBRe = 0.5;

	K = beta*Wg/Lg;

	vgsx = vds <0 ? vgs - vds+vds*gamma : vgs+vds*gamma;

	vgst = vgsx <= Vth ? 0 : vgsx-Vth;

    if vds >=0
         ibr = exp(-VBR/NBR)*(exp((vds)/NBR)-1.0)*IBR;
    else
         ibr = exp(-VBR/NBR)*(exp(abs(vds)/NBR)-1.0)*IBR;
    end
    if vds >=0
         ibre = exp(-VBRe/NBRe)*(exp((vds)/NBRe)-1.0)*IBRe;
    else
         ibre = -exp(-VBRe/NBRe)*(exp(abs(vds)/NBRe)-1.0)*IBRe;
    end


	idsgs = (Imax*(vgst^Ngs)+ibr)/((Imax+vgst^Ngs));
	idsds = tanh(alpha*vds)+lambda*vds+ibre;

	return K*idsgs*idsds;
end

function HEMTmain()
	Nds = 1001;
	Ngs = 16;
	vdsx =zeros(Nds, Ngs);
	idsx = zeros(Nds, Ngs)
	vds = 0.0;
	vgs = 0.0;
	vdsmin = -3.0;
	vdsmax = 11.0;
	vgsmin = -13.0;
	vgsmax = 2.0;
	for j = 1: Ngs
		vgs = float(j-1)/Ngs*(vgsmax - vgsmin) + vgsmin;
		for i = 1: Nds
			vds = float(i-1)/Nds*(vdsmax - vdsmin) + vdsmin;
			vdsx[i, j] = vds;
			idsx[i, j] = Ids_HEMT(vds, vgs);
		end
	end

	Plots.plot(vdsx, idsx);
	#PyPlot.plot(vdsx, idsx);
	#PyPlot.grid(true)
end

HEMTmain()
