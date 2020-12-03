require 'active_support'
require 'active_support/core_ext/object/blank'

module AddUpExpenseReport

  def self.perform(args:)
    input_file = args[0]

    raise "Input file not supplied" if input_file.blank?
    raise "File doesn't exist" if !File.exist?(input_file)

    numbers = File.readlines(input_file, chomp: true).map(&:strip).compact.map(&:to_i)

    numbers.each do |first|
      second, *extra = numbers.select do |sample|
        sum = first + sample

        # Debug line!
        # puts "#{first} + #{sample} = #{sum}"

        sum == 2020
      end

      if extra.present?
        raise "Found more than one number that sums to 2020 with #{first}"
      end

      if second.present?
        puts "The first number is '#{first}'\nThe second number is '#{second}'\nTheir product is '#{first * second}'."
        exit 0
      end
    end

  end

end

AddUpExpenseReport.perform(args: ARGV)
