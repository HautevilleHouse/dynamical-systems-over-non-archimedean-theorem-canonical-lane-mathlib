import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure DynamicalSystemPackage (V : NonArchimedeanValuationPackage) where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  transitionMap : stateSpace → stateSpace
  iteration : ℕ → stateSpace → stateSpace
  orbitClosure : stateSpace → Set stateSpace
  nonArchimedeanCompatible : Prop
  localMinimality : Prop
  recurrentPoints : Prop

structure DynamicalSystemEvidence {V : NonArchimedeanValuationPackage}
    (DS : DynamicalSystemPackage V) where
  nonArchimedeanCompatibleClosed : DS.nonArchimedeanCompatible
  localMinimalityClosed : DS.localMinimality
  recurrentPointsClosed : DS.recurrentPoints

def DynamicalSystemClosed {V : NonArchimedeanValuationPackage}
    (DS : DynamicalSystemPackage V) : Prop :=
  DS.nonArchimedeanCompatible ∧ DS.localMinimality ∧ DS.recurrentPoints

theorem dynamical_system_closed_from_evidence {V : NonArchimedeanValuationPackage}
    (DS : DynamicalSystemPackage V) (E : DynamicalSystemEvidence DS) :
    DynamicalSystemClosed DS :=
  And.intro E.nonArchimedeanCompatibleClosed
    (And.intro E.localMinimalityClosed E.recurrentPointsClosed)

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse
