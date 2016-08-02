class Movie < ActiveRecord::Base
  def self.search(search)
    where("lower(title) || lower(genre) || lower(actors) LIKE ?", "%#{search.downcase}%") 
  end
end
