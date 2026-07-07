function dXdt = celulas(y, mumax, Ks, Ki, Pmax, n)
    
    % y(1) = X (Biomassa)
    % y(2) = S (Substrato)
    % y(3) = P (Produto)
    
    termo_substrato = (mumax * y(2)) / (Ks + y(2) + (y(2)^2)/Ki);
    
    
    termo_produto = (max(0, 1 - y(3)/Pmax))^n;
    
    
    mu = termo_substrato * termo_produto;
    
    % Derivada da biomassa (dX/dt = mu * X)
    dXdt = mu * y(1);
end