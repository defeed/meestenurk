class CreateAdminUser < ActiveRecord::Migration
  def up
    User.create(:name => 'admin', :password => 'admin', :password_confirmation => 'admin')
  end

  def down
  end
end
