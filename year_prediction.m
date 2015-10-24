

% fetch dataset from csv file
ds = dataset('File', 'YearPredictionMSD.txt', 'Delimiter',',');
t = dataset2table(ds);
X = table2array(t);
X=X(1:10000,:);
Y = pdist(X);
Z = linkage(Y);
dendrogram(Z);


% K-means
idx3 = kmeans(X,10,'Distance','cityblock');
figure;
[silh3,h] = silhouette(X,idx3,'cityblock');
h = gca;
h.Children.EdgeColor = [.8 .8 1];
xlabel 'Silhouette Value';
ylabel 'Cluster';