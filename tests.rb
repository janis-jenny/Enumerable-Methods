require_relative 'main.rb'

puts '1.--------my_each--------'
%w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend } 
%w[Sharon Leo Leila Brian Arun].each { |friend| puts friend } 

p %w[Sharon Leo Leila Brian Arun].my_each 
p %w[Sharon Leo Leila Brian Arun].each 
