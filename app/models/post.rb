class Post < ApplicationRecord
  belongs_to :user

  validates :name, :instrument, :genre, presence: true

end
