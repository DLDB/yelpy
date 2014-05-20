class Restaurant < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { scope: :address, message: "this Restaurant already exists" }
	validates :address, presence: true, length: { minimum: 3 }
	validates :cuisine, presence: true
end
