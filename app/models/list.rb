class List < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
