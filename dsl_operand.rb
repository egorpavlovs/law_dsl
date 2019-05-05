class DslOperand
  attr_reader :allowed
  attr_reader :response
  attr_reader :method_name

  def initialize(allowed, response, method_name = nil)
    @allowed = allowed
    # @response = response.is_a?(Array) ? response : Array(response)
    @response = response
    @method_name = method_name
  end

  def or (operand)
    if allowed
      self
    elsif operand.allowed
      operand
    else
      DslOperand.new(false, [self, operand].flatten, nil)
    end
  end

  def and (operand)
    if allowed && operand.allowed
      self
    elsif allowed && !operand.allowed
      operand
    elsif !allowed && operand.allowed
      self
    elsif !allowed && !allowed
      DslOperand.new(false, [self, operand].flatten, nil)
    end
  end

  def !@
    DslOperand.new(!allowed, response, method_name)
  end

  alias_method :или,:or
  alias_method :и,:and

end