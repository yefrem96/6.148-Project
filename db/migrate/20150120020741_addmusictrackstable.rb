class Addmusictrackstable < ActiveRecord::Migration
  def change
  	create_table "musictracks", force: true do |t|
    t.has_attached_file :audio
    t.integer :user_id
  end
  end
end
