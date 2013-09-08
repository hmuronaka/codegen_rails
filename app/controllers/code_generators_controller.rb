#require 'CppGenerator.rb'
#require 'HeaderGenerator.rb'
#require 'IniGenerator.rb'

class CodeGeneratorsController < ApplicationController
  def generate2
    @res = {type: :yaml,
     from_code: "" 
    }

    self_path = File.dirname(File.expand_path(__FILE__))

    @res[:from_code] = File.read((Pathname.new(self_path) + './def.ini.yml').to_s)

    if params[:res] 
      @res[:type] = params[:res][:type]
      @res[:from_code] = params[:res][:from_code]
      gen = CodegenLib::HeaderGenerator.new
      yaml = YAML.load(params[:res][:from_code].gsub(/\r\n/, "\n" ))
      @res[:to_code_1] = gen.generate("test", yaml)

      gen = CodegenLib::CppGenerator.new
      yaml = YAML.load(params[:res][:from_code].gsub(/\r\n/, "\n" ))
      @res[:to_code_2] = gen.generate("test", yaml)

      gen = CodegenLib::IniGenerator.new
      yaml = YAML.load(params[:res][:from_code].gsub(/\r\n/, "\n" ))
      @res[:to_code_3] = gen.generate(yaml)

    end

    respond_to do |format|
      format.html
    end
  end

  def index
    @generator_infos = GeneratorInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @generator_infos }
    end
  end

  def generate
    @generator_info = GeneratorInfo.find_by_from_and_to(params[:from],params[:to])
    @res = {type: :yaml,
     from_code: "" 
    }

    self_path = File.dirname(File.expand_path(__FILE__))

    @res[:from_code] = File.read((Pathname.new(self_path) + './def.ini.yml').to_s)

    if params[:res] 
      @res[:type] = params[:res][:type]
      @res[:from_code] = params[:res][:from_code]

      req = { from_code: params[:res][:from_code].gsub(/\r\n/, "\n") }

      namespace_name = "CodegenLib::"
      namespace_name << "#{params[:from].capitalize}" if params[:from]
      namespace_name << "To#{params[:to].capitalize}" if params[:to]

      generator_class_name = "#{namespace_name}::Generator" 
      clazz = generator_class_name.classify.constantize
      #clazz = Object.const_get("CodegenLib::YamlToIni::Generator")

      #generator = CodegenLib::YamlToIni::Generator.new(req)
      generator = clazz.new(req)
      to_codes = generator.generate
      to_codes.each_with_index do |code,i|
        @res[("to_code_" + (i + 1).to_s).to_sym] = code
      end

    end

    respond_to do |format|
      format.html
    end
  end
end
