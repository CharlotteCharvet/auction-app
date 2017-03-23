class Item < ApplicationRecord
  include PgSearch

  pg_search_scope :similar_to, 
                  :against => [:title, :estimation]
                  #:using => :trigram
                  
  default_scope { order('created_at DESC') }

  has_many :bids
  belongs_to :auction
  serialize :photo, Array
  mount_uploaders :photos , PhotoUploader

end
