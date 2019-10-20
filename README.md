# MCGLS
Multi-shift CGLS - Conjugate Gradient method for systems of multi-shift least squares problems


solves the systems of linear equations
(A'*A+TAU(I)*EYE(N))*X(:,I)=A'*B (I=1:L)
for X with the multishift CGLS algorithm. The right hand side (column)
vector B must have length M, where the coefficient matrix A is M-by-N.
TAU is a vector of reals (the shifts) of length L.

For a short demo run main.m


Reference:
Jasper van den Eshof and Gerard Sleijpen,
Accurate conjugate gradient methods for families of shifted systems,
Applied Numerical Mathematics, Volume 49, Issue 1, 2004. Pages 17-37.
