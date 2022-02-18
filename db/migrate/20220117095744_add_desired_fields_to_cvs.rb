class AddDesiredFieldsToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :internship, :boolean, default: false
    add_column :cvs, :temporary_contract, :boolean, default: false
    add_column :cvs, :permanent_contract, :boolean, default: false
    add_column :cvs, :freelance, :boolean, default: false
    add_column :cvs, :part_time, :boolean, default: false
    add_column :cvs, :full_time, :boolean, default: false
    add_column :cvs, :in_person, :boolean, default: false
    add_column :cvs, :remote_work, :boolean, default: false
    add_column :cvs, :relocate, :boolean, default: false
    add_column :cvs, :notice_period, :integer, default: 0
    add_monetize :cvs, :expected_salary
  end
end
