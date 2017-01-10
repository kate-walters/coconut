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

  def home_folder
    return ENV['HOME']
  end

  def config_folder
    Coconut::ConfigFolder.new
  end

end
