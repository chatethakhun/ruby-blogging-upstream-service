class AddThumbnailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :thumbnail, :string
  end
end
