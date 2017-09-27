require 'tsv'
require 'csv'
require 'yaml'
require 'json'
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    csv = CSV.new(tsv, headers: true, converters: :all, col_sep: "\t")
    @data = csv.to_a.map do |row|
      return_obj = row.to_hash
      return_obj['student_id'] = return_obj['student_id'].to_s
      return_obj
    end
  end

  def to_tsv
    column_names = @data.first.keys
    tsv_string = CSV.generate(col_sep: "\t") do |csv|
      csv << column_names
      @data.each { |x| csv << x.values }
    end
    tsv_string
  end
end
