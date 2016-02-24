% -------------GenerateArrayLED-------------- 
% INPUT: Truecolor Image (y*x*RGB), # of radial components, # of transverse components
% OUTPUT: 2D array of 24bit avg colors organized (radial*transverse), Proccessed truecolor image 
% NOTE: The proccessed image will be automatically displayed
% Radial components start at pi and rotate counterclockwise
% Transverse components start at the center and move outward
function [array imgNew] = GenerateArrayLED(img, rad_comp, tran_comp)

% Create 2D array to return
array = zeros(rad_comp, tran_comp, 3);

% read in a JPEG image and split it into color layers %
lr=img(:,:,1);
lg=img(:,:,2);
lb=img(:,:,3);

% Create a 2D plane from -1 to 1 that matches pixel dimensions
[ny nx] = size(lr);
x = linspace(-1,1,nx);
y = linspace(1,-1,ny);
[X Y]=meshgrid(x,y);

% Loop through radial components
r_step = 2*pi/rad_comp;
for a = 1:rad_comp
    
    % Loop through transverse components
    t_step = 1/tran_comp;
    for b = 1:tran_comp
        
        % Logic Index of working section    
        circle_slice = (X.^2+Y.^2>(t_step*(b-1))^2) & (X.^2+Y.^2<(t_step*b)^2) & (atan2(Y,X)>r_step*(a-1-rad_comp/2)) & (atan2(Y,X)<r_step*(a-rad_comp/2));

        % Find the average RGB values for designated area
        avg_r = sum(lr(circle_slice))/length(lr(circle_slice));
        avg_g = sum(lg(circle_slice))/length(lg(circle_slice));
        avg_b = sum(lb(circle_slice))/length(lb(circle_slice));
        
        array(a,b,1) = avg_r;
        array(a,b,2) = avg_g;
        array(a,b,3) = avg_b;
        % Fill in the designated area with their average layer values
        lr(circle_slice) = avg_r;
        lg(circle_slice) = avg_g; 
        lb(circle_slice) = avg_b;
    end
end

% black-out exterior to show what was edited
exterior=~(X.^2+Y.^2<1);
lr(exterior)=NaN;
lg(exterior)=NaN;
lb(exterior)=NaN;
% Combine layers
imgNew=cat(3,lr,lg,lb);
% Display Result
imagesc(imgNew);
% Return color map as a uint8 array
array = uint8(array);
end
