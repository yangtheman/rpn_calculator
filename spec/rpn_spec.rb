require_relative "../rpn"
require 'rspec'

describe Rpn do  
  
  describe ".new" do
    it "should initialize operands to empty array" do
      rpn = Rpn.new
      rpn.operands.should == []
    end
  end

  describe "#operate" do
    it "should return nil if there is zero operand" do
      rpn = Rpn.new
      rpn.operate("+").should == nil
    end
  
    it "should return the operand if there is only one operand" do
      rpn = Rpn.new
      rpn.instance_variable_set(:@operands, [1])
      rpn.operate("+").should == 1
    end
  
    it "should add operands if operator is + and push the result" do
      rpn = Rpn.new
      rpn.instance_variable_set(:@operands, [1, 2])
      rpn.operate("+").should == 3
      rpn.operands.should == [3]
    end

    it "should subtract operands if operator is - and push the result" do
      rpn = Rpn.new
      rpn.instance_variable_set(:@operands, [1, 2])
      rpn.operate("-").should == -1
      rpn.operands.should == [-1]
    end    

    it "should multiply operands if operator is * and push the result" do
      rpn = Rpn.new
      rpn.instance_variable_set(:@operands, [-2, -3])
      rpn.operate("*").should == 6
      rpn.operands.should == [6]
    end    

    it "should divide operands if operator is / and push the result" do
      rpn = Rpn.new
      rpn.instance_variable_set(:@operands, [7, 2])
      rpn.operate("/").should == 3.5
      rpn.operands.should == [3.5]
    end    
  
    it "should operate on only last two operands and push the result" do
      rpn = Rpn.new
      rpn.instance_variable_set(:@operands, [2, 9, 3])
      rpn.operate("+").should == 12
      rpn.operands.should == [2, 12]
    end  
  end 
  
  describe "#process_input" do
    it "should add input to operands if integer and return input" do
      rpn = Rpn.new
      rpn.process_input("1").should == 1
      rpn.operands.should == [1]
      rpn.process_input("1.1").should == 1.1
      rpn.operands.should == [1, 1.1]
    end
    
    it "should add input to operands if floating and return input" do
      rpn = Rpn.new
      rpn.process_input("1.1").should == 1.1
      rpn.operands.should == [1.1]
      rpn.process_input("1").should == 1
      rpn.operands.should == [1.1, 1]
    end
    
    it "should return input without operating if not integer nor floating" do
      rpn = Rpn.new
      rpn.instance_variable_set(:@operands, [2, 9, 3])
      rpn.process_input("abc").should == "abc"
      rpn.operands.should == [2, 9, 3]
    end
    
    it "should call operate method if input is an operator" do
      rpn = Rpn.new
      rpn.should_receive(:operate).with("+")
      rpn.process_input("+")
    end
  end
  
end