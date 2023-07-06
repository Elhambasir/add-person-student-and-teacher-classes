require_relative 'storage'

class StorageHandler
  def initialize(storage)
    @storage = storage
  end

  def save_data(file_name, data)
    @storage.write_file(file_name, data)
  end

  def load_data(file_name)
    @storage.read_file(file_name)
  end
end
