class Post < ApplicationRecord
  belongs_to :user

  validates :name, :instrument, :genre, :user_id, presence: true

end
