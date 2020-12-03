require 'active_support'
require 'active_support/core_ext/object/blank'

module AddUpExpenseReport

  def self.perform(args:)
    input_file = args[0]

    raise 'Input file not supplied' if input_file.blank?
    raise "File doesn't exist" if !File.exist?(input_file)

    numbers = File.readlines(input_file, chomp: true)
      .map(&:strip)
      .compact
      .map(&:to_i)

    candidates = []

    numbers.each do |first|
      second, *extra = numbers.select do |sample|
        sum = first + sample

        # Debug line!
        # puts "#{first} + #{sample} = #{sum}"

        sum == 2020
      end

      raise "Found more than one number that sums to 2020 with #{first}" if extra.present?

      if second.present?
        # puts "The first number is '#{first}'\nThe second number is '#{second}'\nTheir product is '#{first * second}'."
        candidates << [first, second]
      end
    end

    if candidates.blank?
      warn "Failed to find any numbers in #{input_file} which sum to 2020."
      exit 1
    end

    if candidates.length == 1
      puts 'Got the expected number of pairs.'
      puts "The first number is '#{first}'\nThe second number is '#{second}'\nTheir product is '#{first * second}'."
    end

    if candidates.length > 1
      puts 'Got more than the expected number of pairs.'
      puts 'Here are all the candidates:'
      candidates.each do |(first, second)|
        puts "#{first} + #{second} = #{first + second}"
        puts "#{first} * #{second} = #{first * second}"
        puts '-----------'
      end
    end
  end

end

AddUpExpenseReport.perform(args: ARGV)
