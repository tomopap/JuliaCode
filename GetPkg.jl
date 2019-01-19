function GetPkg(d)
	ld=length(d)
	for i=1:ld
		try
			print(i, ": ", d[i], "\n")
			Pkg.add(d[i])
		catch
		end
	end
end

d=["Calendar","RDatasets","Benchmark","BenchmarkLite","Winston","Cairo","Calculus","Cartesian","DataFrames","Datetime","Distributions","Example","Gadfly","GLM","GSL","IJulia","JSON","JuMP","Pandas","PyCall","PyPlot","PySide","REPLCompletions","REPL","SVM","SymPy","TimeData"]
GetPkg(d)
