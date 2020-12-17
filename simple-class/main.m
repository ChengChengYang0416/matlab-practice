% create an object of the class 'rect'
rec = rect;

% assign data
rec.length = 3;
rec.width = 2;

% perform operations on data
area_of_rec = rec.area;
peri_of_rec = rec.perimeter;

% print
fprintf('The length of the rectangle is %d\n', rec.length);
fprintf('The width of the rectangle is %d\n', rec.width);
fprintf('The area of the rectangle is %d\n', area_of_rec);
fprintf('The perimeter of the rectangle is %d\n', peri_of_rec);
