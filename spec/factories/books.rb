FactoryBot.define do
  factory :book do
    presence_id { 1 }
    mood_id { 1 }
    body_temperature_id { 1 }
    sleep_id { 1 }
    comment1 { "元気です" }
    reason_id { 1 }
    period_id { 1 }
    comment2 { "特になし" }
    association :user
  end
end