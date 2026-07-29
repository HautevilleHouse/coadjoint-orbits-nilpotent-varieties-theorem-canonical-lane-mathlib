import CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.NilpotentOrbitClassification

/-!
# Quantization and Associated Variety Package
-/

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure QuantizationAssociatedVarietyPackage {G : CoadjointLieAlgebraPackage}
    {M : HamiltonianGspacePackage G} {C : MomentMapGeometryPackage M}
    {N : NilpotentConePackage C} {P : NilpotentOrbitClassificationPackage N}
    (Q : QuantizationDataPackage P) where
  quantizationDefined : Prop
  associatedVarietyComputed : Prop
  multiplicityFreedRigid : Prop
  coadjointGeometricQuantized : Prop

structure QuantizationAssociatedVarietyEvidence {G : CoadjointLieAlgebraPackage}
    {M : HamiltonianGspacePackage G} {C : MomentMapGeometryPackage M}
    {N : NilpotentConePackage C} {P : NilpotentOrbitClassificationPackage N}
    {Q : QuantizationDataPackage P} (R : QuantizationAssociatedVarietyPackage Q) where
  quantizationDefinedClosed : R.quantizationDefined
  associatedVarietyComputedClosed : R.associatedVarietyComputed
  multiplicityFreedRigidClosed : R.multiplicityFreedRigid
  coadjointGeometricQuantizedClosed : R.coadjointGeometricQuantized

def QuantizationAssociatedVarietyClosed {G : CoadjointLieAlgebraPackage}
    {M : HamiltonianGspacePackage G} {C : MomentMapGeometryPackage M}
    {N : NilpotentConePackage C} {P : NilpotentOrbitClassificationPackage N}
    {Q : QuantizationDataPackage P} (R : QuantizationAssociatedVarietyPackage Q) : Prop :=
  R.quantizationDefined ∧ R.associatedVarietyComputed ∧ R.multiplicityFreedRigid ∧ R.coadjointGeometricQuantized

theorem quantization_associated_variety_closed_from_evidence
    {G : CoadjointLieAlgebraPackage} {M : HamiltonianGspacePackage G}
    {C : MomentMapGeometryPackage M} {N : NilpotentConePackage C}
    {P : NilpotentOrbitClassificationPackage N} {Q : QuantizationDataPackage P}
    (R : QuantizationAssociatedVarietyPackage Q) (E : QuantizationAssociatedVarietyEvidence R) :
    QuantizationAssociatedVarietyClosed R := by
  exact And.intro E.quantizationDefinedClosed
    (And.intro E.associatedVarietyComputedClosed
      (And.intro E.multiplicityFreedRigidClosed E.coadjointGeometricQuantizedClosed))

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse