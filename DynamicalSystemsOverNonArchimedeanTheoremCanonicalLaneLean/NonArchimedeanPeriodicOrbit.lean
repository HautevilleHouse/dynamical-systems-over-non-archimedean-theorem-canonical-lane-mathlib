import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanPeriodicOrbit where
  system : NonArchimedeanDynamicalSystem
  periodicPoint : system.space
  minimalPeriod : ℕ
  periodWitness : (system.dynamics^[minimalPeriod]) system.periodicPoint = system.periodicPoint
  minimality : ∀ k : ℕ, 0 < k → k < minimalPeriod → (system.dynamics^[k]) system.periodicPoint ≠ system.periodicPoint

def NonArchimedeanPeriodicOrbitClosed (P : NonArchimedeanPeriodicOrbit) : Prop :=
  P.periodWitness ∧ P.minimality

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse