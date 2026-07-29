import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanDynamicalObject where
  carrier : Type
  topology : TopologicalSpace carrier
  nonArchimedeanValued : Prop
  map : carrier → carrier
  dynamicsWellDefined : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : NonArchimedeanDynamicalObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NonArchimedeanWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse
