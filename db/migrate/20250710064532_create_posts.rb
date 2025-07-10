class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts, id: :uuid, default: -> { "uuidv7()" } do |t|
      t.text :text
    end
  end
end
