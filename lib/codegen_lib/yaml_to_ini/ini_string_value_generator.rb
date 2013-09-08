# require 'IniValueGenerator'

module CodegenLib::YamlToIni

  class IniStringValueGenerator < IniValueGenerator
  
    def generate(value_def)
      result = <<STR
#{value_def['attr']}=
STR
      result.chomp
    end
  
  end
  
end
