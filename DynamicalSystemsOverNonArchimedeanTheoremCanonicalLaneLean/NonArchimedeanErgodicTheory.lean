import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanErgodicMeasure where
  system : NonArchimedeanDynamicalSystem
  measure : Measure system.space
  invariant : ∀ s ∈ measurableSet system.space, measure (system.dynamics⁻¹' s) = measure s
  ergodic : ∀ s ∈ measurableSet system.space, (system.dynamics⁻¹' s = s) → measure s = 0 ∨ measure s = 1

def NonArchimedeanErgodicMeasureClosed (M : NonArchimedeanErgodicMeasure) : Prop :=
  M.invariant ∧ M.ergodic

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse