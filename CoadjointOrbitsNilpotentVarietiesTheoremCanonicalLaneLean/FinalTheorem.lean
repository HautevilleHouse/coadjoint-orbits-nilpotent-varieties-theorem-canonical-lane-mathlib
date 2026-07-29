import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

def ConstrainedCoadjointNilpotentVarietiesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_coadjoint_nilpotent_varieties_endgame (A : AdmissibleClass) : ConstrainedCoadjointNilpotentVarietiesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse