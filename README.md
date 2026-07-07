Esse repositório tem como objetivo a modelagem matemática de um biorreator em batelada, obdecendo a cinética Andrews / Lee-Pirt-Coulman / Levenspiel.



# MODELAGEM DE BIORREATOR EM BATELADA
## Cinética de Andrews / Lee-Pirt-Coulman / Levenspiel (13)

Os balanços de massa para biomassa ($X$), substrato ($S$) e produto ($P$) assumindo taxa de morte insignificante e sem consumo para manutenção, são descritos pelas seguintes Equações Diferenciais Ordinárias (EDOs):

$$\frac{dX}{dt}=\mu X$$

$$\frac{dS}{dt}=-\frac{\mu X}{Y_{X/S}}$$

$$\frac{dP}{dt}=Y_{P/S}\left(\frac{\mu X}{Y_{X/S}}\right)$$

### Modelo Cinético

O modelo de crescimento escolhido contabiliza a inibição por substrato (Andrews) e a inibição por produto (Levenspiel):

$$\mu=\left(\frac{\mu_{max}S}{K_S+S+\frac{S^2}{K_i}}\right)\left(1-\frac{P}{P_{max}}\right)^n$$

A partir dos modelos propostos, obteve-se as seguintes curvas as quais demonstram a dinâmica no biorreator.

![Comparação entre simulado e experimental ](/biorreatores/comparacao.jpeg)
![Curvas únicas](/biorreatores/unico.jpeg)