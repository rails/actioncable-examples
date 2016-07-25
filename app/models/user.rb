class User < ApplicationRecord
  has_many :messages
  has_many :rooms
end
