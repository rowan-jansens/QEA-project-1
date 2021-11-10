function img = add_border(heat_map, crop_size)

    img = ones(256, 256) * mean(mean(heat_map));
    marg = round(crop_size / 2);
    img(marg+1:257-marg, marg:256-marg) = heat_map;
end
