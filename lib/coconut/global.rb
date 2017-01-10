module Coconut

  class Global

    def self.install
      p 'Creating config folder...'
      configure.config_folder.install
    end

    private

    def configure
      Configuration.instance
    end

  end

end
