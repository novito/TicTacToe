FactoryGirl.define do
  factory :machine_player do
    name 'Dr Who'

    initialize_with { new(name) }
  end
end
