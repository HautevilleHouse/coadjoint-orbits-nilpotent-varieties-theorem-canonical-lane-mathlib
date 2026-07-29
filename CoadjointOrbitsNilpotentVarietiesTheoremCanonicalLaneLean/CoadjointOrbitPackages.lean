import CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.NilpotentLieAlgebra

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure CoadjointOrbitPackage (L : NilpotentLieAlgebra) where
  coadjointAction : L.carrier → L.dual → L.dual
  orbitRelation : L.dual → L.dual → Prop
  orbitSpace : Type
  symplecticForm : orbitSpace → orbitSpace → ℝ
  orbitClosedCondition : Prop

structure CoadjointOrbitEvidence {L : NilpotentLieAlgebra} (P : CoadjointOrbitPackage L) where
  coadjointActionClosed : P.coadjointAction = λ g f => f ∘ (λ x => g + x)
  orbitRelationClosed : ∀ f g, P.orbitRelation f g ↔ ∃ x, g = f + x
  symplecticFormClosed : ∀ v w, P.symplecticForm v w = 0
  orbitClosedConditionClosed : P.orbitClosedCondition

def CoadjointOrbitClosed {L : NilpotentLieAlgebra} (P : CoadjointOrbitPackage L) : Prop :=
  P.orbitClosedCondition

theorem coadjoint_orbit_closed_from_evidence {L : NilpotentLieAlgebra} (P : CoadjointOrbitPackage L) (E : CoadjointOrbitEvidence P) : CoadjointOrbitClosed P := by
  exact E.orbitClosedConditionClosed

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse
