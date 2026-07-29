import NonArchimedeanDynamicsUltrametric

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure MixingPropertiesPackage {A : AdmissibleClass} (U : UltrametricPressurePackage A) where
  topologicalMixing : Prop
  strongMixing : Prop
  weakMixing : Prop
  mixingInNonArchimedeanSense : Prop
  mixingPreservedUnderConjugacy : Prop

structure MixingPropertiesEvidence {A : AdmissibleClass} {U : UltrametricPressurePackage A} (M : MixingPropertiesPackage U) where
  topologicalMixingClosed : M.topologicalMixing
  strongMixingClosed : M.strongMixing
  weakMixingClosed : M.weakMixing
  mixingInNonArchimedeanSenseClosed : M.mixingInNonArchimedeanSense
  mixingPreservedUnderConjugacyClosed : M.mixingPreservedUnderConjugacy

def MixingPropertiesClosed {A : AdmissibleClass} {U : UltrametricPressurePackage A} (M : MixingPropertiesPackage U) : Prop :=
  M.topologicalMixing ∧ M.strongMixing ∧ M.weakMixing ∧ M.mixingInNonArchimedeanSense ∧ M.mixingPreservedUnderConjugacy

theorem mixing_properties_closed_from_evidence {A : AdmissibleClass} {U : UltrametricPressurePackage A} (M : MixingPropertiesPackage U) (E : MixingPropertiesEvidence M) :
    MixingPropertiesClosed M := by
  exact And.intro E.topologicalMixingClosed
    (And.intro E.strongMixingClosed
      (And.intro E.weakMixingClosed
        (And.intro E.mixingInNonArchimedeanSenseClosed
          E.mixingPreservedUnderConjugacyClosed)))

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse