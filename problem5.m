loadimg;
setupq;

imgmod = zeros([h w c]);

for x = 0:8:w-8
    for y = 0:8:h-8
        for z = 1:c
            X = double(img(y+1:y+8,x+1:x+8,z));
            Xmod = quantize(X, Qbase, 1);
            imgmod(y+1:y+8,x+1:x+8,z) = Xmod;
        end
    end
end

imagesc(uint8(imgmod));