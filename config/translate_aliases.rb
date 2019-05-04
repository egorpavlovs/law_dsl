require_relative '../conditions/conditions_relatives'
module TranslateAliases
  include ConditionsRelatives

  alias_method :физическое_лицо?, :natural_person?
  alias_method :юридическое_лицо?, :legal_entity?
  alias_method :индивидуальный_предприниматель?, :individual_entrepreneur?
  alias_method :представитель?, :agent?
  alias_method :личность_подтверждена_через_есиа?, :applicant_identity_esia?
  alias_method :документы_технической_инвентаризации_представлены?, :technical_inventory_documents_represented?
  alias_method :электронное_заявление_сни_подано?, :statement_sni_filed?


end