class CreateBarbers < ActiveRecord::Migration[7.0]
  def change
    create_table :Barbers do |t|
      t.string :name
    end
    Barbers.create :name => 'Tony'
    Barbers.create :name => 'Jessie'
    Barbers.create :name => 'Mark'
    Barbers.create :name => 'David'
  end
end
