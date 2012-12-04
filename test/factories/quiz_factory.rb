FactoryGirl.define do
  factory :quiz do
    association :owner, factory: :editor
  end
end
