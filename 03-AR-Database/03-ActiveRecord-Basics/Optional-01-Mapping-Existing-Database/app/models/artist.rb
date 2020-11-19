class Artist < ActiveRecord::Base
  has_many :albums
  has_many :tracks, through: :albums

  validates :name, presence: true
end


# CREATE TABLE IF NOT EXISTS "artists" (
#   `id`  INTEGER NOT NULL,
#   `name`  NVARCHAR(120),
#   PRIMARY KEY(id)
# )
