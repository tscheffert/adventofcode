require 'active_support'
require 'active_support/core_ext/object/blank'

module AddUpExpenseReport

  def self.perform(args:)
    input_file = args[0]

    raise "Input file not supplied" if input_file.blank?
    raise "File doesn't exist" if !File.exist?(input_file)

  end

end

AddUpExpenseReport.perform(args: ARGV)
