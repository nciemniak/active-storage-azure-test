class CreateTranscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :transcriptions do |t|

      t.timestamps
    end
  end
end
