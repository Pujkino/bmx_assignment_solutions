# 1.) A western man is trying to find gold in a river. To do that, he passes a bucket through the river's soil and then checks if it contains any gold. However, he could be more productive if he wrote an algorithm to do the job for him.
#     So, you need to check if there is gold in the bucket, and if so, return True/true. If not, return False/false.
    
#     Input:
#     ["stone", "stone", "stone", "stone", "stone"]
#     ["gold", "stone", "stone", "stone", "stone"]
#     
#     Output:
#     false
#     true

class GoldFinder
    def check_the_bucket(bucket)
        bucket.any? { |item| item == "gold" }
    end
end

bucket_a = ["stone", "stone", "stone", "stone", "stone"]
bucket_b = ["gold", "stone", "stone", "stone", "stone"]

p GoldFinder.new.check_the_bucket(bucket_a)
p GoldFinder.new.check_the_bucket(bucket_b)


# 2.) Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number 
#     and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”. 
#     But this time, you're not allowed to use the % operator.

# p (nums - divisor * (nums/ divisor))
class Multiples
    attr_reader :nums, :divisor_3, :divisor_5

    def initialize 
        @nums = 1..100
        @divisor_3 = 3
        @divisor_5 = 5
    end

    def FirstHundredMultiples
        @nums.select do |num| 
            if  (num - @divisor_3 * (num / @divisor_3)) == 0 && (num - @divisor_5 * (num / @divisor_5) == 0)
                puts "FizzBuzz #{num}"
            elsif num - @divisor_5 * (num / @divisor_5) == 0
                puts "Buzz #{num}"
            elsif num - @divisor_3 * (num / @divisor_3) == 0
                puts "Fizz #{num}"
            end
        end
    end
end

Multiples.new.FirstHundredMultiples


# 3.) A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, 
#     must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain 
#     to send back to Earth. A rover's position and location is represented by a combination of x and y co-ordinates and 
#     a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify 
#     navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North. 
#     In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L'
#     and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means 
#     move forward one grid point, and maintain the same heading.
#     Assume that the square directly North from (x, y) is (x, y+1).

#     INPUT:
#     The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

#     The rest of the input is information pertaining to the rovers that have been deployed. Each rover has 
#     two lines of input. The first line gives the rover's position, and the second line is a series of instructions 
#     telling the rover how to explore the plateau. The position is made up of two integers and a letter separated by spaces, 
#     corresponding to the x and y co-ordinates and the rover's orientation.

#     Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.

#     OUTPUT:
#     The output for each rover should be its final co-ordinates and heading. INPUT AND OUTPUT: Test Input:
#     5 5
#     1 2 N 
#     LMLMLMLMM
#     3 3 E

#     MMRMMRMRRM Expected Output:
#     1 3 N
#     5 1 E


class Grid
    attr_reader :max_x, :max_y
    
    def initialize(max_x, max_y)
        @max_x = max_x
        @max_y = max_y
    end
end

class RoverMove
    attr_reader :x_cooridnate, :y_cooridnate, :grid
    
    def initialize(x_cooridnate, y_cooridnate, grid)
        @x_cooridnate = x_cooridnate
        @y_cooridnate = y_cooridnate
        @grid = grid
    end

    def orientation
        case @direction
            when "N" then  @y_cooridnate += 1 if @y_cooridnate < @grid.max_y  
            when "S" then  @y_cooridnate -= 1 if @y_cooridnate > 0
            when "E" then  @x_cooridnate += 1 if @x_cooridnate < @grid.max_x 
            when "W" then  @x_cooridnate -= 1 if @x_cooridnate > 0
        end
        puts "current location: #{@x_cooridnate}, #{@y_cooridnate}"
    end
    
    def movement
        puts "start location: #{@x_cooridnate}, #{@y_cooridnate}"
        loop do
            puts "enter direction - N, S, E, W"
            @direction = user_input
            puts "press M to move"
            break unless user_input == "M"
                orientation
        end
    end

    private
    def user_input
        gets.chomp.upcase
    end
end

grid = Grid.new(5,5)
p "grid size #{grid.max_x}, #{grid.max_y}"

move = RoverMove.new(0,0,grid)
move.movement