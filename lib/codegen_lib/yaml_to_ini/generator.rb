
module CodegenLib::YamlToIni

  class Generator

    def initialize(request)
      @req = request
    end

    def generate
      from_code = @req[:from_code]

      yaml = YAML.load(from_code)

      generators = [
        CppGenerator.new,
        HeaderGenerator.new,
        IniGenerator.new]

      to_codes = []
      generators.each do |gen|
        to_codes << gen.generate(yaml)
      end

      to_codes
    end
  end
end
