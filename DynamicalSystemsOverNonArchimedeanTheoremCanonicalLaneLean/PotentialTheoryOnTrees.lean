import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean.NonArchimedeanMetric

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure PotentialTheoryOnTreesPackage (M : NonArchimedeanMetricPackage) where
  tree : Type u
  laplacian : Type v
  energyFunctional : Prop
  equilibriumPotential : Prop
  energyTerm : energyFunctional
  equilibriumTerm : equilibriumPotential

structure PotentialTheoryOnTreesEvidence {M : NonArchimedeanMetricPackage}
    (P : PotentialTheoryOnTreesPackage M) where
  energyFunctionalClosed : P.energyFunctional
  equilibriumPotentialClosed : P.equilibriumPotential

def PotentialTheoryOnTreesClosed {M : NonArchimedeanMetricPackage}
    (P : PotentialTheoryOnTreesPackage M) : Prop :=
  P.energyFunctional ∧ P.equilibriumPotential

theorem potential_theory_on_trees_closed_from_evidence
    {M : NonArchimedeanMetricPackage} (P : PotentialTheoryOnTreesPackage M)
    (E : PotentialTheoryOnTreesEvidence P) : PotentialTheoryOnTreesClosed P := by
  exact And.intro E.energyFunctionalClosed E.equilibriumPotentialClosed

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse