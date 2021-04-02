class Period < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '今日だけ' },
    { id: 2, name: '明日まで' },
    { id: 3, name: '明後日まで' },
    { id: 4, name: 'また再度お知らせします' },
  ]
  include ActiveHash::Associations
  has_many :books
end