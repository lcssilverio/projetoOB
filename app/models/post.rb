class Post < ApplicationRecord
  validates :titulo, :texto, :autor, presence: true

  belongs_to :tags, optional: true
end
