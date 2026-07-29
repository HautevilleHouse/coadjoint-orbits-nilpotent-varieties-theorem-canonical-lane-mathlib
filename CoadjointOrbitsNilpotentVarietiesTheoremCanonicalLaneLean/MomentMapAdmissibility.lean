import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure MomentMapAdmissibility where
  symplecticManifold : Type u
  groupAction : Type v → Type v
  momentMap : Type u → Type u
  momentMapEquivariant : Prop
  fiberZero : Prop
  reduction : Prop
  momentMapEquivariantTerm : momentMapEquivariant
  fiberZeroTerm : fiberZero
  reductionTerm : reduction

structure MomentMapAdmissibilityEvidence (M : MomentMapAdmissibility) where
  momentMapEquivariantClosed : M.momentMapEquivariant
  fiberZeroClosed : M.fiberZero
  reductionClosed : M.reduction

def MomentMapAdmissibilityClosed (M : MomentMapAdmissibility) : Prop :=
  M.momentMapEquivariant ∧ M.fiberZero ∧ M.reduction

theorem moment_map_admissibility_closed_from_evidence
    (M : MomentMapAdmissibility) (E : MomentMapAdmissibilityEvidence M) :
    MomentMapAdmissibilityClosed M := by
  exact And.intro E.momentMapEquivariantClosed
    (And.intro E.fiberZeroClosed E.reductionClosed)

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse