import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean.BerkovichSpaceDynamics

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure DynamicalDegreeGrowthPackage {M : NonArchimedeanMetricPackage}
    (B : BerkovichSpaceDynamicsPackage M) where
  degreeSequence : Type u
  growthRate : Prop
  algebraicEntropyRelation : Prop
  growthTerm : growthRate
  entropyTerm : algebraicEntropyRelation

structure DynamicalDegreeGrowthEvidence {M : NonArchimedeanMetricPackage}
    {B : BerkovichSpaceDynamicsPackage M} (D : DynamicalDegreeGrowthPackage B) where
  growthRateClosed : D.growthRate
  algebraicEntropyRelationClosed : D.algebraicEntropyRelation

def DynamicalDegreeGrowthClosed {M : NonArchimedeanMetricPackage}
    {B : BerkovichSpaceDynamicsPackage M} (D : DynamicalDegreeGrowthPackage B) : Prop :=
  D.growthRate ∧ D.algebraicEntropyRelation

theorem dynamical_degree_growth_closed_from_evidence
    {M : NonArchimedeanMetricPackage} {B : BerkovichSpaceDynamicsPackage M}
    (D : DynamicalDegreeGrowthPackage B) (E : DynamicalDegreeGrowthEvidence D) :
    DynamicalDegreeGrowthClosed D := by
  exact And.intro E.growthRateClosed E.algebraicEntropyRelationClosed

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse