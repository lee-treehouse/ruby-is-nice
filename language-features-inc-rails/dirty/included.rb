# Callback invoked whenever the receiver is included in another module or class. 
# This should be used in preference to Module.append_features if your code wants 
# to perform some action when a module is included in another.

module Steerable
    def Steerable.included(mod)
      puts "#{self} included in #{mod}"
    end
end

  module Car
    include Steerable
  end
   # => prints "A included in Enumerable"