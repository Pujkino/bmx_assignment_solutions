
# Junior Ruby/Rails developer assignments

## How to submit your solutions?

Create a GitHub repository with the name **bmx_assignment_solutions**.

Put all your answers to theoretical questions into a file named
**theory.md** and your coding solutions into a file named **code.rb**.

In case you decided to solve the _Mars Rover assignment_, create the directory
with the name **mars_rover_solution** and put all relevant files into it.
Name and structure files for the assignment in the way you deem appropriate.


## Theory

1. What type of inheritance does Ruby have?

2. Which iteration is more idiomatic?

```
# A
[1, 2, 3].each { |number| p number * 10 }

```

```
# B
for number in [1, 2, 3]
  p number * 10
end
```

What is happening behind the scenes in each case (basic explanation)?

3. Is it possible to invoke `Foo#qux` method? Try it.

```
class Foo
  private

  def qux
    puts "Can you reach me?"
  end
end
```

4. What keyword do you use when you declare String data?

5. What is Enumerable?

6. What will the method `#bar` send to the standard output? Why?

```
class Foo
  def self.bar
    puts "My name is #{self}."
  end
end
```

**OPTIONAL**

7. In abstract, explain what Ruby does internally so that the output of the
following code example is `['A', 'B', 'C']`.

```
["a", "b", "c"].map(&:upcase)
```

## Coding

1. A western man is trying to find gold in a river. To do that, he passes a
  bucket through the river's soil and then checks if it contains any gold.
  However, he could be more productive if he wrote an algorithm to do the job for him.

  So, you need to check if there is gold in the bucket, and if so, return True/true.
  If not, return False/false.

  Input:
   - ["stone", "stone", "stone", "stone", "stone"]
   - ["gold", "stone", "stone", "stone", "stone"]


  Output:
   - false
   - true

```
def check_the_bucket(bucket)
  # code
end
```

2. Write a program that prints the numbers from 1 to 100. But for multiples of
three print “Fizz” instead of the number and for the multiples of five print
“Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.
But this time, **you're not allowed to use the `%` operator**.

**OPTIONAL**

3. A squad of robotic rovers are to be landed by NASA on a plateau on Mars.
This plateau, which is curiously rectangular, must be navigated by the rovers
so that their on-board cameras can get a complete view of the surrounding
terrain to send back to Earth. A rover's position and location is represented
by a combination of x and y co-ordinates and a letter representing one of the
four cardinal compass points. The plateau is divided up into a grid to simplify
navigation. An example position might be 0, 0, N, which means the rover is in
the bottom left corner and facing North. In order to control a rover, NASA
sends a simple string of letters. The possible letters are 'L', 'R' and 'M'.
'L' and 'R' makes the rover spin 90 degrees left or right respectively,
without moving from its current spot. 'M' means move forward one grid point,
and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

INPUT:

The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau. The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.

OUTPUT:

The output for each rover should be its final co-ordinates and heading.
INPUT AND OUTPUT:
Test Input:

5 5

1 2 N

LMLMLMLMM

3 3 E

MMRMMRMRRM
Expected Output:

1 3 N

5 1 E