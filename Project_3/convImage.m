function convImage = convolution(image,kernel)

[RI, CI] = size(image);
[RK, CK] = size(kernel);

RC = [RI, CI] + 2 * ([RK, CK] - 1);

a_0 = zeros(RC);
a_0(RK : (end - RK + 1), CK : (end - CK + 1)) = image;

convImage = zeros(RK + RI - 1, CI + CK - 1);

for rr = 1:RC(1)- RK+1
    for cc = 1:RC(2) - CK+1
        z = a_0(rr : rr+RK-1, cc : cc+CK-1);
        convImage(rr,cc) = z(:)' *kernel(:);
        
    end
end

end