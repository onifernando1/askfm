class Post < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :title, length: { maximum: 10 }
    validates :body, length: { maximum: 70 }

    belongs_to :user


end
