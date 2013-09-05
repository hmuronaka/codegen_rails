#require 'yaml'
#require 'CppHelper.rb'
#require 'type_map.rb'

module Codegenlib

  class HeaderValueGenerator
  
    include TypeResolver
    include CppHelper
  
    def initialize(env)
      @env = env
    end
  
    def generate(value_def)
      type = value_def['type'].chomp
      type = resolve_type type
      name = value_def['attr'].chomp
      comment = commentize(value_def['comment'])
      source = ""
      source = comment + "\n" if comment.length > 0
      source << <<STR
#{type} _#{name};
STR
      source.chomp
    end

    def generate_method(value_def)
      type = value_def['type'].chomp
      type = resolve_type type
      attr = value_def['attr'].chomp
      source =<<STR
void set_#{attr}(const #{type}& value) {
  _#{attr} = value;
}

const #{type}& get_#{attr}() const {
  return _#{attr};
}
STR
      source.chomp
    end
  end
  
end
