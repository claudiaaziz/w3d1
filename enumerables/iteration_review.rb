def factors(num)
    (1..num).select do |fact|
        num % fact == 0
    end
end

class Array
    def bubble_sort!(&prc)
        sorted = false

        until sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    sorted = false
                    self[i], self[i+1] = self[i+1], self[i]
                end 
            end
        end
        self
    end

    def bubble_sort(&prc)
        dup = self.dup
        sorted = false

        until sorted
            sorted = true
            (0...dup.length - 1).each do |i|
                if prc.call(dup[i], dup[i+1]) == 1
                    sorted = false
                    dup[i], dup[i+1] = dup[i+1], dup[i]
                end 
            end
        end
        dup
    end
end

def substrings(string)
    subs = []
    (0...string.length).each do |start_idx|
        (start_idx...string.length).each do |end_idx|
            subs << string[start_idx..end_idx]
        end
    end
    subs
end

def subwords(word, dictionary)
    dictionary.select do |dictionary_word|
        word.include?(dictionary_word)
    end
end
