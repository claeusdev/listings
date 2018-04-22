class Item < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader
  extend FriendlyId
  friendly_id :name, use: :slugged
end
