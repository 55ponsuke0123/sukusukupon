class Reason < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '都合欠です' },
    { id: 2, name: '病欠です' },
  ]
  include ActiveHash::Associations
  has_many :books
end