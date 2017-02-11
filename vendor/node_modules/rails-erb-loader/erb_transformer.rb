delimiter = ARGV[0]
engine = ARGV[1]
handler = case engine
  when 'erubis'
    require 'erubis'
    Erubis::Eruby
  when 'erb'
    require 'erb'
    ERB
  else raise "Unknown templating engine `#{engine}`"
end

puts "#{delimiter}#{handler.new(STDIN.read).result}#{delimiter}"
