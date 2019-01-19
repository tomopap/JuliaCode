#generating vector
x=Vector(1:10); #[1, 2, 3, 4, 5, .. 10], Array{Int64, 1}
y=[1:10]; #Array{UnitRange{Int64}, 1}
z=[1 2 3 4 5 6 7 8 9 10]; # 1x10 Array{Int64, 2}
a=[1 1 3; 4 -5 -1; 2 -1 -2]
A=float.(a); # use . operator
b=vec([1 2 3]); # make vector. [1 2 3]'.

using QuadGK
f(w)= 1.0/(1.0+w.^2)
g=quadgk(f, -Inf, Inf, rtol=1.0e-16)
println(g[1])
