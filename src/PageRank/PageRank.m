function [R1 R2] = PageRank(nume, d, eps)
  [N M nodes val1 val2] = Read(nume);
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  % sortez R2
  [sort_nodes, R] = Sort(nodes, R2);
  % calculez F
  F = Apartenenta(R, val1, val2);
  % formez calea catre fisierul de output
  out = strcat(nume, '.out');
  fileId = fopen(out, 'w');
  % introduc datele in fisier
  fprintf(fileId, '%d\n', N);
  fprintf(fileId, '\n');
  for i = 1:N
    fprintf(fileId, '%f\n', R1(i));
  endfor
  fprintf(fileId, '\n');
  for i = 1:N
    fprintf(fileId, '%f\n', R2(i));
  endfor
  fprintf(fileId, '\n');
  for i = 1:N
    fprintf(fileId, '%d %d %.6f\n', i, sort_nodes(i), F(i));
  endfor
  fclose(fileId);
endfunction
