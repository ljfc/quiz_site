class Question < ActiveRecord::Base
  belongs_to :quiz

  attr_accessible :text
end
