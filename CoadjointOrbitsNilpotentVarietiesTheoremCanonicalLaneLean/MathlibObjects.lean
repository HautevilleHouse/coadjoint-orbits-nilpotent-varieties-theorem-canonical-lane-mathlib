import CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure NilpotentLieAlgebra where
  carrier : Type
  lieBracket : carrier → carrier → carrier
  nilpotentClass : Nat

structure CoadjointOrbitSpace where
  lieAlgebra : NilpotentLieAlgebra
  orbitSet : Type
  symplecticStructure : Prop

structure CoadjointNilpotentAdmittedObject where
  space : CoadjointOrbitSpace
  orbitIsClosed : Prop
  nilpotentVarietyContained : Prop
  modelVariety : Type
  modelClosedEmbedding : Prop
  conclusion : modelClosedEmbedding

structure CoadjointEndgameState where
  object : CoadjointNilpotentAdmittedObject

def OrbitClosureClosed (O : CoadjointNilpotentAdmittedObject) : Prop :=
  O.modelClosedEmbedding

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse
