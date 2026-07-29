import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure NonArchimedeanAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  nonArchimedeanStructure : space → Prop
  dynamicalSystem : space → space
  periodicPoints : Set space
  conclusion : Prop

def NonArchimedeanWitnessClosed (O : NonArchimedeanAdmittedObject) : Prop :=
  O.conclusion

structure AdmissibleClass where
  object : NonArchimedeanAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NonArchimedeanWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse