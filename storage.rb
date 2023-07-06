require 'pry'
require 'json'
class Storage
  def read_file(file_name)
    result = File.read(file_name)
    JSON.parse(result, symbolize_names: true)
  end

  def write_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end
end
