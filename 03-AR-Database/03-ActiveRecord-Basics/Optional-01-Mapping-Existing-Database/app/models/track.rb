class Track < ActiveRecord::Base
  belongs_to :album
  belongs_to :genre
  belongs_to :media_type

  # validates :name, :composer, :milliseconds, :bytes, :unit_price
end



# CREATE TABLE IF NOT EXISTS "tracks" (
#   `id`  INTEGER NOT NULL,
#   `
#   `name`  NVARCHAR(200) NOT NULL,
#   `composer`  NVARCHAR(220),
#   `milliseconds`  INTEGER NOT NULL,
#   `bytes` INTEGER,
#   `unit_price`  NUMERIC(10,2) NOT NULL,
#   PRIMARY KEY(id)
# );
