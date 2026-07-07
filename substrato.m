function dSdt = substrato(y, mumax, Ks, Ki, Pmax, n, Yxs)
     
    dXdt = celulas(y, mumax, Ks, Ki, Pmax, n);
    
    dSdt = -(1/Yxs) * dXdt;
end