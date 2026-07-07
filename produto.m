function dPdt = produto(y, mumax, Ks, Ki, Pmax, n, Yps, Yxs)
    
    dSdt = substrato(y, mumax, Ks, Ki, Pmax, n, Yxs);
    
    dPdt = Yps * (-dSdt);
end