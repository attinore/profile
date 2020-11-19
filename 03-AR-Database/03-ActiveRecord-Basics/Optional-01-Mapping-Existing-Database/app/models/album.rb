class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks

  validates :title, :artist, presence: true
end



# CREATE TABLE IF NOT EXISTS "albums" (
#   `id`  INTEGER NOT NULL,
#   `title` NVARCHAR(160) NOT NULL,
#   `artist_id` INTEGER NOT NULL,
#   PRIMARY KEY(id)
# );

# CREATE TABLE IF NOT EXISTS "artists" (
#   `id`  INTEGER NOT NULL,
#   `name`  NVARCHAR(120),
#   PRIMARY KEY(id)
# );


# CREATE TABLE IF NOT EXISTS "genres" (
#   `id`  INTEGER NOT NULL,
#   `name`  NVARCHAR(120),
#   PRIMARY KEY(id)
# );


# CREATE TABLE IF NOT EXISTS "media_types" (
#   `id`  INTEGER NOT NULL,
#   `name`  NVARCHAR(120),
#   PRIMARY KEY(id)
# );


# CREATE TABLE IF NOT EXISTS "tracks" (
#   `id`  INTEGER NOT NULL,
#   `album_id`  INTEGER,
#   `media_type_id` INTEGER NOT NULL,
#   `genre_id`  INTEGER,
#   `name`  NVARCHAR(200) NOT NULL,
#   `composer`  NVARCHAR(220),
#   `milliseconds`  INTEGER NOT NULL,
#   `bytes` INTEGER,
#   `unit_price`  NUMERIC(10,2) NOT NULL,
#   PRIMARY KEY(id)
# );
