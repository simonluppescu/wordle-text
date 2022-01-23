require "set"

def run
  answer = decide_answer
  letters = build_letters

  while true
    print "What is your guess? "
    guess = gets.chomp.downcase

    if guess.length != 5
      puts "INVALID GUESS. NEEDS TO BE 5 LETTERS"
      continue
    end

    if evaluate_guess(guess, answer, letters)
      break
    end
  end
end

def decide_answer
  word_list.sample
end

def build_letters
  final = {}
  letters = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  letters.each do |letter|
    final[letter] = true
  end

  return final
end

def print_letters(letters)
  print "Letters left: "

  poo = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  poo.each do |p|
    print letters[p] ? p : "_"
  end

  print "\n"
end

def evaluate_guess(guess, answer, letters)
  if guess == answer
    puts "YOU WIN!!!"
    return true
  end

  evaluation = %i[X X X X X]
  answer_letters = Set.new(answer.split(""))

  5.times do |i|
    if guess[i] == answer[i]
      evaluation[i] = :O
    end
  end

  5.times do |i|
    if answer_letters.include?(guess[i])
      evaluation[i] = :A if evaluation[i] != :O
    else
      letters[guess[i]] = false
    end
  end

  puts evaluation.inspect
  print_letters(letters)
  return false
end

def word_list
  list = File.read("five-letter-words.txt").split("\n")
end

run
