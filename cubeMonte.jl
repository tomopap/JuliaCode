function cubeMonte(N)
    icount::Int128=1
    for i=1:N
        for j=1:N
            for k=1:N
                rand()^3+rand()^3+rand()^3 < 1.0 ? icount+=1 : 0
            end
        end
    end
    return float(icount/N^3)
end
