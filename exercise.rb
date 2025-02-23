class Exercise
  @@computedFibonacci = Hash.new

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    words = str.split(' ')

    for i in 0..(words.length-1) do
      word = words[i]
      if (word.length > 4)
        punctuation = ""
        lastCharInWord = word[-1]
        if (/[[:punct:]]/.match(lastCharInWord))
          punctuation = lastCharInWord
        end

        if (/[[:upper:]]/.match(word[0, 1]))
          words[i] = "Marklar" + punctuation;
        else
          words[i] = "marklar" + punctuation;
        end
      end
    end

    return words.join(" ")
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    self.calcFibonacci(nth)

    sum = 0
    @@computedFibonacci.each do |key, value|
      if (value % 2 == 0)
        sum += value
      end
    end

    return sum
  end

  def self.calcFibonacci(nth)
    if (nth == 1)
      return 0
    end
    if (nth == 2)
      return 1
    end

    if (@@computedFibonacci.key?(nth))
      return @@computedFibonacci[nth]
    end

    fibonacciVal = self.calcFibonacci(nth - 2) + self.calcFibonacci(nth - 1)
    @@computedFibonacci[nth] = fibonacciVal

    return fibonacciVal
  end

end
