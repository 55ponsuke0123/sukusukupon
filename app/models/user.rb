class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze 
         validates :password, 
                    presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }     
         validates :child_name, presence: true, format: { with: /\A[ぁ-ゔァ-ヴー一-龥々]+\z/ }
         validates :classroom, presence: true, format: { with: /\A[ぁ-ゔァ-ヴー一-龥々]+\z/ }
         validates :childminder1, presence: true, format: { with: /\A[ぁ-ゔァ-ヴー一-龥々]+\z/ }
         
       
         has_many :books  
end
