function label = read_label(A)


B = split(A,"\n");
C = split(B," ");

center_x = str2double(C{2});
center_y = str2double(C{3});
label = [center_x, center_y];
end