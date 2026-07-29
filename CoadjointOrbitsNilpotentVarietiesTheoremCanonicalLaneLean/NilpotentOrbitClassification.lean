import CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.MomentMapGeometry

/-!
# Nilpotent Orbit Classification Package
-/

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure NilpotentOrbitClassificationPackage {G : CoadjointLieAlgebraPackage}
    {M : HamiltonianGspacePackage G} {C : MomentMapGeometryPackage M}
    (N : NilpotentConePackage C) where
  nilpotentOrbitStratified : Prop
  jacobsonMorozovResolved : Prop
  sl2TripleParametrization : Prop
  specialNilpotentOrbitCounted : Prop

structure NilpotentOrbitClassificationEvidence {G : CoadjointLieAlgebraPackage}
    {M : HamiltonianGspacePackage G} {C : MomentMapGeometryPackage M}
    {N : NilpotentConePackage C} (P : NilpotentOrbitClassificationPackage N) where
  nilpotentOrbitStratifiedClosed : P.nilpotentOrbitStratified
  jacobsonMorozovResolvedClosed : P.jacobsonMorozovResolved
  sl2TripleParametrizationClosed : P.sl2TripleParametrization
  specialNilpotentOrbitCountedClosed : P.specialNilpotentOrbitCounted

def NilpotentOrbitClassificationClosed {G : CoadjointLieAlgebraPackage}
    {M : HamiltonianGspacePackage G} {C : MomentMapGeometryPackage M}
    {N : NilpotentConePackage C} (P : NilpotentOrbitClassificationPackage N) : Prop :=
  P.nilpotentOrbitStratified ∧ P.jacobsonMorozovResolved ∧ P.sl2TripleParametrization ∧ P.specialNilpotentOrbitCounted

theorem nilpotent_orbit_classification_closed_from_evidence
    {G : CoadjointLieAlgebraPackage} {M : HamiltonianGspacePackage G}
    {C : MomentMapGeometryPackage M} {N : NilpotentConePackage C}
    (P : NilpotentOrbitClassificationPackage N) (E : NilpotentOrbitClassificationEvidence P) :
    NilpotentOrbitClassificationClosed P := by
  exact And.intro E.nilpotentOrbitStratifiedClosed
    (And.intro E.jacobsonMorozovResolvedClosed
      (And.intro E.sl2TripleParametrizationClosed E.specialNilpotentOrbitCountedClosed))

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse