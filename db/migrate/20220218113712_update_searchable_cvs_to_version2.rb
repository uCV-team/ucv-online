class UpdateSearchableCvsToVersion2 < ActiveRecord::Migration[7.0]
  def change
    update_view :searchable_cvs, version: 2, revert_to_version: 1, materialized: true
  end
end
