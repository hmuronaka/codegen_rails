#require 'yaml'
#require 'IniCommentGenerator.rb'

module CodegenLib::YamlToIni

  class IniValueGenerator
  
    include IniCommentGenerator
  
    def initialize(env)
      @env = env
    end
  
    def generate(value_def)
    end
  end
  
end
