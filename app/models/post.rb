class Post < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :title, length: { maximum: 30 }
    validates :body, length: { maximum: 70 }

    belongs_to :user


end
