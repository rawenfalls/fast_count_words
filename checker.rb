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
  i=0
  botw=0
  eotw=0
  word=""
  loop do
    if (entered_words[i] == " ") || (entered_words[i] == ",") || (entered_words[i] == ".") || (entered_words[i] == "?") || (entered_words[i] == "!")
      botw=eotw
      eotw=i
      loop do
        word+= entered_words[botw]
        botw+=1
        break if botw==eotw
      end
      word.strip!
      if word.size >=2
      words << "#{word}"
      end
      word.clear
    end
    i+=1
    break if entered_words[i]==nil
  end
  ignored_words.each { |ignored_word| words.delete_if{ |word| word =~ /^#{ignored_word}$/i}}
end
