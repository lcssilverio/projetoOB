class Post < ApplicationRecord
  validates :titulo, :texto, :autor, presence: true

  has_many :comments, as: :commentable

  belongs_to :tags, optional: true
end
