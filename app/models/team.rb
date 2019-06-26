class Team < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :users, dependent: :nullify
    mount_uploaders :avatars, AvatarUploader
    serialize :avatars, JSON
    
    #vote
    has_many :votes, dependent: :destroy
    has_many :votants, through: :votes, source: :user
    def short_name
        if self.team_name.length > 9
            return self.team_name[0..8]+'..'
        else
            return self.team_name
        end

    end
    def short_title
        if (self.title.length > 11)
            return self.title[0..11]+'...'
        else
            return self.title
        end
    end
end
