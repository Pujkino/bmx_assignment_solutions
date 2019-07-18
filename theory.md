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

##example
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