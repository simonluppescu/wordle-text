require "set"

def run
  answer = decide_answer

  while true
    print "What is your guess? "
    guess = gets.chomp.downcase

    if guess.length != 5
      puts "INVALID GUESS. NEEDS TO BE 5 LETTERS"
    end

    if evaluate_guess(guess, answer)
      break
    end
  end
end

def decide_answer
  word_list.sample
end

def evaluate_guess(guess, answer)
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
    end
  end

  puts evaluation.inspect
  return false
end

def word_list
  list = File.read("five-letter-words.txt").split("\n")
end

run
