module Commands

  class Install

    def start
      p 'Creating config folder...'
      create_config_folder
      create_customers_folder
    end

    private

    def config_folder_path
      "#{user_home_path}/.coconut"
    end

    def user_home_path
      return ENV['HOME']
    end

    def create_config_folder
      create_folder(config_folder_path)
    end

    def create_customers_folder
      create_folder("#{config_folder_path}/customers/")
    end

    def create_folder(path)
      FileUtils.mkdir_p(path) unless File.exist?(path)
    end

  end

end
