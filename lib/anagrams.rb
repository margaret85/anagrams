class Anagram
  include Enumerable

  def initialize(input_1,input_2)
    @input_1 = input_1
    @input_2 = input_2
  end

  def word_cases(input_1,input_2)
    sm_input_1 = input_1.downcase
    sm_input_2 = input_2.downcase
    no_punc_1 = sm_input_1.gsub(/\W+/, '')
    no_punc_2 = sm_input_2.gsub(/\W+/, '')
    input_1_letters = no_punc_1.split("")
    input_2_letters = no_punc_2.split("")

    real_words = []
    not_words = []
    letter_matches = []
    trues = []

    def is_word(sm_input_1,sm_input_2)
      input_1_words = sm_input_1.split(" ")
      input_2_words = sm_input_2.split(" ")
      words_from_both = input_1_words.concat(input_2_words)

      words_from_both.each do |word|
        if (word.include?("a")) || (word.include?("e")) || (word.include?("i")) || (word.include?("o")) || (word.include?("u")) || (word.include?("y"))
          real_words.push(word)
        else
          not_words.push(word)
        end
      end

      if not_words.any?
        "You need to input actual words!"
      end
    end

    def antigrams(input_1_letters,input_2_letters)
      input_1_letters.each() do |letter|
        letter_matches.push(no_punc_2.match?(letter))
      end

      input_2_letters.each() do |letter|
        letter_matches.push(no_punc_1.match?(letter))
      end

      letter_matches.each() do |true_false|
        true_false_str = true_false.to_s
        if (true_false_str == "true")
          trues.push(true_false_str)
        end
      end

      if trues.empty?
        "These words have no letter matches and are antigrams!"
      end
    end

    def palindromes(no_punc_1,no_punc_2)
      input_2_rev = no_punc_2.reverse

      if (no_punc_1 == input_2_rev)
        "These words are palindromes"
      end
    end

    def anagrams(input_1_letters,input_2_letters)
      input_1_letters.each() do |letter|
        letter_matches.push(no_punc_2.match?(letter))
      end

      input_2_letters.each() do |letter|
        letter_matches.push(no_punc_1.match?(letter))
      end

      if (letter_matches.include?(false))
        "These words are not anagrams"
      else
        "These words are anagrams"
      end
    end
  end
end
