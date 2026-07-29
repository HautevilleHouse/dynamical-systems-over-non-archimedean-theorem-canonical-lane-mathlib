import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanValuationPackage where
  field : Type u
  valuationGroup : Type v
  valuationMap : field → valuationGroup
  nonArchimedeanProperty : Prop
  triangleInequality : Prop
  ultrametricInequality : Prop

structure NonArchimedeanValuationEvidence (V : NonArchimedeanValuationPackage) where
  nonArchimedeanPropertyClosed : V.nonArchimedeanProperty
  triangleInequalityClosed : V.triangleInequality
  ultrametricInequalityClosed : V.ultrametricInequality

def NonArchimedeanValuationClosed (V : NonArchimedeanValuationPackage) : Prop :=
  V.nonArchimedeanProperty ∧ V.triangleInequality ∧ V.ultrametricInequality

theorem non_archimedean_valuation_closed_from_evidence (V : NonArchimedeanValuationPackage)
    (E : NonArchimedeanValuationEvidence V) : NonArchimedeanValuationClosed V :=
  And.intro E.nonArchimedeanPropertyClosed (And.intro E.triangleInequalityClosed E.ultrametricInequalityClosed)

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse
