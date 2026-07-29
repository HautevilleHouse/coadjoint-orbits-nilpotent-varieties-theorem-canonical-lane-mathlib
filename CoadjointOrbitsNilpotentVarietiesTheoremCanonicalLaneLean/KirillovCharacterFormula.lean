import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure KirillovCharacterPackage {G : CoadjointAdmittedObject} where
  orbit : Type u
  representation : Type v
  characterFormula : G.orbit → ℂ
  coadjointInvariance : Prop
  orbitalIntegral : Prop
  invarianceWitness : coadjointInvariance
  integralWitness : orbitalIntegral

def KirillovCharacterClosed {G : CoadjointAdmittedObject} (K : KirillovCharacterPackage G) : Prop :=
  K.coadjointInvariance ∧ K.orbitalIntegral

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse