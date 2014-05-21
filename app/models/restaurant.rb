class Restaurant < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { scope: :address, message: "already exists at this location" }
	validates :address, presence: true, length: { minimum: 3 }
	validates :cuisine, presence: true

	has_many :reviews
end
