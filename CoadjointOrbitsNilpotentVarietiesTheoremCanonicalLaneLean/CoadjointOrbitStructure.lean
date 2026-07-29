import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure LieAlgebra (k : Type) [Field k] where
  carrier : Type u
  bracket : carrier → carrier → carrier
  jacobiIdentity : Prop
  skewSymmetry : Prop
  bracketTerm : ∀ x y : carrier, bracket x y = - bracket y x
  jacobiTerm : ∀ x y z : carrier, bracket x (bracket y z) + bracket y (bracket z x) + bracket z (bracket x y) = 0

structure LieGroup (G : Type) [TopologicalSpace G] [Group G] [SmoothManifold G] where
  lieAlgebra : LieAlgebra ℝ
  exponentialMap : lieAlgebra.carrier → G
  smoothExponential : Prop

structure CoadjointOrbit {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) where
  element : LG.lieAlgebra.carrier → ℝ
  orbit : Set (LG.lieAlgebra.carrier → ℝ)
  orbitIsAdjointOrbit : Prop
  orbitIsLocalClosed : Prop

structure CoadjointOrbitPackage (G : Type) [TopologicalSpace G] [Group G] [SmoothManifold G]
    (LG : LieGroup G) where
  orbit : LG.lieAlgebra.carrier → CoadjointOrbit LG
  orbitSmooth : Prop
  orbitSymplectic : Prop
  orbitEquivariant : Prop

structure CoadjointOrbitEvidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} (P : CoadjointOrbitPackage G LG) where
  orbitSmoothClosed : P.orbitSmooth
  orbitSymplecticClosed : P.orbitSymplectic
  orbitEquivariantClosed : P.orbitEquivariant

def CoadjointOrbitClosed {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} (P : CoadjointOrbitPackage G LG) : Prop :=
  P.orbitSmooth ∧ P.orbitSymplectic ∧ P.orbitEquivariant

theorem coadjoint_orbit_closed_from_evidence {G : Type} [TopologicalSpace G] [Group G] [SmoothManifold G]
    {LG : LieGroup G} (P : CoadjointOrbitPackage G LG) (E : CoadjointOrbitEvidence P) :
    CoadjointOrbitClosed P := by
  exact And.intro E.orbitSmoothClosed (And.intro E.orbitSymplecticClosed E.orbitEquivariantClosed)

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse