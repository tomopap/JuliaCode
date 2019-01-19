using Plots
using Interact

function zf(x, y)

  VTH=-1.0
  IMAX=1.0
  vgst=y-VTH
  if vgst<0
    vgst=0.0
  end

  return tanh(x)*IMAX*vgst^2/(IMAX+vgst^2)

end

function main3()

  x0=0.0
  y0=-2.0
  dx = 0.5
  dy = 0.4
  imax=11
  jmax=11
  Ix = zeros(imax, jmax)

  x=[x0+dx*(i-1) for i=1:imax]
  y=[y0+dy*(j-1) for j=1:jmax]

  for j=1:jmax
    for i=1:imax
      Ix[i, j]=zf(x[i], y[j])
    end
  end

  forpgf=false
  no3d=false
  #plot(x, y, Ix, legend=:none)
  #plot(x,y,Ix,seriestype=:scatter3d)
  #forpgf ? plot() : plot(Ix,seriestype=:heatmap,legend=:none)
  #no3d ? plot() : plot(Ix,seriestype=:surface,legend=:none)

  θ=90
  forpgf ? plot() : plot(Ix,seriestype=:wireframe, camera=(θ,0))


  #plot(Ix,seriestype=:contour,legend=:none)


end

main3()
