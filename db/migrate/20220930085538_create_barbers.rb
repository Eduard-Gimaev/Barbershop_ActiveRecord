class CreateBarbers < ActiveRecord::Migration[7.0]
  def change
    create_table :Barbers do |t|
      t.string :barbername
    end
    Barber.create :barbername => 'Tony'
    Barber.create :barbername => 'Jessie'
    Barber.create :barbername => 'Mark'
    Barber.create :barbername => 'David'
    Barber.create :barbername => 'Greg'
  end
end