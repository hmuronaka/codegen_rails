require 'CppGenerator.rb'
require 'HeaderGenerator.rb'

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
      gen = CodegenLib::HeaderGenerator.new
      logger.info params[:res][:from_code]
      yaml = YAML.load(params[:res][:from_code].gsub(/\r\n/, "\n" ))
      @res[:to_code] = gen.generate("test", yaml)
    end

    respond_to do |format|
      format.html
    end
  end
end
