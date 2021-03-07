function [N M nodes val1 val2] = Read(nume)
  fileId = fopen(nume, 'r');
  N = fscanf(fileId, '%d', 1);
  
  % initializari
  L = [];
  nodes = [];
  A = zeros(N);
  M = zeros(N);
  
  % citesc listele de adiacenta
  for i = 1:N
    index = fscanf(fileId, '%d', 1);
    
    % formez vectorul cu nodurile din graf
    nodes = [nodes; index];
    no_links = fscanf(fileId, '%d', 1);
    
    % citesc toate celelalte noduri adiacente cu index intr-o linie
    line = fgetl(fileId);
    int_line = line(2:2:end) - '0';
    
    % formez matricea de adiacenta A
    A(index,int_line) = 1;
    A(index,index) = 0;
    
    % nodurile adiacente cu ele insasi nu se iau in calcul
    if ismember(index, int_line) == 1
      no_links--;
    endif
    
    % formez vectorul L
    L = [L; no_links];
  endfor
  
  % citesc ultimele 2 numere din fisier
  val1 = fscanf(fileId, '%f', 1);
  val2 = fscanf(fileId, '%f', 1);
  fclose(fileId);
  
  % formez matricea M
  % M(i,j) = 1 / L(j), daca exista link de la j la i
  % M(i,j) = 0, altfel
  for j = 1:N
    M(A(j,:)==1,j) = 1 / L(j);
  endfor
endfunction
