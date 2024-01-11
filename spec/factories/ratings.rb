FactoryBot.define do
  factory :rating do
    movie { create(:movie) }
    grade { rand(1..5) }
  end
end
