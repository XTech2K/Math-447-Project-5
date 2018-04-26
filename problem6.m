loadimg;
setupq;

imgmod = zeros([h w c]);

%% Transform into luminance

yuv = double(img);

r=yuv(:,:,1);g=yuv(:,:,2);b=yuv(:,:,3);

y = 0.299*r + 0.587*g + 0.114*b;
u = b - y;
v = r - y;

yuv(:,:,1)=y;yuv(:,:,2)=u;yuv(:,:,3)=v;

yuvmod = zeros([h w c]);

%% Do regular quantization on luminance matrices

for x = 0:8:w-8
    for y = 0:8:h-8
        for z = 1:c
            X = yuv(y+1:y+8,x+1:x+8,z);
            Xmod = quantize(X, Qjpeg, 1);
            yuvmod(y+1:y+8,x+1:x+8,z) = Xmod;
        end
    end
end

%% Transform out of luminance

y=yuvmod(:,:,1);u=yuvmod(:,:,2);v=yuvmod(:,:,3);

b = u + y;
r = v + y;
g = (y - 0.299*r - 0.114*b)/0.587;

imgmod(:,:,1)=r;imgmod(:,:,2)=g;imgmod(:,:,3)=b;

imagesc(uint8(imgmod));