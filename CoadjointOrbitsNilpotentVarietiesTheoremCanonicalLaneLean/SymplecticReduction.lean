import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.MomentMap

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure SymplecticReduction {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) (M : Type) [TopologicalSpace M] [SmoothManifold M]
    (MM : MomentMapPackage LG M) where
  reducedSpace : Type
  reducedSymplecticForm : reducedSpace → reducedSpace → ℝ
  quotientMap : M → reducedSpace
  reductionPreservesStructure : Prop

structure SymplecticReductionPackage {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) (M : Type) [TopologicalSpace M] [SmoothManifold M]
    (MM : MomentMapPackage LG M) where
  reduction : SymplecticReduction LG M MM
  nullFibersCollapsed : Prop
  reducedSpaceStratified : Prop

structure SymplecticReductionEvidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {M : Type} [TopologicalSpace M] [SmoothManifold M]
    {MM : MomentMapPackage LG M} (SR : SymplecticReductionPackage LG M MM) where
  nullFibersCollapsedClosed : SR.nullFibersCollapsed
  reducedSpaceStratifiedClosed : SR.reducedSpaceStratified

def SymplecticReductionClosed {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {M : Type} [TopologicalSpace M] [SmoothManifold M]
    {MM : MomentMapPackage LG M} (SR : SymplecticReductionPackage LG M MM) : Prop :=
  SR.nullFibersCollapsed ∧ SR.reducedSpaceStratified

theorem symplectic_reduction_closed_from_evidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {M : Type} [TopologicalSpace M] [SmoothManifold M]
    {MM : MomentMapPackage LG M} (SR : SymplecticReductionPackage LG M MM)
    (E : SymplecticReductionEvidence SR) : SymplecticReductionClosed SR := by
  exact And.intro E.nullFibersCollapsedClosed E.reducedSpaceStratifiedClosed

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse