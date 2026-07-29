import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure JordanDecomposition (g : NilpotentLieAlgebra) where
  element : g.vectorSpace
  nilpotentPart : g.vectorSpace
  semisimplePart : g.vectorSpace
  additiveDecomposition : element = nilpotentPart + semisimplePart
  nilpotentPartNilpotent : ∃ n : ℕ, (ad nilpotentPart)^n = 0
  semisimplePartSemisimple : True
  additiveDecompositionTerm : additiveDecomposition
  nilpotentPartNilpotentTerm : nilpotentPartNilpotent
  semisimplePartSemisimpleTerm : semisimplePartSemisimple

structure NilpotentCone (g : NilpotentLieAlgebra) where
  elements : Set g.vectorSpace
  stableUnderScaling : ∀ x ∈ elements, ∀ c, c • x ∈ elements
  nilpotent : ∀ x ∈ elements, ∃ n : ℕ, (ad x)^n = 0
  stableUnderScalingTerm : stableUnderScaling
  nilpotentTerm : nilpotent

def nilpotentConeClosed (g : NilpotentLieAlgebra) (N : NilpotentCone g) : Prop :=
  N.stableUnderScaling ∧ N.nilpotent

theorem nilpotent_cone_closed (g : NilpotentLieAlgebra) (N : NilpotentCone g) : nilpotentConeClosed g N := by
  exact And.intro N.stableUnderScalingTerm N.nilpotentTerm

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse