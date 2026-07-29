import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanDynamicalSystem where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  nonArchimedeanMetric : stateSpace → stateSpace → ℝ
  ultrametricInequality : Prop
  timeDomain : Type v
  additiveGroup : AddGroup timeDomain
  timeTopology : TopologicalSpace timeDomain
  flow : timeDomain → stateSpace → stateSpace
  flowContinuous : Continuous (Function.uncurry flow)
  flowIsometry : ∀ t x y, nonArchimedeanMetric (flow t x) (flow t y) = nonArchimedeanMetric x y
  groupAction : ∀ t s x, flow (t + s) x = flow t (flow s x)
  identityAtZero : ∀ x, flow 0 x = x

structure NonArchimedeanDynamicalEvidence (S : NonArchimedeanDynamicalSystem) where
  ultrametricInequalityClosed : S.ultrametricInequality
  flowContinuousClosed : S.flowContinuous
  flowIsometryClosed : S.flowIsometry
  groupActionClosed : S.groupAction
  identityAtZeroClosed : S.identityAtZero

def NonArchimedeanDynamicalClosed (S : NonArchimedeanDynamicalSystem) : Prop :=
  S.ultrametricInequality ∧ S.flowContinuous ∧ S.flowIsometry ∧ S.groupAction ∧ S.identityAtZero

theorem nonArchimedean_dynamical_closed_from_evidence (S : NonArchimedeanDynamicalSystem)
    (E : NonArchimedeanDynamicalEvidence S) : NonArchimedeanDynamicalClosed S := by
  exact And.intro E.ultrametricInequalityClosed
    (And.intro E.flowContinuousClosed
      (And.intro E.flowIsometryClosed
        (And.intro E.groupActionClosed E.identityAtZeroClosed)))

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse