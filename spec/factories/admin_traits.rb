FactoryBot.define do
  factory :admin_trait, class: 'Admin::Trait' do
    name "MyString"
    is_recruiter false
    description "MyText"
  end
end
