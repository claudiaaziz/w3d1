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

    def my_zip(*arrays)
        result = []

        # loop thr each ele in self
        self.each_with_index do |ele, i|
            # start the inner array w the current ele
            subarray = [ele]
            
            # loop thr each array in input arrays
            arrays.each do |array|
                # if curr ele at curr array is not nil push ele to subarray else push nil
                array[i] ? subarray << array[i] : subarray << nil
            end

            # after the subarray is filled push it to the result. keep looping till self is done
            result << subarray
        end

        result
    end

    def my_rotate(rotate = 1)
        split_idx = rotate % self.length
        self[split_idx..-1] + self[0...split_idx]
    end

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

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

