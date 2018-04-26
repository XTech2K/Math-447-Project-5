loadimg;
setupgray;
setupq;

imgmod = zeros(h,w);

for x = 0:8:w-8
    for y = 0:8:h-8
        X = double(imggray(y+1:y+8,x+1:x+8));
        Xmod = quantize(X, Qjpeg, 1);
        imgmod(y+1:y+8,x+1:x+8) = Xmod;
    end
end

imagesc(imgmod);colormap(gray)