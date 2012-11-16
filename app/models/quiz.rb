class Quiz < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :questions,
    dependent: :nullify

  attr_accessible :owner_id, :featured, :introduction, :name
end
