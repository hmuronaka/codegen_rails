#require 'CppGenerator.rb'
#require 'HeaderGenerator.rb'
#require 'IniGenerator.rb'

class CodeGeneratorsController < ApplicationController
  def generate
    @res = {type: :yaml,
     from_code: "" 
    }

    self_path = File.dirname(File.expand_path(__FILE__))

    @res[:from_code] = File.read((Pathname.new(self_path) + './def.ini.yml').to_s)

    if params[:res] 
      @res[:type] = params[:res][:type]
      @res[:from_code] = params[:res][:from_code]
      #gen = CodegenLib::CppGenerator.new
      gen = Codegenlib::HeaderGenerator.new
      yaml = YAML.load(params[:res][:from_code].gsub(/\r\n/, "\n" ))
      @res[:to_code_1] = gen.generate("test", yaml)

      gen = Codegenlib::CppGenerator.new
      yaml = YAML.load(params[:res][:from_code].gsub(/\r\n/, "\n" ))
      @res[:to_code_2] = gen.generate("test", yaml)

      gen = Codegenlib::IniGenerator.new
      yaml = YAML.load(params[:res][:from_code].gsub(/\r\n/, "\n" ))
      @res[:to_code_3] = gen.generate(yaml)



    end

    respond_to do |format|
      format.html
    end
  end
end
