import CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.CoadjointOrbitPackages

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure NilpotentVarietyPackage {L : NilpotentLieAlgebra} (P : CoadjointOrbitPackage L) where
  varietySet : Set L.dual
  orbitEnumeration : Type
  closureProperty : ∀ f ∈ varietySet, ∃ orbit, f ∈ orbit
  orbitClosureRelation : Prop
  orbitClosureCondition : orbitClosureRelation

structure NilpotentVarietyEvidence {L : NilpotentLieAlgebra} {P : CoadjointOrbitPackage L} (V : NilpotentVarietyPackage P) where
  orbitClosureConditionClosed : V.orbitClosureCondition

def NilpotentVarietyClosed {L : NilpotentLieAlgebra} {P : CoadjointOrbitPackage L} (V : NilpotentVarietyPackage P) : Prop :=
  V.orbitClosureCondition

theorem nilpotent_variety_closed_from_evidence {L : NilpotentLieAlgebra} {P : CoadjointOrbitPackage L} (V : NilpotentVarietyPackage P) (E : NilpotentVarietyEvidence V) : NilpotentVarietyClosed V := by
  exact E.orbitClosureConditionClosed

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse
