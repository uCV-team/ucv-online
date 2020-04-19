class AddWebsiteUrlToExperience < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :website_url, :string
  end
end
