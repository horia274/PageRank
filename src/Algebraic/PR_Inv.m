function B = PR_Inv(A)
	% calculez inversa matricii A folosind factorizari Gram-Schmidt
	% AB=I si GS => QRB=I => RB=Q' => RB(:,i)=Q'(:,i), pentru i=1:n
  % rezolv n sisteme cu SST --> R*B(coloara i)=Q'(coloana i)
  n = length(A);
  [Q R] = GramSchmidt(A);
  for i = 1:n
    % R*B(coloara i)=Q'(coloana i) => aflu coloana i din B
    B(:,i) = SST(R, Q'(:,i));
  endfor
endfunction
