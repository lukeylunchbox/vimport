class AddUrlToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :url, :text
  end
end
