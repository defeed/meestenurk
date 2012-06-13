class CreateBrandTranslations < ActiveRecord::Migration
  def up
    Brand.create_translation_table!({
      :description  => :text
    }, {
      :migrate_data => true
    })
  end

  def down
    Brand.drop_translation_table! :migrate_data => true
  end
end
