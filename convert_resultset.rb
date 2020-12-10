#!/usr/bin/ruby

require 'json'

def convert_resultset(file_path)
  result = JSON.parse(File.read(file_path))

  result = result['/bin/bash ./codecov']
  result['coverage'].each do |key, value|
    result['coverage'][key] = value.each_with_index.map { |i, v| [v, i] }.to_h
  end

  File.open('./coverage/converted_resultset.json', 'w') { |f| f.write result }
end

convert_resultset(ARGV[0])
