class AddModeratedToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :moderated, :boolean
  end
end
