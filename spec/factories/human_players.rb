FactoryGirl.define do
  factory :human_player do
    name 'Johnny Cash'

    initialize_with { new(name) }
  end
end
