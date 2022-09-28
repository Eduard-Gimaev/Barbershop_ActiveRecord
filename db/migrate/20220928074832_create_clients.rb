class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :Clients do |t|
      t.string :name
      t.string :phone
      t.string :datestamp
      t.string :barber
      t.string :color
      
    end
    

  end
end
