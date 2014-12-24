class AddIsModeratorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_moderator, :boolean, null:false, default:false
  end
end
