class Quote < ApplicationRecord
  validates_presence_of :author
  validates_presence_of :quote
end