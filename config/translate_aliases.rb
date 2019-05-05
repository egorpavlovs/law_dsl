require_relative '../conditions/conditions_relatives'
module TranslateAliases
  include ConditionsRelatives
  # ru
  alias_method :физическое_лицо?, :natural_person?
  alias_method :юридическое_лицо?, :legal_entity?
  alias_method :индивидуальный_предприниматель?, :individual_entrepreneur?
  alias_method :представитель?, :agent?
  alias_method :личность_подтверждена_через_есиа?, :applicant_identity_esia?
  alias_method :документы_технической_инвентаризации_представлены?, :technical_inventory_documents_represented?
  alias_method :электронное_заявление_сни_подано?, :statement_sni_filed?
  alias_method :фотофиксация_исходной_ситуации_представлена?, :photos_initial_situation_presented?
  alias_method :ситуационный_план_представлен?, :situational_plan_presented?
  alias_method :изображения_проектируемых_конструкций_представлены?, :photos_projected_constructions_presented?
  alias_method :топографический_план_с_маштабом_представлен?, :topographic_plan_with_scale_presented?
  alias_method :проект_согласован?, :project_agreed?
  # tat
  alias_method :физик_зат?, :natural_person?
  alias_method :юридик_зат?, :legal_entity?
  alias_method :шәхси_эшмәкәр?, :individual_entrepreneur?
  alias_method :вәкил?, :agent?
  alias_method :шәхес_раслау_аша_есиа?, :applicant_identity_esia?
  alias_method :проект_килештерелгән?, :project_agreed?
  alias_method :техник_инвентаризация_документлары_бармы?, :technical_inventory_documents_represented?
  alias_method :сни_электрон_гаризасы_бирелдеме?, :statement_sni_filed?
  alias_method :башлангыч_ситуацияне_фотофиксацияләү_тәкъдим_ителде?, :photos_initial_situation_presented?
  alias_method :ситуационный_планы_тәкъдим_ителде?, :situational_plan_presented?
  alias_method :проектлана_торган_конструкцияләр_сурәтләре_тәкъдим_ителгән?, :photos_projected_constructions_presented?
  alias_method :маштаб_белән_топографик_план_тәкъдим_ителгән?, :topographic_plan_with_scale_presented?

end