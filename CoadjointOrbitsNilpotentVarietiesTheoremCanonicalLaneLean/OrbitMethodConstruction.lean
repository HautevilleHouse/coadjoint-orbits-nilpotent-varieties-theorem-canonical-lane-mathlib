import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure OrbitMethodConstruction where
  orbitCover : Type u
  polarizationData : Type v
  irreducibility : Prop
  orbitParameterization : Prop
  irreducibilityTerm : irreducibility
  orbitParameterizationTerm : orbitParameterization

structure OrbitMethodConstructionEvidence (O : OrbitMethodConstruction) where
  irreducibilityClosed : O.irreducibility
  orbitParameterizationClosed : O.orbitParameterization

def OrbitMethodConstructionClosed (O : OrbitMethodConstruction) : Prop :=
  O.irreducibility ∧ O.orbitParameterization

theorem orbit_method_construction_closed_from_evidence
    (O : OrbitMethodConstruction) (E : OrbitMethodConstructionEvidence O) :
    OrbitMethodConstructionClosed O := by
  exact And.intro E.irreducibilityClosed E.orbitParameterizationClosed

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse