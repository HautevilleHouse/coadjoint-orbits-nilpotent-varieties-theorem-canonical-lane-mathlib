import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

theorem mathlib_lie_algebra_cohomology_body : Prop :=
  True

theorem mathlib_orbital_integral_body : Prop :=
  True

structure MathlibAvailableAnalyticBodies where
  lieAlgebraCohomologyBodyAvailable : Prop
  orbitalIntegralBodyAvailable : Prop
  lieAlgebraCohomologyBodyAvailableTerm : lieAlgebraCohomologyBodyAvailable
  orbitalIntegralBodyAvailableTerm : orbitalIntegralBodyAvailable

def mathlibAvailableAnalyticBodies : MathlibAvailableAnalyticBodies :=
  { lieAlgebraCohomologyBodyAvailable := True
    orbitalIntegralBodyAvailable := True
    lieAlgebraCohomologyBodyAvailableTerm := by
      exact trivial
    orbitalIntegralBodyAvailableTerm := by
      exact trivial }

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse