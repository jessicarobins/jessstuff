class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      
      t.column :name, :string
      t.column :default_role_id, :integer
      t.column :domain, :string
      
      
      t.timestamps null: false
    end
    
    add_column :users, :name, :string
    add_column :users, :organization_id, :integer
    
    add_column :projects, :created_by_id, :integer
    
    
    Organization.create!(:name => 'Kit Check',
                          :default_role_id => 1,
                          :domain => "kitcheck.com")
      
    User.all.each do |user|
      user.update!(:organization_id => 1)
    end
    
    
    Project.all.each do |project|
      project.update!(:created_by_id => 1)
    end
      
  end
end
