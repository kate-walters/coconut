class Configuration

  YML_PATH = ".coconut"

  attr_accessor :config

  def initialize
    @config = YAML.load_file(YML_PATH)
  end

  def server
    config['server']
  end

  def local
    config['local']
  end

  def self.user_home_path
    return ENV['HOME']
  end

  def self.config_folder_path
    "#{user_home_path}/.coconut"
  end

  def self.customers_folder
    "#{config_folder_path}/customers/"
  end

end
