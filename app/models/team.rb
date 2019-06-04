class Team < ApplicationRecord
    mount_uploaders :avatar, AvatarUploader
    serialize :avatars, JSON
end
