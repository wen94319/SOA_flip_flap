# Module that can be included (mixin) to take and output Yaml data
require 'tsv'
require 'csv'
require 'yaml'
require 'json'
# Module that can be included (mixin) to take and output TSV data
module YmlBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_yaml(yaml)
    @data = YAML.load(yaml)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_yaml
    @data = @data.to_yaml
    @data
  end
end
