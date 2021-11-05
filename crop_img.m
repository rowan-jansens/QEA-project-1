function img = crop_img(A, center, crop_size)

    c_frac_x = center(1);
    c_frac_y = 1 - center(2);

    [py, px] = size(A);
    
    offset = crop_size / 2;
    
    
    
    x_pos = round(c_frac_x * px);
    y_pos = round(c_frac_y * py);
    

    
    a = px - round(y_pos + offset);
    b = px - round(y_pos - offset + 1);
    
    c = round(x_pos - offset + 1);
    d = round(x_pos + offset);
    
    img = A(a:b, c:d);

end