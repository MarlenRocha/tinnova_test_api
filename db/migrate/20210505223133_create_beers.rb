class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :beer_id
      t.string :seen_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
