import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanAttractor where
  system : NonArchimedeanDynamicalSystem
  attractorSet : Set system.space
  forwardInvariant : ∀ x ∈ attractorSet, system.dynamics x ∈ attractorSet
  attracting : ∀ x : system.space, Filter.Tendsto (λ n : ℕ => (system.dynamics^[n]) x) Filter.atTop (𝓝 attractorSet)

def NonArchimedeanAttractorClosed (A : NonArchimedeanAttractor) : Prop :=
  A.forwardInvariant ∧ A.attracting

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse