import CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure NilpotentLieAlgebraPackage where
  lieAlgebra : NilpotentLieAlgebra
  lowerCentralSeriesLength : Nat
  isNilpotent : Prop
  lieBracketBilinear : Prop
  jacobiIdentity : Prop
  nilpotentOrder : lowerCentralSeriesLength ≤ 5
  bracketStructure : Prop

structure NilpotentLieAlgebraEvidence (L : NilpotentLieAlgebraPackage) where
  isNilpotentClosed : L.isNilpotent
  lieBracketBilinearClosed : L.lieBracketBilinear
  jacobiIdentityClosed : L.jacobiIdentity
  nilpotentOrderClosed : L.nilpotentOrder
  bracketStructureClosed : L.bracketStructure

def NilpotentLieAlgebraClosed (L : NilpotentLieAlgebraPackage) : Prop :=
  L.isNilpotent ∧ L.lieBracketBilinear ∧ L.jacobiIdentity ∧ L.nilpotentOrder ∧ L.bracketStructure

theorem nilpotent_lie_algebra_closed_from_evidence (L : NilpotentLieAlgebraPackage) (E : NilpotentLieAlgebraEvidence L) : NilpotentLieAlgebraClosed L := by
  exact And.intro E.isNilpotentClosed (And.intro E.lieBracketBilinearClosed (And.intro E.jacobiIdentityClosed (And.intro E.nilpotentOrderClosed E.bracketStructureClosed)))

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse
