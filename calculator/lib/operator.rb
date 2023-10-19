
class Operator      # in Ruby, abstract classes are known as modules
  def execute(old_value, new_value)
      self.describe(old_value, new_value)
    end

    def describe(old_value, new_value)
      puts "#{old_value} #{self.class} #{new_value}"
    end
  end
