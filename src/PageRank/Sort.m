function [nodes R] = Sort(nodes, R)
  % functia va sorta nodurile pentru afisarea
  % clasamentului in fisierul de output
  N = length(R);
  for i = 1:N-1
    for j = i+1:N
      if R(i) <= R(j)
        aux = R(i);
        R(i) = R(j);
        R(j) = aux;
        aux = nodes(i);
        nodes(i) = nodes(j);
        nodes(j) = aux;
      endif
    endfor
  endfor
endfunction
