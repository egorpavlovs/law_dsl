require_relative 'conditions/conditions_relatives'
require_relative 'config/translate_aliases'
require_relative 'dsl_operand'
module LoadRelatives
  include ConditionsRelatives
  include TranslateAliases

end