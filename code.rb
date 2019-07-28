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
                puts "FizzBuzz"
            elsif num - @divisor_5 * (num / @divisor_5) == 0
                puts "Buzz"
            elsif num - @divisor_3 * (num / @divisor_3) == 0
                puts "Fizz"
            else
                puts num
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
#     MMRMMRMRRM 
      
#     Expected Output:
#     1 3 N
#     5 1 E


class Grid
    attr_reader :max_x, :max_y
    
    def initialize(max_x, max_y)
        @max_x = max_x
        @max_y = max_y
    end
end

class Rover
    attr_reader :x_coordinate, :y_coordinate, :direction

    def initialize(x_coordinate, y_coordinate, direction)
      @x_coordinate = x_coordinate
      @y_coordinate = y_coordinate
      @direction = direction
    end

    def instruction(control)
      control.each do |input|
        case input
            when "L" then left
            when "R" then right
            when "M" then move
        end
      end
        puts "rover current location: (#{@x_coordinate}, #{@y_coordinate}) #{@direction}"
    end
  
    def left
        case @direction
            when "N" then @direction = "W"
            when "W" then @direction = "S"
            when "S" then @direction = "E"
            when "E" then @direction = "N"
        end
    end
    
    def right
        case @direction
        when "N" then @direction = "E"
        when "E" then @direction = "S"
        when "S" then @direction = "W"
        when "W" then @direction = "N" 
      end
    end
  
    def move
        case @direction
        when "N" then @y_coordinate += 1
        when "E" then @x_coordinate += 1
        when "S" then @y_coordinate -= 1
        when "W" then @x_coordinate -= 1 
        end
    end
end

grid = Grid.new(5,5)
puts "#{grid.max_x}, #{grid.max_y}"

mars_rover_a = Rover.new(1,2,"N")
mars_rover_b = Rover.new(3,3,"E")

mars_rover_a.instruction(["L","M","L","M","L","M","L","M","M"])
mars_rover_b.instruction(["M","M","R","M","M","R","M","R", "R", "M"])