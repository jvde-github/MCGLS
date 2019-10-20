function y=Op1(varargin)

  global MyTestMatrix

  A=MyTestMatrix; y=varargin{1};
  y=A*y;

return
