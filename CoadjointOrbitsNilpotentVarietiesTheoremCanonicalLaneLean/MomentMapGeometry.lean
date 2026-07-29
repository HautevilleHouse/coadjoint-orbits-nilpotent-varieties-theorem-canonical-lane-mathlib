import CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.RiemannianCurvature

/-!
# Moment Map Geometry Package
-/

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure MomentMapGeometryPackage {G : CoadjointLieAlgebraPackage}
    (M : HamiltonianGspacePackage G) where
  momentMapProper : Prop
  symplecticReduction : Prop
  orbitTypeStratified : Prop
  normalConeModeled : Prop

structure MomentMapGeometryEvidence {G : CoadjointLieAlgebraPackage}
    {M : HamiltonianGspacePackage G} (C : MomentMapGeometryPackage M) where
  momentMapProperClosed : C.momentMapProper
  symplecticReductionClosed : C.symplecticReduction
  orbitTypeStratifiedClosed : C.orbitTypeStratified
  normalConeModeledClosed : C.normalConeModeled

def MomentMapGeometryClosed {G : CoadjointLieAlgebraPackage}
    {M : HamiltonianGspacePackage G} (C : MomentMapGeometryPackage M) : Prop :=
  C.momentMapProper ∧ C.symplecticReduction ∧ C.orbitTypeStratified ∧ C.normalConeModeled

theorem moment_map_geometry_closed_from_evidence
    {G : CoadjointLieAlgebraPackage} {M : HamiltonianGspacePackage G}
    (C : MomentMapGeometryPackage M) (E : MomentMapGeometryEvidence C) :
    MomentMapGeometryClosed C := by
  exact And.intro E.momentMapProperClosed
    (And.intro E.symplecticReductionClosed
      (And.intro E.orbitTypeStratifiedClosed E.normalConeModeledClosed))

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse