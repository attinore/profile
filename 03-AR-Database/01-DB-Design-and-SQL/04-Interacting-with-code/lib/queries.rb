require 'sqlite3'
db = SQLite3::Database.new("lib/db/jukebox.sqlite")

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  results = db.execute("SELECT COUNT(*) FROM artists")
  ingeter = results.flatten
  return ingeter[0]
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  results = db.execute("SELECT COUNT(*) FROM #{table_name}")
  ingeter = results.flatten
  return ingeter[0]
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  results = db.execute("SELECT name FROM artists a ORDER BY a.name ASC")
  return results.flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names
  results = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%'")
  return results.flatten
end

def long_tracks(db, min)
  # TODO: return an array of tracks' names verifying:
  # duration > min_length (minutes) sorted by length (ascending)
  results = db.execute("SELECT name FROM tracks t WHERE milliseconds > #{min * 60_000} ORDER BY t.milliseconds ASC")
  return results.flatten
end
