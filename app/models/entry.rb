class Entry < ActiveRecord::Base
  acts_as_taggable
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :collection
  validates :collection, presence: true
end
