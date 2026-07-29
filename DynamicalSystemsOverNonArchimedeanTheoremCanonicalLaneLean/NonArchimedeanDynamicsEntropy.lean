import NonArchimedeanDynamicsMixingProperties

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure EntropyPackage {A : AdmissibleClass} {U : UltrametricPressurePackage A} {M : MixingPropertiesPackage U} where
  topologicalEntropyDefined : Prop
  kolmogorovSinaiEntropyDefined : Prop
  entropyContinuity : Prop
  entropyUpperSemicontinuity : Prop
  variationalPrincipleEntropy : Prop

structure EntropyEvidence {A : AdmissibleClass} {U : UltrametricPressurePackage A} {M : MixingPropertiesPackage U} (E : EntropyPackage M) where
  topologicalEntropyDefinedClosed : E.topologicalEntropyDefined
  kolmogorovSinaiEntropyDefinedClosed : E.kolmogorovSinaiEntropyDefined
  entropyContinuityClosed : E.entropyContinuity
  entropyUpperSemicontinuityClosed : E.entropyUpperSemicontinuity
  variationalPrincipleEntropyClosed : E.variationalPrincipleEntropy

def EntropyClosed {A : AdmissibleClass} {U : UltrametricPressurePackage A} {M : MixingPropertiesPackage U} (E : EntropyPackage M) : Prop :=
  E.topologicalEntropyDefined ∧ E.kolmogorovSinaiEntropyDefined ∧ E.entropyContinuity ∧ E.entropyUpperSemicontinuity ∧ E.variationalPrincipleEntropy

theorem entropy_closed_from_evidence {A : AdmissibleClass} {U : UltrametricPressurePackage A} {M : MixingPropertiesPackage U} (E : EntropyPackage M) (Ev : EntropyEvidence E) :
    EntropyClosed E := by
  exact And.intro Ev.topologicalEntropyDefinedClosed
    (And.intro Ev.kolmogorovSinaiEntropyDefinedClosed
      (And.intro Ev.entropyContinuityClosed
        (And.intro Ev.entropyUpperSemicontinuityClosed
          Ev.variationalPrincipleEntropyClosed)))

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse