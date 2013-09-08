class CreateGeneratorInfos < ActiveRecord::Migration
  def change
    create_table :generator_infos do |t|
      t.string :name
      t.string :description
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
