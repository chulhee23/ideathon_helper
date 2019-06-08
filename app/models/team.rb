class Team < ApplicationRecord
    has_many :comments, dependent: :destroy
    mount_uploaders :avatars, AvatarUploader
    serialize :avatars, JSON

    def short_title
        if (self.title.length > 18)
            return self.title[0..18]+'...간략히'
        else
            return self.title
        end
    end
end
