import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanRecurrence where
  system : NonArchimedeanDynamicalSystem
  initialCondition : system.space
  recurrentPoint : system.space
  recurrenceWitness : ∃ (n : ℕ), (system.dynamics^[n]) system.initialCondition = system.recurrentPoint

def NonArchimedeanRecurrenceClosed (R : NonArchimedeanRecurrence) : Prop :=
  R.recurrenceWitness

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse