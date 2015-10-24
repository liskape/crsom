% fetch dataset from csv file
ds = dataset('File', 'songs.csv', 'Delimiter','\t');
t = dataset2table(ds);
varnames = {'song_discovery', 'song_currency', 'artist_discovery', 'artist_hotttnesss', 'song_hotttnesss', 'artist_familiarity', 'key','energy', 'liveness', 'tempo', 'speechiness', 'acousticness', 'instrumentalness','mode', 'time_signature', 'duration', 'loudness', 'valence', 'danceability'};


T = [t(:, 2:3) t(:,5:21)];
a = table2array(T);

% remove nan rows
a =  a(~any(isnan(a),2),:);
a =  a(~any(iszero(a),2),:);


% hits
[rows cols] = size(a)
target = 1:rows
target(a(:,1) > 0.001) = 1
target(a(:,1) <= 0.001) = 2
target(a(:,1) <= 0.0004) = 3