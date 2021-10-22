class Post < ApplicationRecord
    validates :titulo, :texto, :autor, presence: true

    belongs_to :tema, optional: true
end
