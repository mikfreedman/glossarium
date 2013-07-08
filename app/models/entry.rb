class Entry < ActiveRecord::Base
  acts_as_taggable
  extend FriendlyId
  friendly_id :name, use: :slugged

end
