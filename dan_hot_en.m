function o = dan_hot_en(filename)
data = HDF5_Song_File_Reader(filename);
o = [data.get_danceability data.get_song_hotttnesss data.get_energy];