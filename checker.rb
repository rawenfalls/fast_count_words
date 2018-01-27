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

def check_words(entered_words)
  ignored_words = ["на","под","за","из","по","об","над","около","при","перед","через","от","но","хотя","чтобы","зато","как","да","или","либо"]
  word=""
  words=[]
  entered_words.each_char do |i|
    if " ,.!?".include?(i)
      words << word if word.size >1
      word.clear
    else
      word+=i
    end
  end
  ignored_words.each { |ignored_word| words.delete_if{ |word| word =~ /^#{ignored_word}$/i}}
  return words
end

