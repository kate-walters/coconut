require 'thor'
require 'thor/group'

module Generators
  class InitFile < Thor::Group
    include Thor::Actions

    desc 'Generate configuration to init a coconut instance on a SQ proyect'

    def self.source_root
      File.dirname(__FILE__) + '/coconut/templates'
    end

    def create_lib_file
      template('coconut.tt', '.coconut')
    end

  end
end
