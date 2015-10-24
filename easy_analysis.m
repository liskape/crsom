% simple attributtes analysis

% get_artist_familiarity
tic;
familiarities = cellfun(@(f) get_artist_familiarity(HDF5_Song_File_Reader(f)), all_files, 'UniformOutput', false);
disp(['All familiarities acquired in ',num2str(toc),' seconds.']);
disp(['First is: ',familiarities{1}]);
fa = cell2mat(familiarities);
hist(fa)
boxplot(fa)
disp(['There is ',num2str(sum(isnan(fa))),' missing.']);


% places
places = cellfun(@data_create, all_files, 'UniformOutput', false);

% dancebility hotttness energy
dan_hot_en_data = cellfun(@dan_hot_en, all_files, 'UniformOutput', false);
mat = cell2mat(dan_hot_en_data)

% data
cells = cellfun(@hot_y, all_files, 'UniformOutput', false);
data = vertcat(cells{:});
ds = cell2dataset(data,  'VarNames',{'duration','key','loadness', 'mode', 'mode_confidence', 'tempo', 'time_signature','time_signature_confidence', 'song_hotness', 'danceability', 'energy', 'year', 'title', 'artist_name', 'artist_hotness', 'artist_familiarity' })


% pie chart

 s = size(ds.mode);
 pie([sum(ds.mode), s(1,1) - sum(ds.mode)])

%  group stats
grpstats(wy, 'year', {'mean', 'max'}, 'DataVars', 'duration')

 