class Guide < ApplicationRecord
  belongs_to :user
  has_many :comments
end
