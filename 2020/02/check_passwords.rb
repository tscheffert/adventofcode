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

  FIRST_REGEX = /\A(?<minimum>\d{1,2})-(?<maximum>\d{1,2})\ (?<given_letter>[a-z]):\ (?<password>[a-z]+?)\z/

  def self.validate_password(lines:)
    puts "Found #{lines.length} password-with-policy lines"
    failed_to_match = []
    passwords_with_policies = lines.each_with_object([]) do |line, memo|
      if (m = line.match(FIRST_REGEX))
        memo << {
          minimum:      m.named_captures.fetch('minimum').to_i,
          maximum:      m.named_captures.fetch('maximum').to_i,
          given_letter: m.named_captures.fetch('given_letter'),
          password:     m.named_captures.fetch('password')
        }
      else
        failed_to_match << line
      end
    end

    if failed_to_match.present?
      warn "Lines that didn't match:"
      failed_to_match.each do |failed_line|
        warn failed_line
      end

      exit 1
    else
      puts 'Every line matched'
    end

    valid_passwords = passwords_with_policies.select do |pwp|
      given_letter_count = pwp[:password].count(pwp[:given_letter])
      pwp[:minimum] <= given_letter_count &&
        given_letter_count <= pwp[:maximum]
    end

    puts "#{valid_passwords.length} passwords are valid"
  end

end

CheckPasswords.perform(args: ARGV)
