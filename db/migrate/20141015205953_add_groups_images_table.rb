class AddGroupsImagesTable < ActiveRecord::Migration
  def change
    create_table :groups_images do |t|
      t.references :group
      t.references :image, index: true
      t.timestamps
    end


  end
end
