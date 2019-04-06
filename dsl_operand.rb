class DslOperand
  attr_reader :allowed
  attr_reader :response

  def initialize(allowed, response)
    @allowed = allowed
    @response = response.is_a?(Array) ? response : Array(response)
  end

  def | (operand)
    if allowed
      self
    elsif operand.allowed
      operand
    else
      DslOperand.new(false, [self.response, operand.response].flatten)
    end
  end

  def & (operand)
    if allowed && operand.allowed
      self
    elsif allowed && !operand.allowed
      operand
    elsif !allowed && allowed
      allowed
    elsif !allowed && !allowed
      DslOperand.new(false, [self.response, operand.response].flatten)
    end
  end


end