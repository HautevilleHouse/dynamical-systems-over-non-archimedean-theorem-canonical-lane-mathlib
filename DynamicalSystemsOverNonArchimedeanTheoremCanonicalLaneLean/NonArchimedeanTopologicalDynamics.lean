import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanTopologicalDynamicsPackage {V : NonArchimedeanValuationPackage}
    (DS : DynamicalSystemPackage V) where
  topologicalTransitivity : Prop
  minimality : Prop
  equicontinuity : Prop
  distal : Prop

structure NonArchimedeanTopologicalDynamicsEvidence {V : NonArchimedeanValuationPackage}
    {DS : DynamicalSystemPackage V} (NTD : NonArchimedeanTopologicalDynamicsPackage DS) where
  topologicalTransitivityClosed : NTD.topologicalTransitivity
  minimalityClosed : NTD.minimality
  equicontinuityClosed : NTD.equicontinuity
  distalClosed : NTD.distal

def NonArchimedeanTopologicalDynamicsClosed {V : NonArchimedeanValuationPackage}
    {DS : DynamicalSystemPackage V} (NTD : NonArchimedeanTopologicalDynamicsPackage DS) : Prop :=
  NTD.topologicalTransitivity ∧ NTD.minimality ∧ NTD.equicontinuity ∧ NTD.distal

theorem non_archimedean_topological_dynamics_closed_from_evidence
    {V : NonArchimedeanValuationPackage} {DS : DynamicalSystemPackage V}
    (NTD : NonArchimedeanTopologicalDynamicsPackage DS)
    (E : NonArchimedeanTopologicalDynamicsEvidence NTD) :
    NonArchimedeanTopologicalDynamicsClosed NTD :=
  And.intro E.topologicalTransitivityClosed
    (And.intro E.minimalityClosed
      (And.intro E.equicontinuityClosed E.distalClosed))

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse
