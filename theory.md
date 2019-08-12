# 1.) What type of inheritance does Ruby have?

Inheritance is a relation between two classes, superclass and subclass. All the properties form superclass is applicable to subclass but subclass can also have it's own features.

There are two types of inheritance:
1.) single inheritance - class can inherit from single other class

## example
class Animals  
    def super_method 
        puts "Method of superclass"
    end
end
  
class Dogs < Animals  
    def initialize  
       puts "This is subclass"
    end
end

Dogs.new.super_method 

______________output______________
This is subclass
Method of superclass


2.) multilevel inheritance - when class B inherits from class A, and class C inherits from class B, class C gets all properties from class B and class B gets all properties from class A. In ruby it's possible only with the use of Mixin. We create a module with it's defined methods and then we include a module inside a class.

## example
require_relative "module_ruby"

<!-- example.rb -->
class Animals  
    def super_method 
        puts "Method of superclass"
    end
end
  
class Dogs < Animals  
    include Introduction
    include TypeOfDog
    include Perk
end

Dogs.new.method_1
Dogs.new.method_2
Dogs.new.method_3

<!-- module_ruby.rb -->
module Introduction
    def method_1
        puts "hey, I'm dog"
    end  
end

module TypeOfDog
    def method_2
      puts "Dog is a Golden retriver"
    end  
end

module Perk
    def method_3
        puts "hey, I am faithful"
    end
end

______________output______________
hey, I'm dog
Dog is a Golden retriver
hey, I am faithful

One of the downsides of inheritance is method overriding. In method overriding, subclass and superclass may have the same method’s name, but performing different tasks. In that case one method overrides another method. If superclass contains as same method's name as subclass then subclass method will get executed.

#example
class Animals 
    def method_1 
        puts "This is Superclass Method" 
    end 
end 
  
class Dogs < Animals    
    def method_1
        puts "This is Subclass Method" 
    end 
end 
     
Dogs.new.method_1

______________output______________
This is Subclass Method



# 2.) Which iteration is more idiomatic?
    # A
    [1, 2, 3].each { |number| p number * 10 }

    # B
    for number in [1, 2, 3]
        p number * 10
    end
    What is happening behind the scenes in each case (basic explanation)?


## explaining A
Here we have a single-line block. An array consists of 3 elements 1,2,3. We use .each method that iterates over every single element in array, in order. Block variable - |number| - represents each element in the array. Then, each item is multiple by 10. .each method is preferred because it's more secure. Anything that exists within the block exists only within local scope.

## explaining B
Number represent a block variable that iterates over every single item in array and prints out every item multiplied by 10. For loop is almost equivalent to an each loop but it does not create a new scope for local variables. There is a new unecessary line of code, as well, which makes code redundant.

If the code fits on one line, then is preferrble using single-line block.



# 3.) Is it possible to invoke Foo#qux method?
    class Foo
        private

        def qux
            puts "Can you reach me?"
        end
    end

Invoking qux method will give us an error because qux is a private method.

Private method is one of the ruby access controls that can be used only within claas definition. Accessing the private method outside the class is restricted. Keyword that defines using private method is 'private'. The only way to have external access to a private method is to call it within a public method.

# accessing private method
lass Foo
    def hello
        qux
    end
    private

    def qux
        puts "Can you reach me?"
    end
end

Foo.new.hello

_________output_________
Can you reach me?


# 4.) What keyword do you use when you declare String data?

There are a couple of ways to create a string. One way is by calling a new method on the String class. 
string = String.new("Hello Domagoj")

But the most common and the easiest way to create a string is to assign a string to a variable name. You have to bear in mind that variable name mustn't be as same as keyword name. Keywords are certain words that are reserved for doing specific task. If you declare variable with same name as keyword, you will get an error.

string = "This is string 2"
def = "Hello" -----> program will show you an error


# 5.) What is Enumerable?

Enumerable is a module that provides you methods for searching and sorting collections that you include in your classes. Ruby classes that include this module are Array, Hash, Range and Set classes. So if you’re writing something that has collections, you can just mix in the Enumerable module, with no need for rewriting  functionality of your object. 

The Enumerable module relies on .each method, which needs to be implemented in any class it’s included in. When called with a block on an array, the .each method will execute the block and iterate over each element in the array.

Some of enumerables methods are .map nad .each

 [1, 2, 3].each { |number| p number * 10 }

 If we call the .each method on an array without passing a block to execute for each of its elements, we’ll receive an instance of Enumerator. Instances of Enumerator describe how to iterate over an object.

 [1, 2, 3].each

_________output_________

<Enumerator: [1, 2, 3]:each>



# 6.) What will the method #bar send to the standard output? Why?

    class Foo
        def self.bar
            puts "My name is #{self}."
        end
    end

    Self is the “current” or “default” object that is receiving the current message. There’s always one (and only one) current object or self.

    To know which object is self, we need to know what context we're in. There are 
        top-level context, 
        class-definition context, 
        module-definition context,
        method-definition context.

    In this example we are in method context where 'self.bar' defines a class method (bar is class method of Foo), and 'self' inside class method refers to parent class object - Foo. So the output is Foo


# 7.) In abstract, explain what Ruby does internally so that the output of the following code example is ['A', 'B', 'C'].

    ["a", "b", "c"].map(&:upcase)           -> with proc
    ["a", "b", "c"].map { |i| i.upcase }    -> as a single-line block

In this example, we pass a proc to a '.map method'. A proc is an object that contains a block. Whenever we define a proc we have to prefix it's block with the ampersand and then a symbol that represents the name of the method that we want to apply on every single element within array.

Instead of having a long syntax such as ["a", "b", "c"].map { |i| i.upcase }, a procs has been applied to short the code and to make our code more flexible and adaptable in future. 