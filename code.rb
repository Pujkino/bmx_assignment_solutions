# A western man is trying to find gold in a river. To do that, he passes a bucket through the river's soil and then checks if it contains any gold. However, he could be more productive if he wrote an algorithm to do the job for him.
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