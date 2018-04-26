%% Image Loading

loadimg;
setupgray;

imagesc(imggray);colormap(gray)

%% Problem 3
%% Part (a)

x = 64; y = 64;

X = double(img(x+1:x+8, y+1:y+8));
imagesc(X);colormap(gray)

%% Part (b)

X = X - 128;

Y = dct(dct(X')')

%% Part (c)

setupq;

for p = [1 2 4]
    Q = Qbase * p;
    Yq = round(Y ./ Q)
end

%% Part (d)

X = double(img(x+1:x+8, y+1:y+8));
pics = zeros(8,8,4);

for p = [1 2 4]
    Xmod = quantize(X, Qbase, p);
    pics(:,:,p) = Xmod;
end

imagesc(pics(:,:,1));colormap(gray)
%%
imagesc(pics(:,:,2));colormap(gray)
%%
imagesc(pics(:,:,4));colormap(gray)

%% Part (e)

imgmod = zeros(h,w);
pics = zeros(h,w,4);

for p = [1 2 4]
    for x = 0:8:w-8
        for y = 0:8:h-8
            X = double(img(y+1:y+8,x+1:x+8));
            Xmod = quantize(X, Qbase, p);
            imgmod(y+1:y+8,x+1:x+8) = Xmod;
        end
    end
    
    pics(:,:,p) = imgmod;
end

imagesc(pics(:,:,1));colormap(gray)
%%
imagesc(pics(:,:,2));colormap(gray)
%%
imagesc(pics(:,:,4));colormap(gray)