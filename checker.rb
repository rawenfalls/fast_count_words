def activate_count_words
  loop do
    check_nil
    check_answer
  end
end

def check_nil
  puts "введите фразу"
  loop do
    entered_words = gets.chomp.strip
    if entered_words==""
      puts "!!!НЕКОРЕКТНЫЙ ВВОД!!!"
      puts "попробуйте ещё раз"
    else
      return count_words(entered_words + " ")
    end
  end
end

# def check_nil
#   current_path = File.dirname(__FILE__)
#   text = File.new(current_path + "/война_и_мир.txt")
#   puts "введите фразу"
#   loop do
#     entered_words = text.read
#     if entered_words==""
#       puts "!!!НЕКОРЕКТНЫЙ ВВОД!!!"
#       puts "попробуйте ещё раз"
#     else
#       return count_words(entered_words + " ")
#     end
#   end
# end

def check_answer
  quit = false
  puts "Повторить? (y/n)"
  until quit
    answer = gets.chomp.downcase
    yes_or_no = [["y", "yes", "д", "да"], ["n", "no", "н", "нет"]]
    if yes_or_no.assoc("y").include?(answer)
      quit = true
    elsif yes_or_no.assoc("n").include?(answer)
      abort
    else
      puts "!!!НЕКОРЕКТНЫЙ ВВОД!!!"
      puts "попробуйте ещё раз"
    end
  end
end

def count_words(text)
  word=""
  words=[]
  text.each_char do |i|
    if " ,.!?[]-–()»«;:…".include?(i)
      words << word.strip unless ignored_word?(word)
      word=""
    else
      word+=i
    end
  end
  puts "кол-во слов в фразе = #{words.size}", words
end

def ignored_word?(word)
  ignored_words = %w[на под за из по об над около при перед через от но хотя чтобы зато как да или либо]
  one_letter_words = %w[а б в ж и к о с у я]
  case
    when word.strip == ""
      return true
    when word.nil?
    when word.to_i != 0
    when word.size == 1
      !one_letter_words.any? { |letter| word.casecmp?(letter) }
    else ignored_words.any? { |ignored_word| word.casecmp?(ignored_word) }
  end
end

