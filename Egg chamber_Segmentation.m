

mask = imread("Name.tif");
mask = im2double(mask(:,:,3));






        
        inversemask= imcomplement(mask);
        
        Labelled = bwconncomp(inversemask,4);
        LabelMatrix = labelmatrix(Labelled);
        components = regionprops(Labelled,"Area","PixelList","BoundingBox");
        BoundingBoxVectors = vertcat(components.BoundingBox);
        
        X_dim = BoundingBoxVectors(:,3);
        Y_dim = BoundingBoxVectors(:,4);
        Ratio = (X_dim./Y_dim);
        
        % Q = quantile(Ratio);
        Q = [0.5,0.65,0.8,0.95,1,1.15,1.3,1.45,1.6];
        Q1 = find(Ratio<=Q(1));
        Q2 = find(Ratio<=Q(2)&(Ratio>Q(1)));
        Q3 = find(Ratio<=Q(3)&(Ratio>Q(2)));
        Q4 = find(Ratio<=Q(4)&(Ratio>Q(3)));
        Q5 = find(Ratio<=Q(5)&(Ratio>Q(4)));
        Q6 = find(Ratio<=Q(6)&(Ratio>Q(5)));
        Q7 = find(Ratio<=Q(7)&(Ratio>Q(6)));
        Q8 = find(Ratio<=Q(8)&(Ratio>Q(7)));
        Q9 = find(Ratio<=Q(9)&(Ratio>Q(8)));
        Q10 = find(Ratio>Q(9));
        
        Quantile1 = ismember(LabelMatrix,Q1);
        Quantile2 = ismember(LabelMatrix,Q2);
        Quantile3 = ismember(LabelMatrix,Q3);
        Quantile4 = ismember(LabelMatrix,Q4);
        Quantile5 = ismember(LabelMatrix,Q5);
        Quantile6 = ismember(LabelMatrix,Q6);
        Quantile7 = ismember(LabelMatrix,Q7);
        Quantile8 = ismember(LabelMatrix,Q8);
        Quantile9 = ismember(LabelMatrix,Q9);
        Quantile10 = ismember(LabelMatrix,Q10);

        g = [0,0,0;1/10,1/10,1/10];
        Quantile1 = ind2rgb(Quantile1,g);
        g1 = [0,0,0;2/10,2/10,2/10];
        Quantile2= ind2rgb(Quantile2,g1);
        g2 = [0,0,0;3/10,3/10,3/10];
        Quantile3 = ind2rgb(Quantile3,g2);
        g3 = [0,0,0;4/10,4/10,4/10];
        Quantile4 = ind2rgb(Quantile4,g3);
        g4 = [0,0,0;5/10,5/10,5/10];
        Quantile5 = ind2rgb(Quantile5,g4);
        g5 = [0,0,0;6/10,6/10,6/10];
        Quantile6 = ind2rgb(Quantile6,g5);
        g6 = [0,0,0;7/10,7/10,7/10];
        Quantile7 = ind2rgb(Quantile7,g6);
        g7 = [0,0,0;8/10,8/10,8/10];
        Quantile8 = ind2rgb(Quantile8,g7);
        g8 = [0,0,0;9/10,9/10,9/10];
        Quantile9 = ind2rgb(Quantile9,g8);
        g9 = [0,0,0;1,1,1];
        Quantile10 = ind2rgb(Quantile10,g9);


        FinalMask = Quantile1+Quantile2+Quantile3+Quantile4+Quantile5+Quantile6+Quantile7+Quantile8+Quantile9+Quantile10;
        FinalMask = im2gray(FinalMask);
        
        imshow(FinalMask);
        colormap inferno;

