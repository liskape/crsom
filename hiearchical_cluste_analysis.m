% hiearchical cluster analysis

t = dataset2table(ds);

% t.song_currency = zscore(t.song_discovery)
% t.key = zscore(t.key);
% t.tempo = zscore(t.tempo);
% t.duration = zscore(t.duration);
% t.loudness = zscore(t.loudness);
% t.time_signature = zscore(t.time_signature);


T = [t(:, 2:3) t(:,5:21)];
a = table2array(T);

% remove nan rows
a =  a(~any(isnan(a),2),:);
a =  a(~any(iszero(a),2),:);
a = zscore(a);


% distance information
Y =  pdist(a);
sq = squareform(Y);
% linkages
Z = linkage(Y);

% show dendogram
dendrogram(Z)