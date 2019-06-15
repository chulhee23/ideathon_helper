class Team < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :users
    mount_uploaders :avatars, AvatarUploader
    serialize :avatars, JSON
    
    #vote
    has_many :votes
    has_many :votants, through: :votes, source: :user 
    def short_title
        if (self.title.length > 10)
            return self.title[0..10]+'...'
        else
            return self.title
        end
    end
end
