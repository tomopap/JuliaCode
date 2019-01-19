d=readcsv("pkg_list3.csv")
for i=1:length(d)
	try
        #print(i, ": ", d[i], "¥n")
		Pkg.add(d[i])
	catch
	end
end
Pkg.update()

