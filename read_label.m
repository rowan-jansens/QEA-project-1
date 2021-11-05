function [center_x center_y] = read_label(A)

B = split(A,"\n")
C = split(B," ")
center_x = round(str2num(C{2}) * 256)
center_y = round(str2num(C{3}) * 256)

end