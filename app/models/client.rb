class Client < ApplicationRecord
    has_many :gyms 
    has_many :memberships, through: :gyms,  dependent: :destroy
    validates :name, presence: true
    validates :age, presence: true
    
    
end
