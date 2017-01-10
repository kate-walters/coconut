module Coconut

  class ConfigFolder

    CUSTOMER_FOLDER = 'customer'
    COCONUT_FOLDER_NAME = 'coconut'

    attr_reader :path
    attr_reader :customers_path

    def initialize
      @path = "#{configure.home_folder}/.#{COCONUT_FOLDER_NAME}/"
      @customers_path = "#{path}/.#{COCONUT_FOLDER_NAME}/"
    end

    def install
      create_config_folder
      create_customers_folder
    end

    private

    def configure
      Configuration.instance
    end

    def create_config_folder
      create_folder(path)
    end

    def create_customers_folder
      create_folder(customers_path)
    end

    def create_folder(path)
      FileUtils.mkdir_p(path) unless File.exist?(path)
    end

  end

end
