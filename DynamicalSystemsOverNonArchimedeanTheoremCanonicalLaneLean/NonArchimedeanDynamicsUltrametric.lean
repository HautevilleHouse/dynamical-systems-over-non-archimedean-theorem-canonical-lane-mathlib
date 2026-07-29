import NonArchimedeanDynamicsAdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure UltrametricPressurePackage (A : AdmissibleClass) where
  topologicalPressure : Prop
  measuresOfMaximalEntropy : Prop
  variationalPrincipleHolds : Prop
  equilibriumStatesExist : Prop
  pressureForNonArchimedeanDynamics : Prop

structure UltrametricPressureEvidence {A : AdmissibleClass} (U : UltrametricPressurePackage A) where
  topologicalPressureClosed : U.topologicalPressure
  measuresOfMaximalEntropyClosed : U.measuresOfMaximalEntropy
  variationalPrincipleHoldsClosed : U.variationalPrincipleHolds
  equilibriumStatesExistClosed : U.equilibriumStatesExist
  pressureForNonArchimedeanDynamicsClosed : U.pressureForNonArchimedeanDynamics

def UltrametricPressureClosed {A : AdmissibleClass} (U : UltrametricPressurePackage A) : Prop :=
  U.topologicalPressure ∧ U.measuresOfMaximalEntropy ∧ U.variationalPrincipleHolds ∧ U.equilibriumStatesExist ∧ U.pressureForNonArchimedeanDynamics

theorem ultrametric_pressure_closed_from_evidence {A : AdmissibleClass} (U : UltrametricPressurePackage A) (E : UltrametricPressureEvidence U) :
    UltrametricPressureClosed U := by
  exact And.intro E.topologicalPressureClosed
    (And.intro E.measuresOfMaximalEntropyClosed
      (And.intro E.variationalPrincipleHoldsClosed
        (And.intro E.equilibriumStatesExistClosed
          E.pressureForNonArchimedeanDynamicsClosed)))

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse