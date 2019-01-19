x=["PGM", "DA", "Regression", "LocalRegression", "NaiveBayes", "MixedModels", "SimpleMCMC", "Distance", "DecisionTree", "Neural", "MCMC", "GLM", "OnlineLearning", "GLMNet", "Clustering", "SVM", "KernalDensity", "DimensionalityReduction", "NMF", "ANN"]
function GetPkg(x)
lx=length(x);
for i=1:lx
    try
        Pkg.add(x[i])
    catch
    end
end
end
GetPkg(x)
