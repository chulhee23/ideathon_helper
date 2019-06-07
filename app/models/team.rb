class Team < ApplicationRecord
    mount_uploaders :avatars, AvatarUploader
    serialize :avatars, JSON

    def short_title
        if (self.title.length > 20)
            return self.title[0..20]+'...간략히'
        else
            return self.title
        end
    end
end
