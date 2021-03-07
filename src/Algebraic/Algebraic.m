function R = Algebraic(nume, d)
  [N M] = Read(nume);
  % calculez inversa matricii cu GS
  Inv = PR_Inv(eye(N) - d * M);
  b(1:N,1) = (1 - d) / N;
  % aflu vectorul R
  R = Inv * b;
endfunction
