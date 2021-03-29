class Presence < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '出席します！！' },
    { id: 2, name: '欠席します' },
  ]
  include ActiveHash::Associations
  has_many :books
end
