class Post < ApplicationRecord
  belongs_to :user

  validates :name, :instrument, :genre, presence: true
  GENRES = ["Alternative", "Blues", "Country", "Folk", "Jazz", "Mixed", "Pop", "Rock", "Other" ]

end
