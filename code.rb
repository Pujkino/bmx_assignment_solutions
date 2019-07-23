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