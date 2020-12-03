require 'active_support'
require 'active_support/core_ext/object/blank'

module CheckPasswords

  def self.perform(args:)
    input_file = args[0]

    raise 'Input file not supplied' if input_file.blank?
    raise "File doesn't exist" if !File.exist?(input_file)

    password_with_policy_lines = File.readlines(input_file, chomp: true)
      .map(&:strip)
      .compact

    raise "Input file didn't have any password-with-policy lines" if password_with_policy_lines.empty?

    validate_password(lines: password_with_policy_lines)
  end

  def self.validate_password(lines:)
    puts "Found #{lines.length} password-with-policy lines"
  end

end

CheckPasswords.perform(args: ARGV)
