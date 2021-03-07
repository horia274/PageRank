function [x] = SST(A, b)
  % rezolv un sistem superior triunghiular
  n = length(A);
  x = zeros(n,1);
  % pornesc de la ultima linie si le folosesc pe cele
  % pe care le aflu, pentru aflarea celorlalte
  for k = n : -1 : 1
    s = sum(A(k, k + 1 : n) * x(k + 1 : n));
    x(k) = (b(k) - s) / A(k, k);
  endfor
endfunction
