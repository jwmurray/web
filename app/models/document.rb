class Document < ActiveRecord::Base
  has_many :bylines
  has_many :authors, :through => :bylines
end
