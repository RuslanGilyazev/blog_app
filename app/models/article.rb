class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  belongs_to :user
  accepts_nested_attributes_for :user 
  
  def self.search(search)
    if search
      s = search
      where(title:s)
    else
      all
    end
  end
  
end
