def check_nil
  puts "введите фразу, для подсчёта кол-во слов"
  loop do
    entered_words = gets.chomp
    if entered_words==""
      puts "!!!НЕКОРЕКТНЫЙ ВВОД!!!"
      puts "введите фразу, для подсчёта кол-во слов"
    else
      return entered_words
    end
  end
end

def check_answer
  quit = false
  puts "если хотите подсчитать кол-во слов в новой фразе введите y, yes, д, да, если хотите закончить программу введите n, no, н, нет"
  until quit
    answer = gets.chomp.downcase
    yes_or_no = [["y", "yes", "д", "да"], ["n", "no", "н", "нет"]]
    if yes_or_no.assoc("y").include?(answer)
      quit = true
    elsif yes_or_no.assoc("n").include?(answer)
      abort
    else
      puts "некоректный ввод, попробуйте ещё раз"
    end
  end
end

def count_words(text)
  word=""
  words=[]
  text.each_char do |i|
    if " ,.!?".include?(i)
      words << word if (word.size > 1) && check_words(word)
      word=""
    else
      word+=i
    end
  end
  words
end

def check_words(word)
  ignored_words = %w[на под за из по об над около при перед через от но хотя чтобы зато как да или либо]
  i = true
  ignored_words.each { |ignored_word| i = false if word.casecmp?(ignored_word)  }
  i
end