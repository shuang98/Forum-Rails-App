class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user

  def self.search(search)
  	if search
  		where(title: search).all
    else
    	all
  	end
  end
end
