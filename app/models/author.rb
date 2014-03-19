class Author < ActiveRecord::Base
  has_many :bylines
  has_many :documents, :through -> :bylines
end
