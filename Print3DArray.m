% -------------Print3DArray-------------
% INPUT: An m*n*3 array (designed for RGB Images), .txt file to store formatted array 
% OUTPUT: Writes an array formatted to be pasted into a .c file into designated .txt file

function Print3DArray(array, file)

% Get array dimensions (row, column, page)
[y x z]= size(array);

% Establish fileID
fid = fopen(file,'wt');

% Print Sequence
fprintf(fid, 'uint8_t image[%d][%d][%d] = {\n',y,x,z);
for a = 1:y
    fprintf(fid,'{');
    for b = 1:x
        fprintf(fid,'{%d, %d, %d}',array(a,b,:));
        % Special formatting case
        if b<x 
            fprintf(fid, ', '); 
        end
    end
    fprintf(fid,'},\n');
end
fprintf(fid, '};\n');
  
% Close File
fclose(fid);
end