import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.SymplecticReduction

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure OrbitMethod {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) (M : Type) [TopologicalSpace M] [SmoothManifold M]
    (MM : MomentMapPackage LG M) (SR : SymplecticReductionPackage LG M MM) where
  quantizationMap : (LG.lieAlgebra.carrier → ℝ) → ℂ
  orbitCorrespondsToRep : Prop
  irreducibleRepsClassified : Prop

structure OrbitMethodPackage {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) (M : Type) [TopologicalSpace M] [SmoothManifold M]
    (MM : MomentMapPackage LG M) (SR : SymplecticReductionPackage LG M MM) where
  orbitMethod : OrbitMethod LG M MM SR
  quantizationConsistent : Prop
  repsCoverage : Prop

structure OrbitMethodEvidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {M : Type} [TopologicalSpace M] [SmoothManifold M]
    {MM : MomentMapPackage LG M} {SR : SymplecticReductionPackage LG M MM}
    (OM : OrbitMethodPackage LG M MM SR) where
  quantizationConsistentClosed : OM.quantizationConsistent
  repsCoverageClosed : OM.repsCoverage

def OrbitMethodClosed {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {M : Type} [TopologicalSpace M] [SmoothManifold M]
    {MM : MomentMapPackage LG M} {SR : SymplecticReductionPackage LG M MM}
    (OM : OrbitMethodPackage LG M MM SR) : Prop :=
  OM.quantizationConsistent ∧ OM.repsCoverage

theorem orbit_method_closed_from_evidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {M : Type} [TopologicalSpace M] [SmoothManifold M]
    {MM : MomentMapPackage LG M} {SR : SymplecticReductionPackage LG M MM}
    (OM : OrbitMethodPackage LG M MM SR) (E : OrbitMethodEvidence OM) : OrbitMethodClosed OM := by
  exact And.intro E.quantizationConsistentClosed E.repsCoverageClosed

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse