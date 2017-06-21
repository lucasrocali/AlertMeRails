class Location < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id,:lat, :lon

  def as_json(options = { })
  	super((options || { }).merge({
        :methods => [:user]
    }))
	end
end
