import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure CoadjointNilpotentAdmittedObject where
  lieAlgebra : NilpotentLieAlgebra
  orbit : CoadjointOrbit lieAlgebra
  variety : NilpotentVariety lieAlgebra
  orbitInVariety : orbit ∈ variety.carrier
  jordanDecomposition : JordanDecomposition lieAlgebra
  nilpotentCone : NilpotentCone lieAlgebra
  orbitInVarietyTerm : orbitInVariety

def CoadjointWitnessClosed (O : CoadjointNilpotentAdmittedObject) : Prop :=
  O.orbitInVariety

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse