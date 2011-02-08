class SignupRequest < ActiveRecord::Migration
  def self.up
    create_table :signup_requests do |t|
      t.string :email
      t.boolean :status
    end
  end

  def self.down
    drop_table
  end
end
