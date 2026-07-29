import HautevilleHouse.DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean.PotentialTheoryNonArchimedean

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanEquidistribution (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S) where
  invariantMeasure : Set S.analyticSpace → ℝ
  measureNonnegative : ∀ E, invariantMeasure E ≥ 0
  measureTotal : invariantMeasure Set.univ = 1
  invariantUnderDynamics : ∀ E, invariantMeasure (B.dynamics⁻¹' E) = invariantMeasure E
  equilibriumMeasure : Set S.analyticSpace → ℝ
  equidistributionLimit : Prop

structure NonArchimedeanEquidistributionEvidence (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S)
    (E : NonArchimedeanEquidistribution k S B) where
  measureNonnegativeClosed : E.measureNonnegative
  measureTotalClosed : E.measureTotal
  invariantUnderDynamicsClosed : E.invariantUnderDynamics
  equidistributionLimitClosed : E.equidistributionLimit

def NonArchimedeanEquidistributionClosed (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S)
    (E : NonArchimedeanEquidistribution k S B) : Prop :=
  E.measureNonnegative ∧ E.measureTotal ∧ E.invariantUnderDynamics ∧ E.equidistributionLimit

theorem non_archimedean_equidistribution_closed_from_evidence (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S)
    (Eq : NonArchimedeanEquidistribution k S B)
    (Ev : NonArchimedeanEquidistributionEvidence k S B Eq) :
    NonArchimedeanEquidistributionClosed k S B Eq := by
  exact And.intro Ev.measureNonnegativeClosed
    (And.intro Ev.measureTotalClosed
      (And.intro Ev.invariantUnderDynamicsClosed Ev.equidistributionLimitClosed))

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse