    

class Cat 

# here's a member variable and I won't offer a getter or setter
# later I'll explicitly add a getter sand setter without "get_" and "set_" prefixes  
@firstName

# want to be able to get and set @temperamen, will do it longhand with methods prefixed "get_" and "set_"
@temperament

# want to be able to get and set @figure, using shorthand.. no method prefix
attr_accessor :figure, :faves


    def initialize firstName
        @firstName = firstName

        # ok I can't assign straight away to my uninitialized array 
        # this is the error undefined method `[]=' for nil:NilClass (NoMethodError)
        # what if I declare it first. yep that did it. 
        @faves = Array.new(2) { Array.new(3) }

        ["holly","kate","mummy","daddy"].each_with_index do |person, counter| 
            @faves[0][counter] = person;
        end

        ["fish","chicken","vegiemite","bikkies"].each_with_index do |food, counter| 
            @faves[1][counter] = food;
        end
    end 

    def []=(location, fave)
        row, column = location
        faves[row][column] = fave
    end


    def firstName
        return @firstName
    end

    def firstName=firstName
        @firstName=firstName
    end

    def get_temperament
        return @temperament
    end

    def set_temperament temperament
        @temperament = temperament
    end
    
    def describe 
    # do i need to check for not nil first? 
    # well i tried leaving figure uninitialized and there was no error thrown        

    #puts "*********"
    #puts figure
    #puts @figure
    #puts :figure #(prints "figure")
    #puts :chonky #"chonky"
    #puts "*********"


    # this works if i check figure or check @figure but not if I check :figure
        if figure == :chonky then
            return "a chonky boi"
        end
        return "not a chonky boi"

    end

end



ernie = Cat.new("Ernie")

p(ernie)


ernie.set_temperament("sleepy")

puts(ernie.get_temperament) #prints sleepy

puts(ernie.figure) #prints nothing, it's nil.. no error though

# set a symbol instead of a string
ernie.figure = :chonky
puts(ernie.figure) # prints the string "chonky"

puts ernie.describe

ernie.firstName+= "-boo"

puts(ernie.firstName)

# we put a setter method on ernie that passes two parameters (the [1,2] and the "goo") and uses them to set on faves
# I find this weird 
# https://rickcarlino.com/2015/square-brackets.html
ernie[[1,2]] = "goo"
puts(ernie.faves)