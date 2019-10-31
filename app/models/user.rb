class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  # def slug
  #   self.username.gsub(' ', '-').downcase
  # end

 def self.find_by_slug(slug)
   self.all.find{ |user| user.slug == slug}
 end
  # def self.find_by_slug(slug)
  #   User.all.find{|username| username.slug == slug}
  # end
end
