function Ids(vds, vgs)
    
     um = 1e-6;
    
     Lg = 0.2*um;
     Wg = 10.0*um;
     myu = 6000; # V/cm^2
     ns = 1.0e^12; # cm^-2
     q = 1.602e-19; # Coulomb
     ep0 = 8.85e-14; # F/cm
     epr = 12.0;
     beta = myu*q/ep0*ns/epr*Wg/Lg*1e-6;
    
     alpha = 1.0;
     gamma = 1e-3;
     lambda = 1e-2;
     VBR = 20.0;
     IBR = 1e-3;
     NBR = 1.3;
     Imax = 10.0;
     Ngs = 2.0;
     Vth = 3.0;
    
     if vds < 0
          vgsx = vgs - vds;
     else
          vgsx = vgs;
     end
    
     if vgsx <= Vth
          vgst = 0.0;
     else
          vgst =(vgsx-Vth+vds*gamma);
     end
     if vds >=0
          ibr = (exp((vds-VBR)/NBR)-1.0)*IBR;
     else
          ibr = -(exp((abs(vds)-VBR)/NBR)-1.0)*IBR;
     end
    
     idsgs = (Imax*(vgst^Ngs+ibr))/(Imax+vgst^Ngs+ibr);
     idsds = tanh(alpha*vds)+lambda*vds;
    
     return(beta*idsgs*idsds);
    
end

using PyPlot

ngs = 20;
nds = 300;
vgs = zeros(ngs);
vds = zeros(nds);
ids = zeros(nds, ngs);
vdsx = zeros(nds, ngs);

for j = 1: ngs
     vgs[j] = float(j-ngs/2);
     for i = 1: nds
          vds[i] = float(i-100)*0.1;
          vdsx[i, j] = vds[i];
          ids[i, j] = Ids(vds[i], vgs[j]);
     end
end

PyPlot.plt.plot(vdsx, ids);
