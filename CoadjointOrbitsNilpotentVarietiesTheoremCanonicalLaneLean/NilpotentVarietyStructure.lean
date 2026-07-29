import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.CoadjointOrbitStructure

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure NilpotentOrbit {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) (P : CoadjointOrbitPackage G LG) where
  orbit : CoadjointOrbit LG
  nilpotencyCondition : Prop
  orbitClosure : Set (LG.lieAlgebra.carrier → ℝ)
  closureContainsOrigin : Prop
  orbitClosureIsVariety : Prop

structure NilpotentVarietyPackage {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) (P : CoadjointOrbitPackage G LG) where
  nilpotentOrbits : Set (NilpotentOrbit LG P)
  varietyStructure : AlgebraicVariety (LG.lieAlgebra.carrier → ℝ)
  orbitClosuresCoverVariety : Prop
  straticationSmooth : Prop

structure NilpotentVarietyEvidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {P : CoadjointOrbitPackage G LG} (V : NilpotentVarietyPackage LG P) where
  orbitClosuresCoverVarietyClosed : V.orbitClosuresCoverVariety
  straticationSmoothClosed : V.straticationSmooth

def NilpotentVarietyClosed {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {P : CoadjointOrbitPackage G LG} (V : NilpotentVarietyPackage LG P) : Prop :=
  V.orbitClosuresCoverVariety ∧ V.straticationSmooth

theorem nilpotent_variety_closed_from_evidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} {P : CoadjointOrbitPackage G LG} (V : NilpotentVarietyPackage LG P)
    (E : NilpotentVarietyEvidence V) : NilpotentVarietyClosed V := by
  exact And.intro E.orbitClosuresCoverVarietyClosed E.straticationSmoothClosed

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse