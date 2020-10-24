module DemoModule
  class DemoClass
    def self.introduce
      return 2
    end

    def introduce
      return 3
    end
  end

  def self.introduce
    return 1
  end
end

def winning_combination?
  first = DemoModule.introduce
  second = DemoModule::DemoClass.introduce
  third = DemoModule::DemoClass.new.introduce
  # Next line should return true!
  [first, second, third] == [1, 2, 3]
end
