class AddBodyToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :body, :text
  end
end
