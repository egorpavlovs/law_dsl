class DslOperand
  attr_reader :allowed
  attr_reader :response

  def initialize(allowed, response)
    @allowed = allowed
    @response = response.is_a?(Array) ? response : Array(response)
  end

  def or (operand)
    if allowed
      self
    elsif operand.allowed
      operand
    else
      DslOperand.new(false, [self.response, operand.response].flatten)
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
      DslOperand.new(false, [self.response, operand.response].flatten)
    end
  end

  def !@
    DslOperand.new(!allowed, response)
  end

  alias_method :или,:or
  alias_method :и,:and

end