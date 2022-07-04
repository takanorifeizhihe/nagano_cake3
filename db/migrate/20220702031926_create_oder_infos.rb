class CreateOderInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_infos do |t|

      t.timestamps
    end
  end
end
