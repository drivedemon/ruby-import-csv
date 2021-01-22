class CreateLogImportFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :log_import_files do |t|
      t.string :file_name

      t.timestamps
    end
  end
end
