function y = Apartenenta(x, val1, val2)
  % calculez valorile functiei astfel incat sa ramana continua
  % am facut in forma vectorizata pentru a calcula direct vectorul F
  y(x < val1) = 0;
  y(x > val2) = 1;
  y(x >= val1 & x <= val2) = (x(x >= val1 & x <= val2) - val1) / (val2 - val1);
endfunction
