import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.CoadjointOrbitStructure

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure MomentMap {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) (M : Type) [TopologicalSpace M] [SmoothManifold M] where
  map : M → (LG.lieAlgebra.carrier → ℝ)
  hamiltonianFlow : Prop
  gEquivariance : Prop
  imageInCoadjointOrbit : Prop

structure MomentMapPackage {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) (M : Type) [TopologicalSpace M] [SmoothManifold M] where
  momentMap : MomentMap LG M
  imageStratified : Prop
  fiberRelations : Prop

structure MomentMapEvidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {M : Type} [TopologicalSpace M] [SmoothManifold M]
    (MM : MomentMapPackage LG M) where
  imageStratifiedClosed : MM.imageStratified
  fiberRelationsClosed : MM.fiberRelations

def MomentMapClosed {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {M : Type} [TopologicalSpace M] [SmoothManifold M]
    (MM : MomentMapPackage LG M) : Prop :=
  MM.imageStratified ∧ MM.fiberRelations

theorem moment_map_closed_from_evidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {M : Type} [TopologicalSpace M] [SmoothManifold M]
    (MM : MomentMapPackage LG M) (E : MomentMapEvidence MM) : MomentMapClosed MM := by
  exact And.intro E.imageStratifiedClosed E.fiberRelationsClosed

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse