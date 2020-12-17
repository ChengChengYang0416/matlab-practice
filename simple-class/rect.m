% an object encapsulating the dimension of a rectangle

classdef rect
    % contain data
    properties
        length {mustBeNumeric}
        width {mustBeNumeric}
    end
    
    % contain operations
    methods
        function Area = area(obj)
            Area = obj.length*obj.width;
        end
        function Perimeter = perimeter(obj)
            Perimeter = 2*(obj.length+obj.width);
        end
    end
end