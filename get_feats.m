% Return an N x M matrix of features, along with the corresponding x,y
% locations of the detected features.
% N and M both depend on what method of feature detection you choose to use.
% N = number of features found
% M = feature vector length
% adjustable: radius parameter, harris parameters
    
function [feats, x, y] = get_feats(img)
    SIZE = size(img);
    feature = harris(img, 1.5, 0.01, 5, 1);
    radius = 5; 
    row = 1 + radius;
    col = 1 + radius;
    feats = ones(0, (2 * radius + 1) * (2 * radius + 1));
    x = ones(0, 1);
    y = ones(0, 1);
    
    while row <= SIZE(1) - radius
        col = 1 + radius;
        while col <= SIZE(2) - radius
            %registers feature according to radius and coordinate
            if feature(row, col) > 0
               temp = img((row - radius):(row + radius), (col - radius):(col + radius));
               temp = temp(:);
               temp = temp.';
               feats = [feats; temp];
               x = [x; row];
               y = [y; col];
            end
            col = col + 1;
        end
        row = row + 1;
    end
end
