class Post < ApplicationRecord
    validates :titulo, presence: true
    validates :texto, presence: true
    validates :autor, presence: true

    belongs_to :tema, optional: true
end
