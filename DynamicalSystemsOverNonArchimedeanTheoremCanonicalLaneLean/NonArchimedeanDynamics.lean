import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean

structure NonArchimedeanDynamicsPackage where
  nonArchimedeanField : Type u
  valuation : Type v
  additiveGroup : Type w
  metricStructure : Prop
  actionMap : Type x
  valuationClosed : valuation → valuation → Prop
  ballDefined : Prop
  ultrametricInequality : Prop
  contractionProperty : Prop
  stableManifoldExists : Prop
  metricStructureTerm : metricStructure
  ballDefinedTerm : ballDefined
  ultrametricInequalityTerm : ultrametricInequality
  contractionPropertyTerm : contractionProperty
  stableManifoldExistsTerm : stableManifoldExists

structure NonArchimedeanDynamicsEvidence (D : NonArchimedeanDynamicsPackage) where
  metricStructureClosed : D.metricStructure
  ballDefinedClosed : D.ballDefined
  ultrametricInequalityClosed : D.ultrametricInequality
  contractionPropertyClosed : D.contractionProperty
  stableManifoldExistsClosed : D.stableManifoldExists

def NonArchimedeanDynamicsClosed (D : NonArchimedeanDynamicsPackage) : Prop :=
  D.metricStructure ∧ D.ballDefined ∧ D.ultrametricInequality ∧
  D.contractionProperty ∧ D.stableManifoldExists

theorem non_archimedean_dynamics_closed_from_evidence
    (D : NonArchimedeanDynamicsPackage) (E : NonArchimedeanDynamicsEvidence D) :
    NonArchimedeanDynamicsClosed D := by
  exact And.intro E.metricStructureClosed
    (And.intro E.ballDefinedClosed
      (And.intro E.ultrametricInequalityClosed
        (And.intro E.contractionPropertyClosed E.stableManifoldExistsClosed)))

end DynamicalSystemsOverNonArchimedeanTheoremCanonicalLaneLean
end HautevilleHouse