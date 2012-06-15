class CreateDeliveryMethodTranslations < ActiveRecord::Migration
  def up
    DeliveryMethod.create_translation_table!({
      :name  => :string
    }, {
      :migrate_data => true
    })
  end

  def down
    DeliveryMethod.drop_translation_table! :migrate_data => true
  end
end
