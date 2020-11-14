require 'sqlite3'
DB = SQLite3::Database.new("lib/db/jukebox.sqlite")
def all_artists(db)
  # TODO: use `db` to execute an SQL query against the database to
  rows = DB.execute('SELECT * FROM artists')
end
