function [test, train, test_labels, train_labels] = load_images(crop_size)


%===========load test data================
list_dir = dir("axial_t1wce_2_class\labels\test");
test_labels = zeros(length(list_dir) - 2, 2);
test = zeros(length(list_dir) - 2, 256^2);
for i = 3:length(list_dir)
    %label
    f_name = "axial_t1wce_2_class\labels\test\" + list_dir(i).name;
    fileID = fopen(f_name, "r");
    str = fscanf(fileID, "%c");
    fclose(fileID);
    test_labels(i-2,:) = read_label(str);
    
    %image
    extension = list_dir(i).name;
    extension(end-2:end) = 'jpg';
    
    
    f_name = "axial_t1wce_2_class\images\test\" + extension;
    img = imread(f_name);
    
    if length(reshape(img, 1, [])) ~= 256^2
        img = imresize(img, [256, 256]);
    end
    
    img = reshape(img, 1, []);
    test(i-2, :) = img;
    
end





% %===========load train data================
list_dir = dir("axial_t1wce_2_class\labels\train");
% train_labels = zeros(length(list_dir) - 2, 2);
% train = zeros(length(list_dir) - 2, crop_size^2);


train_labels = zeros(32, 2);
train = zeros(32, crop_size^2);
 for i = 3:32+3
     f_name = "axial_t1wce_2_class\labels\train\" + list_dir(i).name;
     fileID = fopen(f_name, "r");
     str = fscanf(fileID, "%c");
     fclose(fileID);
     label = read_label(str);
     train_labels(i-2,:) = label;
     
     
    %image
    extension = list_dir(i).name;
    extension(end-2:end) = 'jpg';

    f_name = "axial_t1wce_2_class\images\train\" + extension;
    img = imread(f_name);
    img = crop_img(img, label, crop_size);
    img = reshape(img, 1, []);
    train(i-2, :) = img;
     
 end





end