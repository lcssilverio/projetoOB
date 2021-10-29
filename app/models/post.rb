class Post < ApplicationRecord
  validates :titulo, :texto, :autor, presence: true

  has_many :comments, as: :commentable

  has_and_belongs_to_many :tags
end
