FactoryBot.define do
  factory :user do
    email { "factory@example.com" }
    password { "bpq349" }
    password_confirmation { "bpq349" }
    child_name {"山本心愛"}
    classroom {"ぞう"} 
    childminder1 {"本村奈緒子"}
  end
end