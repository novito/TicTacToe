FactoryGirl.define do
  factory :player do
    name 'Tony Soprano'

    initialize_with { new(name) }
  end
end
