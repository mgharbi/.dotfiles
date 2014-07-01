#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__),"src")

require "ProjectTemplate"

current_dir = Pathname(Dir.pwd)
pm = ProjectTemplate.new(current_dir)


if ARGV.size == 0
  puts "usage project_template [type] -- no file created"
  exit
end

project_type = ARGV[0]

if project_type == "cpp"
  puts 'Initializing a cpp project'
  pm.cpp_template
  exit
end

 
 
