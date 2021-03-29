class Mood < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ご機嫌です' },
    { id: 2, name: 'いつも通り' },
    { id: 3, name: 'ご機嫌ななめ' },
  ]
  include ActiveHash::Associations
  has_many :books
end