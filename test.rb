require "./checker.rb"
require "benchmark"

def activate_count_words_test
    current_path = File.dirname(__FILE__)
    text = File.new(current_path + "/война_и_мир.txt")
    phrase = text.read
    words = count_words(phrase)
    puts "Количество слов в фразе = #{words.size}"
end

Benchmark.bm(7) do |x|
    x.report { activate_count_words_test }
end
