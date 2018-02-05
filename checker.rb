def activate_count_words
  loop do
    print "Введите фразу: "
    phrase = gets.chomp.strip
    words = count_words(phrase)
    puts "Количество слов в фразе = #{words.size}"
    break unless check_answer
  end
end

def check_answer
  loop do
    print "Повторить? (y/n): "
    answer = gets.chomp.downcase
    case
      when %w[y yes д да].include?(answer)
        return true
      when %w[n no н нет].include?(answer)
        return false
      else
        puts "Некорректный ввод!"
    end
  end
end

def count_words(text)
  word=""
  words=[]
  text.to_s.each_char do |i|
    if " ,.!?[]-–()»«;:…".include?(i)
      words << word.strip unless ignored_word?(word)
      word=""
    else
      word+=i
    end
  end
  words
end

def ignored_word?(word)
  ignored_words = %w[на под за из по об над около при перед через от но хотя чтобы зато как да или либо]
  one_letter_words = %w[а б в ж и к о с у я]
  case
    when word.nil?
    when word.strip == ''
    when word.to_i != 0
    when word.size == 1
      !one_letter_words.any? { |letter| word.casecmp?(letter) }
    else ignored_words.any? { |ignored_word| word.casecmp?(ignored_word) }
  end
end
