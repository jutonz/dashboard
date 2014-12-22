class FixTypeOfNoteTextField < ActiveRecord::Migration
  def change
    create_table "notes", force: true do |t|
      t.string   "text"
      t.timestamps
    end
  end
end
