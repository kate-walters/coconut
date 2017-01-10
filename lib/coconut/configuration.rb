class Configuration
  include Singleton

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

  def customer_address(customer:)
    server['customers'][customer]['address']
  end

  def home_folder
    return ENV['HOME']
  end

  def config_folder
    Coconut::ConfigFolder.new
  end

  def share_folder
    server['shared_folder']
  end

  def ssh_user
    server['ssh_user']
  end

  def config_files
    local['config_files']
  end

  def switchable_files
    config_files.select { |key, value| value['swap'] }
  end

end
