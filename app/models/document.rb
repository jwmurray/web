class Document < ActiveRecord::Base
  has_many :authors
  has_many :documents, :through => :authors
end
