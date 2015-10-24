function o = data_create(filename)
data = HDF5_Song_File_Reader(filename);
o = [data.get_artist_longitude data.get_artist_latitude data.get_artist_location];