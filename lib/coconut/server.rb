module Coconut

  class Server

    attr_reader :customer

    def self.from(customer:)
      Server.new(customer: customer)
    end

    def fetch
      puts "Fetching config files from #{customer}"
      Configuration.intance.config_files.each do |file, config|
        fetch_file(file)
        convert_file(file) if file.end_with?('.yml')
      end
    end

    private

    def initialize(customer:)
      @customer = customer
    end

    def address
      @address ||= Configuration.instance.customer_address(customer: customer)
    end

    def fetch_file(file)
      puts "Fetching #{file} ..."
      origin = "#{Configuration.instance.share_folder}/#{file}"
      command.fetch(address, origin, server_file(file))
    end

    def command
      @command ||= CommandInterface.new
    end

    def server_file(file)
      "#{Configuration.customers_folder}/#{file}.#{customer}"
    end

    def convert_file(file)
      path = server_file(file)
      content = read_yml(path)
      yaml = { 'development' => content }
      write_yml(path, yaml.to_yaml)
    end

    def read_yml(path)
      YAML.load_file(path)[environment]
    end

    def write_yml(path, content)
      File.open(path, 'w') { |file| file.write(content) }
    end

    def environment
      Configuration.intance.server['customers'][customer]['environment'] || 'integration'
    end

  end

end
