class Team < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
end
