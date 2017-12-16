class CreateEncounters < ActiveRecord::Migration[5.1]
  def change
    create_table :encounters do |t|
      t.string :patientname
      t.string :workername
      t.text :assessment
      t.date :meetdate

      t.timestamps
    end
  end
end
