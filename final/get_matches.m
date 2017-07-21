% Return matched x,y locations across the two images. The point defined by (x1,y1) in
% img1 should correspond to the point defined by (x2,y2) in img2.

function [x1, y1, x2, y2] = get_matches(img1, img2, do_visualization)
    %collects featurs of each image
    %parameters in get_feats.m
    [FM1, Cx1, Cy1] = get_feats(img1);
    [FM2, Cx2, Cy2] = get_feats(img2);
    DIST = dist2(FM1, FM2);
    DIM = size(DIST);
    IDlist = zeros(DIM(1) * DIM(2), 3);
    counter = 1;
    
    for r = 1:DIM(1)
        for c = 1:DIM(2)
            IDlist(counter, :) = [DIST(r, c), r, c];
            counter = counter + 1;
        end
    end
    
    IDlist = sortrows(IDlist);
   
    %adjustable parameter (howMany) first few hundred matches
    howMany = 400;
    x1 = zeros(0, 1);
    y1 = x1;
    x2 = x1;
    y2 = x1;
    
    for i = 1:howMany        
        x1 = [x1; Cx1(IDlist(i, 2))];
        y1 = [y1; Cy1(IDlist(i, 2))];
        x2 = [x2; Cx2(IDlist(i, 3))];
        y2 = [y2; Cy2(IDlist(i, 3))];   
    end
     if do_visualization
     %merges images side by side and updates coords
         together = horzcat(img1, img2);
         imshow(together);
         hold on
         SHIFT = size(img1);
         y2 = y2 + SHIFT(2);
        for j = 1:howMany
            line([y1(j) y2(j)], [x1(j) x2(j)],'Marker','.','LineStyle','-');
        end
     end
end

