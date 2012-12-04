FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    display_name 'Regular User Name'

    factory :editor do
      email 'editor@example.com'
      display_name 'Editor Name'
      editor true
    end

    factory :admin do
      email 'admin@example.com'
      display_name 'Admin Name'
      admin true
    end
  end

end
