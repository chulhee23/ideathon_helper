ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :univ, :email, :captain, :team, :belonging
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  selectable_column
  id_column
  column :email
  column :name
  column :univ
  column :captain
  column :team
  column :created_at
  actions
end

# 필터링
filter :email
filter :created_at
end
