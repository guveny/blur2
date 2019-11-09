class Image
    def initialize(data)
        @image = data
    end

    def data
        @image.each do |row|
            puts row.join
        end
    end

    def get_ones_positions
        ones = []
        @image.each_with_index do |row, rn|
            row.each_with_index do |item, cn|
                if (item == 1)
                    ones << [rn, cn]
                end
            end
        end
        return ones
    end

    def blur
        ones = get_ones_positions
     #   puts ones
        @image.each_index do |row_num|
            row = @image[row_num]
            row.each_index do |col_num|
                ones.each do |rn_found, cn_found|

                    if (row_num == rn_found && col_num == cn_found)
                        # value to the left
                        @image[row_num][col_num - 1] = 1 unless row_num == 0

                        # value to the right
                        @image[row_num][col_num + 1] = 1 unless col_num >= 3

                        # value above 
                        @image[row_num - 1][col_num] = 1 unless row_num == 0

                        # value below
                        @image[row_num + 1][col_num] = 1 unless row_num >= 3
                    end

                end

            end
        end
    end
end

image = Image.new([
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]])

image.data
puts " "
image.blur
puts " "
image.data