require 'IniValueGenerator.rb'

module CodegenLib

  class IniIntValueGenerator < IniValueGenerator
  
    def generate(value_def)
      result = <<STR
#{value_def['attr']}=
STR
      result.chomp
    end
  
  end
  
end
