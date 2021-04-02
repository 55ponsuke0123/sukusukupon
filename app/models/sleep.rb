class Sleep < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ぐっすり眠れました' },
    { id: 2, name: '少し夜ふかししました' },
    { id: 3, name: '夜中ちょくちょく目が覚めました' },
    { id: 4, name: 'ほとんど寝てないです' },
  ]
  include ActiveHash::Associations
  has_many :books
end