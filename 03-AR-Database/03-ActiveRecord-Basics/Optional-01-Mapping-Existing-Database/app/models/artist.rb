class Artist < ActiveRecord::Base
  has_many :albums

  # validates :name
end


# CREATE TABLE IF NOT EXISTS "artists" (
#   `id`  INTEGER NOT NULL,
#   `name`  NVARCHAR(120),
#   PRIMARY KEY(id)
# )
