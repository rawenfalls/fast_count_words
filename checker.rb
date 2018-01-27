def check_nil
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

def check_words(entered_words, words )
  ignored_words = ["на","под","за","из","по","об","над","около","при","перед","через","от","но","хотя","чтобы","зато","как","да","или","либо"]
  botw=0
  eotw=0
  word=""
  for i in 1..entered_words.size
    if (entered_words[i] == " ") || (entered_words[i] == ",") || (entered_words[i] == ".") || (entered_words[i] == "?") || (entered_words[i] == "!")
      botw=eotw
      eotw=i
      loop do
        word+= entered_words[botw]
        botw+=1
        break if botw==eotw
      end
      word.strip!
      words << "#{word}"if word.size >=2
      word.clear
    end
  end
  ignored_words.each { |ignored_word| words.delete_if{ |word| word =~ /^#{ignored_word}$/i}}
end
