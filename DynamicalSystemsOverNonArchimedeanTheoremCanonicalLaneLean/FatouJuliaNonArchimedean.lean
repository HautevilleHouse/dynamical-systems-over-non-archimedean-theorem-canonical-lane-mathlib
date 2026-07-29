import HautevilleHouse.DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean.RigidAnalyticIteration

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanFatouJulia (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S) where
  fatouSet : Set S.analyticSpace
  juliaSet : Set S.analyticSpace
  fatouOpen : IsOpen fatouSet
  juliaClosed : IsClosed juliaSet
  fatouJuliaPartition : fatouSet ∪ juliaSet = Set.univ ∧ fatouSet ∩ juliaSet = ∅
  fatouDynamicsEquicontinuous : Prop
  juliaDynamicsChaotic : Prop

structure NonArchimedeanFatouJuliaEvidence (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S)
    (F : NonArchimedeanFatouJulia k S B) where
  fatouOpenClosed : F.fatouOpen
  juliaClosedClosed : F.juliaClosed
  fatouJuliaPartitionClosed : F.fatouJuliaPartition
  fatouDynamicsEquicontinuousClosed : F.fatouDynamicsEquicontinuous
  juliaDynamicsChaoticClosed : F.juliaDynamicsChaotic

def NonArchimedeanFatouJuliaClosed (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S)
    (F : NonArchimedeanFatouJulia k S B) : Prop :=
  F.fatouOpen ∧ F.juliaClosed ∧ F.fatouJuliaPartition ∧ F.fatouDynamicsEquicontinuous ∧ F.juliaDynamicsChaotic

theorem non_archimedean_fatou_julia_closed_from_evidence (k : Type u) [NormedField k] [NonArchimedeanNorm k]
    (S : BerkovichSpace k) (B : BerkovichDynamicalSystem k S)
    (F : NonArchimedeanFatouJulia k S B) (E : NonArchimedeanFatouJuliaEvidence k S B F) :
    NonArchimedeanFatouJuliaClosed k S B F := by
  exact And.intro E.fatouOpenClosed
    (And.intro E.juliaClosedClosed
      (And.intro E.fatouJuliaPartitionClosed
        (And.intro E.fatouDynamicsEquicontinuousClosed E.juliaDynamicsChaoticClosed)))

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse