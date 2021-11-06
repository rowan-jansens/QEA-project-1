
function [Brightest_Pixel_Value, Max_row, Max_col] = maxpixel(heat_map)


Brightest_Pixel_Value = max(heat_map(:))           %finds brightest pixel (highest value)
[Max_row, Max_col]    = find(heat_map == maxValue) % finds coordinates of brightest pixels (plural!) if two or more pixels have equal brightness
end