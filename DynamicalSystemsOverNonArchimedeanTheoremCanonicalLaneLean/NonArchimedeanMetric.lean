import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanMetricPackage where
  field : Type u
  valuation : Type v
  metric : field → field → w
  ultrametricInequality : Prop
  metricDefined : Prop
  ultrametricInequalityTerm : ultrametricInequality
  metricDefinedTerm : metricDefined

structure NonArchimedeanMetricEvidence (M : NonArchimedeanMetricPackage) where
  ultrametricInequalityClosed : M.ultrametricInequality
  metricDefinedClosed : M.metricDefined

def NonArchimedeanMetricClosed (M : NonArchimedeanMetricPackage) : Prop :=
  M.ultrametricInequality ∧ M.metricDefined

theorem non_archimedean_metric_closed_from_evidence
    (M : NonArchimedeanMetricPackage) (E : NonArchimedeanMetricEvidence M) :
    NonArchimedeanMetricClosed M := by
  exact And.intro E.ultrametricInequalityClosed E.metricDefinedClosed

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse