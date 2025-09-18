function calc_R_char_func(img, A, R, img_or_range)

img_distortion = R;
count = 1;
over4 = 0;

figure
for R_index = R
    L = 2 ^ R_index;
    D = (2 * A) / L;
    
    img_quantized = uni_scalar(img,D);
    if img_or_range == 0
        img_distortion(R_index + 1) = immse(img, img_quantized);
    else
        img_distortion(R_index - 1) = immse(img, img_quantized);
    end
    
    if over4 == 0 || over4 == 1
        subplot(2,2,count)
        plot(img_quantized, img)
        str = sprintf(['characteristic function of the uniform quantizer for R = ', num2str(R_index)]);
        title(str);
        count = count + 1;
    else
        plot(img_quantized, img)
        str = sprintf(['characteristic function of the uniform quantizer for R = ', num2str(R_index)]);
        title(str);
        count = count + 1;
    end
    
    if count > 4
        figure
        count = 1;
        over4 = over4 + 1;
    end
end

figure
plot(R, img_distortion)
title('Rate-distortion curve D(R)')
end