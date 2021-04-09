FactoryBot.define do
  factory :can do
    active_id      {1}
    place_id       {1}
    set_time_id    {1}
    description    {"hello"}
    association :user

    after(:build) do |can|
      can.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
