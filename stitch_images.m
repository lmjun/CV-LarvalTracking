% Return a new complete image that stitches the two input images together
% If the two images cannot be stitched together, return 0

function new_img = stich_images(img1, img2)

    img1 = im2double(img1);
    img1 = rgb2gray(img1);
    img2 = im2double(img2);
    img2 = rgb2gray(img2);
    
    [x1, y1, x2, y2] = get_matches(img1, img2, 1);
    %get_transform(x1, y1, x2, y2);
    
    new_img = img1;
end