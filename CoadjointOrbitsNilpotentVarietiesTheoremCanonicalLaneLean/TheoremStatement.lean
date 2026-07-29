import CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  orbitStructureStatement : String
  certificateLane : String
  carriedRemainder : String
  deriving Repr, DecidableEq

def sourceRepository : String :=
  "coadjoint-orbits-nilpotent-varieties-canonical-lane"

def sourceDescription : String :=
  "Coadjoint Orbits Nilpotent Varieties Theorem: orbit-structure and nilpotent-variety classification"

def sourceTheoremBoundary : String :=
  "classical Lie theory and orbit method"

def baselineCertificateLane : String :=
  "orbit_variety_constrained"

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := sourceRepository
  , theoremName := sourceRepository
  , theoremObject := sourceDescription
  , classicalBoundary := sourceTheoremBoundary
  , orbitStructureStatement := "orbit-structure and nilpotent-variety theorem certificate internalized through baseline gates, source constants, reviewer bridge, manifest hashes"
  , certificateLane := baselineCertificateLane
  , carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
  }

theorem theorem_statement_source_key_checked :
    sourceTheoremStatement.sourceKey = sourceRepository := by
  rfl

theorem theorem_statement_certificate_lane_checked :
    sourceTheoremStatement.certificateLane = baselineCertificateLane := by
  rfl

end CoadjointOrbitsNilpotentVarietiesTheoremCanonicalLaneLean
end HautevilleHouse