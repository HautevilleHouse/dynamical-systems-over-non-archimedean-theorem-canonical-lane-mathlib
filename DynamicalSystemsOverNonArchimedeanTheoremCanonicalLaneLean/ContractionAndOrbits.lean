import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure ContractionOrbitPackage {D : NonArchimedeanDynamicsPackage}
    (G : NonArchimedeanDynamicsPackage) where
  fixedPointExists : Prop
  contractionConstant : Type u
  iterationConverges : Prop
  orbitClassification : Prop
  periodicOrbitsCharacterized : Prop

structure ContractionOrbitEvidence {D : NonArchimedeanDynamicsPackage}
    {G : NonArchimedeanDynamicsPackage} (C : ContractionOrbitPackage G) where
  fixedPointExistsClosed : C.fixedPointExists
  iterationConvergesClosed : C.iterationConverges
  orbitClassificationClosed : C.orbitClassification
  periodicOrbitsCharacterizedClosed : C.periodicOrbitsCharacterized

def ContractionOrbitClosed {D : NonArchimedeanDynamicsPackage}
    {G : NonArchimedeanDynamicsPackage} (C : ContractionOrbitPackage G) : Prop :=
  C.fixedPointExists ∧ C.iterationConverges ∧
  C.orbitClassification ∧ C.periodicOrbitsCharacterized

theorem contraction_orbit_closed_from_evidence
    {D : NonArchimedeanDynamicsPackage}
    {G : NonArchimedeanDynamicsPackage} (C : ContractionOrbitPackage G)
    (E : ContractionOrbitEvidence C) : ContractionOrbitClosed C := by
  exact And.intro E.fixedPointExistsClosed
    (And.intro E.iterationConvergesClosed
      (And.intro E.orbitClassificationClosed E.periodicOrbitsCharacterizedClosed))

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse