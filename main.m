% =============================================

% MODELAGEM DE BIORREATOR EM BATELADA: CINÉTICA DE Andrews / Lee-Pirt-Coulman / Levenspiel) (13)

% =============================================

% 1. Definição dos Parâmetros Cinéticos
mumax = 0.57;   
Yxs   = 0.04;   
Ks    = 21;     
Yps   = 0.43;   
Ki    = 26;     
Pmax  = 73;     
n     = 0.7;    

% 2. Dados Experimentais (Tabela 1)
t_exp = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
X_exp = [15, 15.7, 17.5, 18.6, 20.1, 21.6, 22.4, 22.8, 22.8, 22.9];
S_exp = [173.9, 159.4, 126.8, 89.8, 57.9, 33.6, 18, 6.1, 2.5, 0.4];
P_exp = [0, 12.8, 26.9, 43.3, 55.7, 67.4, 73.2, 78.7, 81.4, 82.7];

% 3. Condições Iniciais e Tempo de Integração
y0 = [X_exp(1); S_exp(1); P_exp(1)]; 
tspan = [0 9];


sistema_edos = @(t, y) [
    celulas(y, mumax, Ks, Ki, Pmax, n);               % dX/dt
    substrato(y, mumax, Ks, Ki, Pmax, n, Yxs);        % dS/dt
    produto(y, mumax, Ks, Ki, Pmax, n, Yps, Yxs)      % dP/dt
];

[t_sim, y_sim] = ode15s(sistema_edos, tspan, y0);

X_sim = y_sim(:,1);
S_sim = y_sim(:,2);
P_sim = y_sim(:,3);


% 6. Plotagem dos Resultados
figure(1)
subplot(3,1,1);
plot(t_sim, X_sim, 'b-', 'LineWidth', 2); hold on;
plot(t_exp, X_exp, 'bo', 'MarkerFaceColor', 'b');
ylabel('Biomassa X (g/L)');
title('Comparação Modelo vs Experimental');
legend('Simulação', 'Experimental', 'Location', 'best');


% Gráfico Substrato (S)
subplot(3,1,2);
plot(t_sim, S_sim, 'r-', 'LineWidth', 2); hold on;
plot(t_exp, S_exp, 'ro', 'MarkerFaceColor', 'r');
ylabel('Substrato S (g/L)');
legend('Simulação', 'Experimental', 'Location', 'best');


% Gráfico Produto (P)
subplot(3,1,3);
plot(t_sim, P_sim, 'g-', 'LineWidth', 2); hold on;
plot(t_exp, P_exp, 'go', 'MarkerFaceColor', 'g');
xlabel('Tempo (h)');
ylabel('Produto P (g/L)');
legend('Simulação', 'Experimental', 'Location', 'best');

figure(2)
hold on; 


p1 = plot(t_sim, X_sim, 'b-', 'LineWidth', 2); 
p2 = plot(t_exp, X_exp, 'bo', 'MarkerFaceColor', 'b');

p3 = plot(t_sim, P_sim, 'g-', 'LineWidth', 2); 
p4 = plot(t_exp, P_exp, 'go', 'MarkerFaceColor', 'g');

p5 = plot(t_sim, S_sim, 'r-', 'LineWidth', 2); 
p6 = plot(t_exp, S_exp, 'ro', 'MarkerFaceColor', 'r');

xlabel('Tempo (h)', 'FontWeight', 'bold');
ylabel('Concentração (g/L)', 'FontWeight', 'bold'); 
title('Perfil Cinético do Biorreator: X, S e P', 'FontWeight', 'bold');

legend([p1, p2, p5, p6, p3, p4], ...
       'Biomassa X (Simulado)', 'Biomassa X (Experimental)', ...
       'Substrato S (Simulado)', 'Substrato S (Experimental)', ...
       'Produto P (Simulado)', 'Produto P (Experimental)', ...
       'Location', 'best');
       
hold off;