class Array
    def my_zip(*arrays)
        result = []

        # loop thr ele of self 
        self.each_with_index do |ele, i|
            # for each ele create a subarr starting w the curr ele
            subarray = [ele]

            # loop thr all input arrays. if array has ele at same idx as ^ ele push to subarray else push nil
            arrays.each do |array|
                if array[i]
                    subarray << array[i]
                else
                    subarray << nil
                end
            end
            #after the loop is done push subarray to result
            result << subarray
        end

        result
    end

    def my_rotate(rotate = 1)
        # calculate amt to be rotated by getting the remainder of rotate / self.length
        rotation = rotate % self.length
        # concat self at rotation position till end of self + beginning of self exc rotation pos
        self[rotation..-1] + self[0...rotation]
    end
end
