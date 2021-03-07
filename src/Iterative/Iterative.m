function R = Iterative(nume, d, eps)
  % construiesc matricea M, pentru iteratiile lui R
  [N M] = Read(nume);
  % initializez
  prev_R(1:N,1) = 1 / N;
  % fac iteratiile pentru R
  while 1
    R = d * M * prev_R + (1 - d) / N;
    % cand norma lor este suficient de mica, ma opresc
    if norm(R - prev_R) < eps
      R = prev_R;
      return;
    endif
    % altfel continui iteratiile
    prev_R = R;
  endwhile
endfunction
