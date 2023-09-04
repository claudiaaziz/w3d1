class Array
    def my_each(&prc)
        (0...self.length).each do |i|
            prc.call(self[i])
        end
        self
    end

    def my_select(&prc)
        select = []
        self.each { |ele| select << ele if prc.call(ele) }
        select
    end

    def my_reject(&prc)
        rejected = []
        self.each { |ele| rejected << ele unless prc.call(ele) }
        rejected
    end

    def my_any?(&prc)
        self.each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.each do |ele|
            return false unless prc.call(ele)
        end
        true
    end

    def my_flatten
        return [self] if !self.is_a?(Array)
        flattened = []
        self.each do |ele|
            flattened += ele.my_flatten
        end
        flattened
    end

    # def zip(*arrays)
    #     length = arrays.length
    #     zipped_result = []

    #     (0...length).each do |i|
    #         ele_at_idx_i = []
    #         arrays.each do |array| 
    #             ele_at_idx_i << array[i]
    #         end
    #         zipped_result << ele_at_idx_i
    #     end

    #     zipped_result
    # end

    # def my_zip(*arrays)
    #     height = self.length
    #     width = arrays.length

    #     result = Array.new(height) { Array.new(width + 1) }

    #     arrays.inject(self) do |acc, array|
    #         result = zip(result, array)
    #     end

    #     result
    # end

    # def my_rotate(n = 1)
    #     rotated = self.dup

    #     if n > 0
    #         n.times do
    #             rotated << self.shift
    #             rotated.shift
    #         end
    #     else
    #         n.times do
    #             rotated << self.pop
    #         end
    #     end

    #     rotated
    # end

    def my_join(join_on = "")
        joined = ''
        self.each_with_index do |ele, i|
            if i != self.length - 1
                joined += ele + join_on 
            else
                joined += ele
            end
        end
        joined
    end

    def my_reverse
        reversed = []
        (self.length - 1).downto(0) do |i|
            reversed << self[i]
        end
        reversed
    end
end


# Write a method my_rotate that returns a new array containing all the elements of the original array in a rotated order. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.
# Example:

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# Write my_zip to take any number of arguments. It should return a new array containing self.length elements. Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. If the size of any argument is less than self, nil is returned for that location.
# Example:
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]