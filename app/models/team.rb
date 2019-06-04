class Team < ApplicationRecord
<<<<<<< HEAD
    mount_uploader :avatar, AvatarUploader
=======
    mount_uploaders :avatar, AvatarUploader
    serialize :avatars, JSON
>>>>>>> 1e1fa2290e50acd8399f9651b250cd8a592fe6e1
end
