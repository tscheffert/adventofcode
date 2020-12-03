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

    raise "Input file didn't have any numbers" if numbers.empty?

    find_two(numbers: numbers)

    find_three(numbers: numbers)
  end

  def self.find_two(numbers:)
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

    candidates = candidates.map(&:sort).uniq

    if candidates.blank?
      warn 'Failed to find any numbers from input file which sum to 2020.'
      exit 1
    end

    if candidates.length == 1
      first, second = candidates.flatten
      puts 'Got the expected number of pairs.'
      puts "#{first} + #{second} = #{first + second}"
      puts "#{first} * #{second} = #{first * second}"
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

  def self.find_three(numbers:)
    candidates = []

    numbers.each do |first|
      numbers.each do |second|
        third, *extra = numbers.select { |sample| (first + second + sample) == 2020 }

        raise "Found more than one number that sums to 2020 with #{first} and #{second}" if extra.present?

        candidates << [first, second, third] if third.present?
      end
    end

    candidates = candidates.map(&:sort).uniq

    if candidates.blank?
      warn 'Failed to find any trios of numbers from input file which sum to 2020.'
      exit 1
    end

    if candidates.length == 1
      first, second, third = candidates.flatten
      puts 'Got the expected number of trios.'
      puts "#{first} + #{second} + #{third} = #{first + second + third}"
      puts "#{first} * #{second} * #{third} = #{first * second * third}"
    end

    if candidates.length > 1
      puts 'Got more than the expected number of trios.'
      puts 'Here are all the candidates:'
      candidates.each do |(first, second, third)|
        puts "#{first} + #{second} + #{third} = #{first + second + third}"
        puts "#{first} * #{second} * #{third} = #{first * second * third}"
        puts '-----------'
      end
    end
  end

end

AddUpExpenseReport.perform(args: ARGV)
