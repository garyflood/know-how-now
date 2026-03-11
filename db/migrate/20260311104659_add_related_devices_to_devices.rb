class AddRelatedDevicesToDevices < ActiveRecord::Migration[8.1]
  def change
    add_column :devices, :related_devices, :string, array: true, default: []
  end
end
