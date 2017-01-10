module Coconut

  class CLI < Thor

    desc "install", "install the coconut on the local enviroment"
    def install
      Coconut::Global.install
      # Commands::Install.new.start
    end

    desc "init", "init a folder with a coconut instance"
    def init
      App.current.init
      # Generators::InitFile.start
    end

    desc "fetch", "fetch the config files from a server"
    def fetch(customer)
      Server.from(customer: customer).fetch
      # Commands::Fetch.new(customer: customer).start
    end

    desc "swap", "swap the config files from a server"
    def swap(customer)
      App.current.swap(customer: customer)
      # Commands::Swap.new(customer: customer).start
    end

  end

end
