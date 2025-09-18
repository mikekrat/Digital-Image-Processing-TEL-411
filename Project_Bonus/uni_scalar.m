function img_quan = uni_scalar(img,D)
    img_quan = D * sign(img) .* floor(abs( abs(img) / D + 1/2));
return 
end