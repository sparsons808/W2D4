
def no_dupes?(array)
    hash = Hash.new(0)
    array.each { |ele| hash[ele] += 1 }
    new_arr = []
    hash.each do |k, v|
        if v == 1
            new_arr << k
        end
    end

    new_arr 
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true]) 

def no_consecutive_repeats?(array)
    array.each_with_index do |ele, idx|
        if idx != array[-1] && ele == array[idx + 1]
            return false
        end
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    hash = {}

    str.each_char.with_index do |char, i|
        if !hash.has_key?(char)
            hash[char] = [i]
        else
            hash[char] << i
        end
    end
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    hash = Hash.new(0)

    str.each_char { |char| hash[char] += 1 }
    longest_char = ""
    hash.each do |k, v|
        char_streak = k * v
        if char_streak.length >= longest_char.length
            longest_char = char_streak
        end
    end
    longest_char
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'
def prime?(num)
    if num < 2
        return false
    elsif num == 2
        return true
    end

    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    true
end

def bi_prime?(num)
    primes = []
    (2...num).each do |n|
        if prime?(n)
            primes << n
        end
    end
    
    primes.each do |n1|
        primes.each do |n2|
            if n1 * n2 == num
                return true
            end
        end
    end
    false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(string, keys)
    alpha = ('a'..'z').to_a
    new_word = ""

    string.each_char.with_index do |char, idx|
        old_idx = alpha.index(char)
        new_idx = old_idx + keys[idx % keys.length]
        new_char = alpha[new_idx % alpha.length]
        new_word += new_char
    end

    new_word
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = ["a", "e", "i", "o", "u"]
    vowels_from_str = []

    str.each_char do |char|
        if vowels.include?(char)
            vowels_from_str << char
        end
    end

    vowels_2 = vowels_from_str.rotate(vowels_from_str.length - 1)

    i = 0
    while i < vowels_2.length - 1
        str.each_char.with_index do |char, idx|
            if vowels.include?(char)
                str[idx] = vowels_2[i]
                i += 1
            end
        end
    end
    str
end


# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String

    def select(&prc)
        if block_given?
            new_string = ""
            self.each_char do |char|
                if prc.call(char)
                    new_string += char
                end
            end
        else
            return ""
        end
        new_string
    end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""


