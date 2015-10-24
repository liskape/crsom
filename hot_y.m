function C = hot_y(filename)
 data = HDF5_Song_File_Reader(filename);
 C = {data.get_duration data.get_key data.get_loudness data.get_mode data.get_mode_confidence data.get_tempo data.get_time_signature data.get_time_signature_confidence data.get_song_hotttnesss data.get_danceability data.get_energy data.get_year data.get_title data.get_artist_name data.get_artist_hotttnesss data.get_artist_familiarity};
end