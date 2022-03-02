class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, comment: 'ユーザ' do |t|
      t.string :provider, null: false, comment: 'プロバイダ名'
      t.string :uid, null: false, comment: 'ユーザー識別用の文字列'
      t.string :name, null: false, comment: 'GitHubのユーザ名'
      t.string :image_url, null: false, comment: 'GitHubアイコン画像のURL'

      t.timestamps
    end

    add_index :users, %i[provider uid], unique: true
  end
end
