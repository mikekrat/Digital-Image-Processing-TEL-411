function img_median = compute_median(I,K)

num_of_rows = size(K,1);
num_of_columns = size(K,2);
[m, h] = size(I);
[n, u] = size(K);

m_values = 1 : m;
h_values = 1 : h;

img_median = I;
img_median_paddled = padarray(I, [2*floor(n/2), 2*floor(u/2)], 'replicate' );

for i = m_values;
    for j = h_values;
        img_median_paddled_tr = img_median_paddled(i: i+floor(n/2) -1, j: j+ floor(u/2) -1)';
        kernel_vector = reshape(img_median_paddled_tr,1,[]);
        kernel_vector_median = median(double(kernel_vector));
        img_median(i, j) = kernel_vector_median;
    end

end

figure
imshow(img_median)
str = sprintf(['Median filter with kernel ', num2str(num_of_rows), 'x', num2str(num_of_columns)]);
title(str);

end
