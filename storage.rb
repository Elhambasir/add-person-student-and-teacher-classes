require 'pry'
require 'json'
class Storage
  def read_file(file_name)
    # Handle if file does not exist
    if File.exist?(file_name)
      file = File.read(file_name)
      JSON.parse(file, symbolize_names: true)
    else
      []
    end
  end

  def write_file(file_name, data)
    # Handle if file does not exist
    File.new(file_name, 'w') unless File.exist?(file_name)
    File.write(file_name, JSON.pretty_generate(data))
  end
end

# result = File.read(file_name)
# File.write(file_name, JSON.pretty_generate(data))
#     JSON.parse(result, symbolize_names: true)
