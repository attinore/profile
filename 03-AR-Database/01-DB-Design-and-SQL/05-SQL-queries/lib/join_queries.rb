require 'sqlite3'
db = SQLite3::Database.new("lib/db/jukebox.sqlite")

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  # track title, track album name,track’s artist name.
  # artist name and album titles.
  sql_query = <<-SQL
    SELECT t.name, al.title, ar.name
    FROM tracks t
    JOIN albums al ON al.id = t.album_id
    JOIN artists ar ON ar.id = al.artist_id
  SQL
  results = db.execute(sql_query)
  return results
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  hash = {}
  category = db.execute("SELECT #{genre_name} FROM genres")
  p category

  number_of_tracks = <<-SQL
  SELECT COUNT(tracks.name) FROM tracks t
  JOIN genres g ON g.id = t.genre_id
  SQL
  number_of_songs = db.execute(number_of_tracks)
  p category

  avg_millisecond = db.execute("SELECT AVG(milliseond) FROM tracks")
  avg_length = avg_millisecond * 60_000
  p avg_length
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
end
