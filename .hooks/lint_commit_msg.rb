# frozen_string_literal: true

require 'fileutils'

def validate_commit_msg
  # Get the current directory
  root_dir = FileUtils.pwd

  # Get the commit file
  commit_file = File.join(root_dir, '.git/COMMIT_EDITMSG')
  commit_message = File.read(commit_file) if File.exist?(commit_file)

  valid_tags = %w[feat fix chore ci docs perf refactor style test]

  # Define a regex pattern
  reg_exp = Regexp.new("(#{valid_tags.join('|')}):\\s*.+")

  if commit_message
    valid = commit_message.match?(reg_exp)

    if valid
      puts '👍 Nice commit message!'
    else
      puts '👎 Bad commit message!'
      puts "Your commit message: '#{commit_message.strip}'"
      puts "The commit message does not follow the required format: 'type: description'"
      puts "Type can be one of the following: #{valid_tags.join(', ')}"
      puts 'Description should be a brief summary of the changes made.'
      exit(1)
    end
  else
    puts 'Commit message file does not exist'
    exit(1)
  end
end

validate_commit_msg
