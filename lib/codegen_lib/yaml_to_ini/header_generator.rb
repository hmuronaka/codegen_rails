# coding: utf-8
#require 'cpp_helper'
#require 'header_list_value_generator'
#require 'HeaderValueGenerator'
#require 'erb'
#require 'pathname'
#require 'type_map.rb'

module CodegenLib::YamlToIni

  class HeaderGenerator
  
    include CppHelper

    def initialize
      @self_path = File.dirname(File.expand_path(__FILE__))
    end
  
    def generate(yaml)
      env = yaml['env']
      @name = env['name']
      source = ""

      env = yaml['env']
      sections = yaml['sections']
      string_type = TYPE_MAP['string']

      filename = Pathname(@self_path) + './Ini.h.erb'
      erb = ERB.new(File.read(filename.to_s),nil,'-')
      erb.filename = filename.to_s
      erb.result(binding)
    end

    def generate_filename(yaml)
      env = yaml['env']
      name = env['name']
      return "#{name}.h"
    end

    def section_to_s(section)
      unless @section_erb 
        filename = (Pathname(@self_path) + '_Section.h.erb').to_s
        @section_erb = ERB.new(File.read(filename), nil, '-')
        @section_erb.filename = filename
      end
      string_type = TYPE_MAP['string']
      @section_erb.result(binding)
    end

    def class_to_s(sections)
      name = @name
      string_type = TYPE_MAP['string']
      unless @class_erb
        filename = (Pathname(@self_path) + '_Class.h.erb').to_s
        @class_erb = ERB.new(File.read(filename), nil, '-')
        @class_erb.filename = filename
      end
      @class_erb.result(binding)
    end

    def value_to_s(value)
      gen = get_value_generator(value['type'])
      gen.generate(value) if gen
    end

    def value_method_to_s(value)
      gen = get_value_generator(value['type'])
      gen.generate_method(value) if gen
    end


    def get_value_generator(type)
      if type =~ /(.*)_list$/
        return HeaderListValueGenerator.new(@env, $1)
      elsif type == "int" or
            type == "string"
        return HeaderValueGenerator.new(@env)
      end
    end

  end
end

