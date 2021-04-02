class Book < ApplicationRecord
    belongs_to :user
    
      extend ActiveHash::Associations::ActiveRecordExtensions
      belongs_to :presence
      belongs_to :mood
      belongs_to :body_temperature
      belongs_to :sleep
      belongs_to :reason
      belongs_to :period

      validates :presence_id, presence: true, numericality: { other_than: 0 }
end
    
