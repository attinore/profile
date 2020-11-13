require 'sqlite3'
db = SQLite3::Database.new("lib/db/jukebox.sqlite")

def detailed_tracks(db)
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
  stats = db.execute(%(
    SELECT g.name, COUNT(t.id), ROUND(AVG(milliseconds) / 60000, 2)
    FROM tracks t
    JOIN genres g ON g.id = t.genre_id
    WHERE g.name = "#{genre_name}"
    )).flatten
  return {
    category: stats[0],
    number_of_songs: stats[1],
    avg_length: stats[2]
  }
end

def top_five_artists(db, genre_name)
  top = db.execute(%(
    SELECT artists.id, artists.name, COUNT(tracks.id) AS track_count
    FROM tracks
    JOIN albums ON albums.id = tracks.album_id
    JOIN artists ON artists.id = albums.artist_id
    JOIN genres ON genres.id = tracks.genre_id
    WHERE genres.name = "#{genre_name}"
    GROUP BY artists.id
    ORDER BY track_count DESC
    LIMIT 5
    ))
  # TODO: return list of top 5 artists with the most songs for a given genre.
end
