class Animal
  def speak
  	puts "grrr"
  end
  def legs
  	4
  end
end

dog = Animal.new
dog.speak   # "grrr"

class Dog < Animal
	def speak
		puts "woof"
	end
end

dog = Dog.new
dog.speak # "woof"
dog.legs # 4

