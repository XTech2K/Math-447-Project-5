function Xmod = quantize(X, Q, p)

X = X - 128;
Y = dct(dct(X')');

Q = Q * p;
Yq = round(Y ./ Q);

Ymod = Yq .* Q;
Xmod = idct(idct(Ymod')');
Xmod = Xmod + 128;