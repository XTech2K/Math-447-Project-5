color = length(size(img)) == 3;

if color
    img = double(img);
    r=img(:,:,1);g=img(:,:,2);b=img(:,:,3);
    imggray=0.2126*r+0.7152*g+0.0722*b;
    imggray=uint8(imggray);
end