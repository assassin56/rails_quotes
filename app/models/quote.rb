class Quote < ApplicationRecord
  validates_presence_of :author
  validates_presence_of :quote
  scope :search_author, -> (author) {where(author: author)}

  def self.search(srch_value)
      search_author(srch_value) 
  end


end