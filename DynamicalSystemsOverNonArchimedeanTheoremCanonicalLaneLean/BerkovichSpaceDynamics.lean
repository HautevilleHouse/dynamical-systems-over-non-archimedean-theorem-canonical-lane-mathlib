import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean.NonArchimedeanMetric

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure BerkovichSpaceDynamicsPackage (M : NonArchimedeanMetricPackage) where
  analyticSpace : Type u
  actionMap : Type v
  continuityOfAction : Prop
  fixedPointProperty : Prop
  continuityTerm : continuityOfAction
  fixedPointTerm : fixedPointProperty

structure BerkovichSpaceDynamicsEvidence {M : NonArchimedeanMetricPackage}
    (B : BerkovichSpaceDynamicsPackage M) where
  continuityOfActionClosed : B.continuityOfAction
  fixedPointPropertyClosed : B.fixedPointProperty

def BerkovichSpaceDynamicsClosed {M : NonArchimedeanMetricPackage}
    (B : BerkovichSpaceDynamicsPackage M) : Prop :=
  B.continuityOfAction ∧ B.fixedPointProperty

theorem berkovich_space_dynamics_closed_from_evidence
    {M : NonArchimedeanMetricPackage} (B : BerkovichSpaceDynamicsPackage M)
    (E : BerkovichSpaceDynamicsEvidence B) : BerkovichSpaceDynamicsClosed B := by
  exact And.intro E.continuityOfActionClosed E.fixedPointPropertyClosed

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse