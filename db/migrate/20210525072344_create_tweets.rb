class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string  :title,        null: false
      t.integer :risk_id,      null: false
      t.integer :country_id,   null: false
      t.string  :city
      t.text    :block,        null: false
      t.string  :year,         null: false
      t.string  :month,        null: false
      t.integer :day_id,       null: false
      t.text :time     
      t.text    :detail,       null: false
      t.references :user,      null: false, foreign_key: true



      t.timestamps
    end
  end
end
