class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :place
      t.integer :company_id

      t.timestamps
    end
  end
end
