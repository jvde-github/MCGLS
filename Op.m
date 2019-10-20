function y=Op(y,flag,varargin)

if nargin==2

  A=[1/250,[200:250]]';

  switch(flag)
  case ''
    y=A.*y;
  case 'transpose'
    y=A.*y;
  end

else

  A=varargin{1};

  switch(flag)
  case ''
    y=A*y;
  case 'transpose'
    y=A'*y;
  end

end

return
