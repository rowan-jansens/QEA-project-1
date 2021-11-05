function [test, train, test_labels, train_labels] = load_images()


list_dir = dir("axial_t1wce_2_class\images\test");
test = zeros(length(list_dir), 256^2);
for i = 3:length(list_dir)
    f_name = "axial_t1wce_2_class\images\test\" + list_dir(i).name;
    img = imread(f_name);
    if size(img) ~= [256 256]
        img = imresize(img, 0.5);
    end
    
    img = reshape(img, 1, []);
    test(i, :) = img;
end



list_dir = dir("axial_t1wce_2_class\labels\test");
test_labels = zeros(length(list_dir), 2);
for i = 3:length(list_dir)
    f_name = "axial_t1wce_2_class\labels\test\" + list_dir(i).name;
    fileID = fopen(f_name, "r");
    str = fscanf(fileID, "%c");
    fclose(fileID);
    test_labels(i,:) = read_label(str);
end



list_dir = dir("axial_t1wce_2_class\images\train");
train = zeros(length(list_dir), 256^2);

for i = 3:length(list_dir)
    f_name = "axial_t1wce_2_class\images\train\" + list_dir(i).name;
    img = imread(f_name);
    
    if length(img) ~= (256^2)
        img = imresize(img, 0.5);
    end
    img = reshape(img, 1, []);
    train(i, :) = img;
end




list_dir = dir("axial_t1wce_2_class\labels\train");
train_labels = zeros(length(list_dir), 2);
for i = 3:length(list_dir)
    f_name = "axial_t1wce_2_class\labels\train\" + list_dir(i).name;
    fileID = fopen(f_name, "r");
    str = fscanf(fileID, "%c");
    fclose(fileID);
    train_labels(i,:) = read_label(str);
end








end