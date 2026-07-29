import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure ErgodicityPackage {V : NonArchimedeanValuationPackage}
    (DS : DynamicalSystemPackage V) where
  invariantMeasure : Type u
  ergodicMeasure : Type v
  measurePreserving : Prop
  ergodicDecomposition : Prop

structure ErgodicityEvidence {V : NonArchimedeanValuationPackage}
    {DS : DynamicalSystemPackage V} (E : ErgodicityPackage DS) where
  measurePreservingClosed : E.measurePreserving
  ergodicDecompositionClosed : E.ergodicDecomposition

def ErgodicityClosed {V : NonArchimedeanValuationPackage}
    {DS : DynamicalSystemPackage V} (E : ErgodicityPackage DS) : Prop :=
  E.measurePreserving ∧ E.ergodicDecomposition

theorem ergodicity_closed_from_evidence {V : NonArchimedeanValuationPackage}
    {DS : DynamicalSystemPackage V} (E : ErgodicityPackage DS)
    (Ev : ErgodicityEvidence E) : ErgodicityClosed E :=
  And.intro Ev.measurePreservingClosed Ev.ergodicDecompositionClosed

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse
