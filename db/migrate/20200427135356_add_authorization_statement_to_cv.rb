class AddAuthorizationStatementToCv < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :authorization_statement, :string, limit: 255
  end
end
