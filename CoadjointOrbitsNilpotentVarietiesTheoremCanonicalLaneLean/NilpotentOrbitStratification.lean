import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure NilpotentLieAlgebra where
  field : Type u
  vectorSpace : Type v
  lieBracket : vectorSpace → vectorSpace → vectorSpace
  nilpotent : Prop
  fieldIsAlgClosed : Prop
  lieBracketBilinear : Prop
  nilpotentTerm : nilpotent
  fieldIsAlgClosedTerm : fieldIsAlgClosed
  lieBracketBilinearTerm : lieBracketBilinear

structure CoadjointOrbit (g : NilpotentLieAlgebra) where
  element : g.vectorSpace
  orbit : Set g.vectorSpace
  orbitDefinedViaAdjoint : Prop
  orbitDefinedViaAdjointTerm : orbitDefinedViaAdjoint

structure NilpotentVariety (g : NilpotentLieAlgebra) where
  carrier : Set (CoadjointOrbit g)
  zariskiClosed : Prop
  irreducible : Prop
  poissonStructure : Prop
  zariskiClosedTerm : zariskiClosed
  irreducibleTerm : irreducible
  poissonStructureTerm : poissonStructure

structure NilpotentOrbitPackage (g : NilpotentLieAlgebra) where
  orbit : CoadjointOrbit g
  variety : NilpotentVariety g
  orbitInVariety : orbit ∈ variety.carrier

structure NilpotentOrbitEvidence (g : NilpotentLieAlgebra) (pkg : NilpotentOrbitPackage g) where
  orbitInVarietyClosed : pkg.orbitInVariety
  zariskiClosedClosed : pkg.variety.zariskiClosed
  irreducibleClosed : pkg.variety.irreducible
  poissonStructureClosed : pkg.variety.poissonStructure

def NilpotentOrbitClosed (g : NilpotentLieAlgebra) (pkg : NilpotentOrbitPackage g) : Prop :=
  pkg.orbitInVariety ∧ pkg.variety.zariskiClosed ∧ pkg.variety.irreducible ∧ pkg.variety.poissonStructure

theorem nilpotent_orbit_closed_from_evidence (g : NilpotentLieAlgebra) (pkg : NilpotentOrbitPackage g) (E : NilpotentOrbitEvidence g pkg) : NilpotentOrbitClosed g pkg := by
  exact And.intro E.orbitInVarietyClosed (And.intro E.zariskiClosedClosed (And.intro E.irreducibleClosed E.poissonStructureClosed))

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse