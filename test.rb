require "./checker.rb"

def activate_count_words_test
    current_path = File.dirname(__FILE__)
    text = File.new(current_path + "/война_и_мир.txt")
    phrase = text.read
    words = count_words(phrase)
    puts "Количество слов в фразе = #{words.size}"
end


beginning_time = Time.now
 activate_count_words_test
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)} seconds"
