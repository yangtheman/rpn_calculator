class Rpn

  attr_reader :operands
  
  OPERATORS = ["+", "-", "*", "/"]  
  
  def initialize
    @operands = []
  end
  
  def operate(operator)
    if @operands.size == 0
      return nil
    elsif @operands.size > 1
      @operands << do_the_op(@operands.pop(2), operator)
    end
    @operands.last
  end
  
  def process_input(input)
    if num = convert_to_num(input)
      @operands << num
      num
    elsif OPERATORS.include?(input)
      operate(input)
    else
      input
    end
  end
    
  def get_prompt
    loop do
      print '> '
      input = STDIN.gets.chomp()
      if input == "q"
        return nil
      else 
        puts process_input(input)
      end
    end
  end
  
  private
  
  def convert_to_num(string)
    if string == string.to_i.to_s
      string.to_i
    elsif string == string.to_f.to_s
      string.to_f
    else
      false
    end
  end
    
  def do_the_op(operands, operator)
    num1 = operator == "/" ? operands[0].to_f : operands[0]
    num2 = operator == "/" ? operands[1].to_f : operands[1]
    num1.send(operator.to_sym, num2)
  end
end