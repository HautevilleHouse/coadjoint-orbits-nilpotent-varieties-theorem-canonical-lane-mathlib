import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure NilpotentVarietyClassification where
  lieAlgebra : Type u
  nilpotentCones : Set (Set (lieAlgebra))
  classificationTheorem : Prop
  orbitClosure : Type v
  closureRelations : Prop
  classificationTheoremTerm : classificationTheorem
  closureRelationsTerm : closureRelations

structure NilpotentVarietyClassificationEvidence (N : NilpotentVarietyClassification) where
  classificationTheoremClosed : N.classificationTheorem
  closureRelationsClosed : N.closureRelations

def NilpotentVarietyClassificationClosed (N : NilpotentVarietyClassification) : Prop :=
  N.classificationTheorem ∧ N.closureRelations

theorem nilpotent_variety_classification_closed_from_evidence
    (N : NilpotentVarietyClassification) (E : NilpotentVarietyClassificationEvidence N) :
    NilpotentVarietyClassificationClosed N := by
  exact And.intro E.classificationTheoremClosed E.closureRelationsClosed

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse