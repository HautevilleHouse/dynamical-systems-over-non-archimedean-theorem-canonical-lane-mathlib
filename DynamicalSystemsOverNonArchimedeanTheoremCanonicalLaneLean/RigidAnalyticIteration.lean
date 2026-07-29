import HautevilleHouse.DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean.BerkovichSpaceDynamics

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure RigidAnalyticIteration (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S) where
  iterate : ℕ → S.analyticSpace → S.analyticSpace
  iterateZeroIdentity : ∀ x, iterate 0 x = x
  iterateSuccComposition : ∀ n x, iterate (n+1) x = B.dynamics (iterate n x)
  uniformConvergence : Prop
  limitMap : S.analyticSpace → S.analyticSpace
  limitContinuous : Continuous limitMap
  limitPreservesBerkovich : limitMap '' S.berkovichPoints ⊆ S.berkovichPoints

structure RigidAnalyticIterationEvidence (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S)
    (R : RigidAnalyticIteration k S B) where
  uniformConvergenceClosed : R.uniformConvergence
  limitContinuousClosed : R.limitContinuous
  limitPreservesBerkovichClosed : R.limitPreservesBerkovich

def RigidAnalyticIterationClosed (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S)
    (R : RigidAnalyticIteration k S B) : Prop :=
  R.uniformConvergence ∧ R.limitContinuous ∧ R.limitPreservesBerkovich

theorem rigid_analytic_iteration_closed_from_evidence (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S)
    (R : RigidAnalyticIteration k S B) (E : RigidAnalyticIterationEvidence k S B R) :
    RigidAnalyticIterationClosed k S B R := by
  exact And.intro E.uniformConvergenceClosed
    (And.intro E.limitContinuousClosed E.limitPreservesBerkovichClosed)

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse