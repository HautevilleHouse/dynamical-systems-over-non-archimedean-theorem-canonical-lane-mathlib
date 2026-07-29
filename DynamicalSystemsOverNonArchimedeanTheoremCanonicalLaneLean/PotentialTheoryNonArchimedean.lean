import HautevilleHouse.DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean.FatouJuliaNonArchimedean

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanPotential (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) where
  kernel : S.analyticSpace → S.analyticSpace → ℝ
  kernelNonnegative : ∀ x y, kernel x y ≥ 0
  energyFunctional : (S.analyticSpace → ℝ) → ℝ
  capacity : Set (S.analyticSpace → ℝ) → ℝ
  laplacianOperator : (S.analyticSpace → ℝ) → (S.analyticSpace → ℝ)
  harmonicFunctions : Set (S.analyticSpace → ℝ)

structure NonArchimedeanPotentialEvidence (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (P : NonArchimedeanPotential k S) where
  kernelNonnegativeClosed : P.kernelNonnegative

def NonArchimedeanPotentialClosed (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (P : NonArchimedeanPotential k S) : Prop :=
  P.kernelNonnegative

theorem non_archimedean_potential_closed_from_evidence (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (P : NonArchimedeanPotential k S)
    (E : NonArchimedeanPotentialEvidence k S P) : NonArchimedeanPotentialClosed k S P := by
  exact E.kernelNonnegativeClosed

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse