# frozen_string_literal: true
require 'optparse'
require 'json'

# Reading the from the file JSON
options = {}
OptionParser.new do |opt|
  opt.on('--file-path PATH') { |o| options[:file_path] = o }
end.parse!

file = File.read(options[:file_path])
data_hash = JSON.parse(file)

# Arrays storing s3 ids
@non_private_acl = []
@asterick_in_policy = []

# a. Acl is not private
def find_vulnerable_acl(hash)
  hash['aws_s3_bucket'].each do |bucket|
    @non_private_acl.push(bucket['id']) unless bucket['config']['acl'] == 'private'
  end
end

# b. Bucket policy has Principal = “*”
def find_asterick(hash)
  hash['aws_s3_bucket_policy'].each do |bucket|
    policy = JSON.parse(bucket['config']['policy'])
    @asterick_in_policy.push(bucket['id']) if policy['Statement'].first['Principal'] == '*'
  end
end

find_vulnerable_acl(data_hash)
puts("\nBucket IDs where Acl is not private")
puts(@non_private_acl)
find_asterick(data_hash)

puts("\nBucket IDs where policy has Principal = '*'")
puts(@asterick_in_policy)

