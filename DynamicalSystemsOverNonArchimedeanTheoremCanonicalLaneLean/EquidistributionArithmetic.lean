import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean.DynamicalDegreeGrowth

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure EquidistributionArithmeticPackage {M : NonArchimedeanMetricPackage}
    {B : BerkovichSpaceDynamicsPackage M} (D : DynamicalDegreeGrowthPackage B) where
  pointSequence : Type u
  limitingMeasure : Prop
  equidistributionResult : Prop
  limitingTerm : limitingMeasure
  equidistributionTerm : equidistributionResult

structure EquidistributionArithmeticEvidence {M : NonArchimedeanMetricPackage}
    {B : BerkovichSpaceDynamicsPackage M} {D : DynamicalDegreeGrowthPackage B}
    (E : EquidistributionArithmeticPackage D) where
  limitingMeasureClosed : E.limitingMeasure
  equidistributionResultClosed : E.equidistributionResult

def EquidistributionArithmeticClosed {M : NonArchimedeanMetricPackage}
    {B : BerkovichSpaceDynamicsPackage M} {D : DynamicalDegreeGrowthPackage B}
    (E : EquidistributionArithmeticPackage D) : Prop :=
  E.limitingMeasure ∧ E.equidistributionResult

theorem equidistribution_arithmetic_closed_from_evidence
    {M : NonArchimedeanMetricPackage} {B : BerkovichSpaceDynamicsPackage M}
    {D : DynamicalDegreeGrowthPackage B} (E : EquidistributionArithmeticPackage D)
    (Ev : EquidistributionArithmeticEvidence E) : EquidistributionArithmeticClosed E := by
  exact And.intro Ev.limitingMeasureClosed Ev.equidistributionResultClosed

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse