# FOUNDATION_META_MODEL_DICTIONARY

This document is the canonical AI-EOS dictionary. It captures the concepts explicitly supported by existing repository artifacts and prepares the official vocabulary for FOUND-0002.

> Note: All concepts are derived from `PRODUCT_DEFINITION.md`, `MASTER_DOCUMENT_INDEX.md`, `META_MODEL_ANALYSIS.md`, `FOUNDATION_META_MODEL_BLUEPRINT.md`, and `FOUNDATION_META_MODEL_CONCEPTS.md`.

---

## AI-EOS Product

1. Canonical Name: AI-EOS Product
2. Short Definition: The vendor-neutral enterprise operating system architecture for AI organizations.
3. Extended Definition: The authoritative product definition that governs all AI-EOS architecture, governance, documentation, and specification artifacts. It captures mission, scope, stakeholders, boundaries, and product category.
4. Why the concept exists: To anchor the project and ensure every artifact maps back to an agreed product statement and scope.
5. Architecture Role: Motivation/Strategy concept.
6. Parent Concept: MotivationalEntity.
7. Child Concepts: Product Scope, Vision, Stakeholder, Capability.
8. Related Concepts: Governance, Policy, Reference Implementation, Architecture Artifact.
9. Allowed Relationships: defines, governs, contains, dependsOn, isReferencedBy.
10. Forbidden Relationships: executes, isObservedBy, isStoredIn.
11. Lifecycle Stage: Approved / Operated (product-level lifecycle is strategic and ongoing).
12. Examples: AI Enterprise Operating System as defined in `PRODUCT_DEFINITION.md`.
13. Non-examples: A specific agent implementation or runtime service.
14. Candidate Attributes: productName, version, status, scopeSummary, missionStatement.
15. Candidate Operations: validateScope(), updateVision(), approveChange(), mapArtifact().
16. Constraints: Must not contradict `PRODUCT_DEFINITION.md`; must remain vendor-neutral.
17. Future Extension Points: product variants, industry-specific product profiles.

## Organization

1. Canonical Name: Organization
2. Short Definition: A structured set of human and agent roles collaborating to achieve business objectives.
3. Extended Definition: A logical entity representing the collective of AI agents, human participants, roles, and governance aligned within an enterprise or organizational unit operating under AI-EOS.
4. Why the concept exists: To model the enterprise boundary within which AI-EOS operates and to distinguish entity scope from technical architecture.
5. Architecture Role: Business/Conceptual entity.
6. Parent Concept: OrganizationalEntity.
7. Child Concepts: Human Participant, AI Agent, Role.
8. Related Concepts: Capability, Governance, Workflow, Product Scope.
9. Allowed Relationships: contains, isPartOf, participatesIn, governs, dependsOn.
10. Forbidden Relationships: defines (unless in a governance capacity), isStoredIn.
11. Lifecycle Stage: Operated / Evolving.
12. Examples: An AI-enabled product development division, a governance board, a service organization.
13. Non-examples: A single agent or a runtime service.
14. Candidate Attributes: name, scope, boundary, objectives, stakeholders.
15. Candidate Operations: assignRole(), defineCapability(), reviewGovernance(), scaleOrganization().
16. Constraints: Must be aligned with Product Scope and Governance; must not represent a physical infrastructure boundary.
17. Future Extension Points: multi-organization federation, ecosystem partnerships.

## AI Agent

1. Canonical Name: AI Agent
2. Short Definition: A software entity with autonomous or semi-autonomous capabilities.
3. Extended Definition: An AI-enabled component that performs specialized tasks, collaborates with humans and other agents, and participates in workflows within the organization.
4. Why the concept exists: To distinguish intelligent software actors from human participants and infrastructure resources.
5. Architecture Role: Application/Conceptual entity.
6. Parent Concept: OrganizationalEntity.
7. Child Concepts: Task Agent, Coordination Agent, Governance Agent, Knowledge Agent, Human-in-the-Loop Agent (proposed extensions).
8. Related Concepts: Workflow, Runtime Service, Communication Protocol, Governance.
9. Allowed Relationships: participatesIn, executes, isExecutedBy, communicatesWith, isGovernedBy.
10. Forbidden Relationships: contains (agents are not containers), isStoredIn.
11. Lifecycle Stage: Proposed, Draft, Approved, Implemented, Operated, Deprecated, Retired.
12. Examples: task automation agent, review coordination agent, knowledge retrieval agent.
13. Non-examples: a database, a human user, a runtime platform.
14. Candidate Attributes: agentType, autonomyLevel, capabilities, governanceProfile, lifecycleState.
15. Candidate Operations: executeTask(), communicate(), requestApproval(), updatePolicyCompliance().
16. Constraints: Must be governed by at least one Policy or Governance concept; must not imply a specific vendor implementation.
17. Future Extension Points: agent role taxonomy, agent trust levels, agent certification status.

## Human Participant

1. Canonical Name: Human Participant
2. Short Definition: A person interacting with agents, exercising governance, or providing oversight.
3. Extended Definition: A human actor in AI-EOS who participates in workflows, makes decisions, reviews outputs, or holds responsibility for governance and compliance.
4. Why the concept exists: To preserve the human-in-the-loop element and distinguish human roles from software agents.
5. Architecture Role: Business/Conceptual entity.
6. Parent Concept: OrganizationalEntity.
7. Child Concepts: Role, Stakeholder.
8. Related Concepts: Stakeholder, Workflow, Decision Process, Governance.
9. Allowed Relationships: participatesIn, influences, isGovernedBy, owns.
10. Forbidden Relationships: executes (unless in a workflow role), isStoredIn.
11. Lifecycle Stage: Operated / Evolving.
12. Examples: an architect, compliance officer, operator.
13. Non-examples: a monitoring system, a runtime service.
14. Candidate Attributes: roleName, responsibilities, authorityLevel, contactInformation.
15. Candidate Operations: reviewDecision(), approvePolicy(), assignTask(), escalateIssue().
16. Constraints: Must be distinct from Stakeholder in usage; must not be treated as a software entity.
17. Future Extension Points: formal human role taxonomy, human capability profiles.

## Governance

1. Canonical Name: Governance
2. Short Definition: The system of rules, processes, roles, and controls for safe, legal, and consistent AI-EOS operation.
3. Extended Definition: The set of structures and practices that oversee AI-EOS implementation, manage risk, enforce policies, ensure compliance, and maintain accountability across the product and organization.
4. Why the concept exists: To make governance explicit rather than an implicit metadata layer.
5. Architecture Role: Motivational/Policy entity.
6. Parent Concept: MotivationalEntity.
7. Child Concepts: Policy, Compliance Requirement, Decision Process, ADR.
8. Related Concepts: Product Scope, Security Control, Document Family, Stakeholder.
9. Allowed Relationships: defines, constrains, isGovernedBy, records, enforces.
10. Forbidden Relationships: executes, isStoredIn.
11. Lifecycle Stage: Draft, Approved, Operated, Deprecated, Retired.
12. Examples: governance framework, architecture review board charter.
13. Non-examples: individual policy statements unlinked to a governance framework.
14. Candidate Attributes: governanceModel, roles, processDefinitions, authority.
15. Candidate Operations: approvePolicy(), auditCompliance(), resolveDispute(), updateGovernance().
16. Constraints: Must be recorded and traceable; must not be optional for dynamic entities.
17. Future Extension Points: governance domains, governance maturity levels.

## Policy

1. Canonical Name: Policy
2. Short Definition: A formal rule or standard that constrains behavior and compliance.
3. Extended Definition: A documented obligation or constraint within AI-EOS that governs agent behavior, workflow execution, security controls, and organizational conduct.
4. Why the concept exists: To provide explicit rule-based architecture controls.
5. Architecture Role: Motivational/Rule entity.
6. Parent Concept: Governance.
7. Child Concepts: Security Policy, Compliance Policy, Workflow Policy, Agent Policy (proposed extensions).
8. Related Concepts: Governance, Compliance Requirement, Security Control, Decision Process.
9. Allowed Relationships: constrains, isGovernedBy, appliesTo, ensures, isDefinedBy.
10. Forbidden Relationships: executes, isStoredIn.
11. Lifecycle Stage: Draft, Approved, Operated, Deprecated, Retired.
12. Examples: access policy, data protection policy, interoperability policy.
13. Non-examples: informal guidelines, implementation code.
14. Candidate Attributes: policyId, scope, enforcementLevel, relatedGovernance, status.
15. Candidate Operations: validateCompliance(), updatePolicy(), assignPolicy(), auditPolicy().
16. Constraints: Must be governed and traceable; must not be conflated with Compliance Requirement.
17. Future Extension Points: policy templates, policy applicability rules.

## Decision Process

1. Canonical Name: Decision Process
2. Short Definition: The workflow and controls for making, validating, and recording decisions.
3. Extended Definition: A structured process within AI-EOS that defines how decisions are proposed, reviewed, approved, and documented, including the roles and tools involved.
4. Why the concept exists: To make decision-making explicit and auditable.
5. Architecture Role: Behavioral/Operational entity.
6. Parent Concept: Governance.
7. Child Concepts: Decision Workflow, Approval Step, Escalation Path.
8. Related Concepts: Workflow, ADR, Audit Trail, Policy.
9. Allowed Relationships: isGovernedBy, generates, uses, isRecordedBy, enforces.
10. Forbidden Relationships: stores, isStoredIn.
11. Lifecycle Stage: Draft, Approved, Operated, Deprecated.
12. Examples: architecture decision workflow, compliance approval cycle.
13. Non-examples: ad hoc decisions, informal approvals.
14. Candidate Attributes: processId, stages, responsibleRoles, auditRequirements.
15. Candidate Operations: initiateDecision(), approveDecision(), recordDecision(), escalateDecision().
16. Constraints: Must be linked to Governance and Audit Trail; must not bypass policy.
17. Future Extension Points: automated decision support, decision traceability mechanisms.

## Workflow

1. Canonical Name: Workflow
2. Short Definition: A defined sequence of tasks and transitions used to accomplish work.
3. Extended Definition: An ordered set of activities, roles, tools, and rules that collectively produce business outcomes or architecture outputs within AI-EOS.
4. Why the concept exists: To represent the process dimension of AI-EOS and distinguish it from static architecture entities.
5. Architecture Role: Behavioral entity.
6. Parent Concept: BehavioralEntity.
7. Child Concepts: Task, Activity, Transition, Event.
8. Related Concepts: Workflow Orchestration, Decision Process, AI Agent, Human Participant.
9. Allowed Relationships: isExecutedBy, participatesIn, isGovernedBy, produces, consumes.
10. Forbidden Relationships: contains (unless decomposed into sub-workflows), isStoredIn.
11. Lifecycle Stage: Proposed, Draft, Approved, Implemented, Operated, Deprecated, Retired.
12. Examples: human-agent collaboration workflow, compliance workflow.
13. Non-examples: a static organization chart, infrastructure topology.
14. Candidate Attributes: workflowId, objective, actors, states, inputs, outputs.
15. Candidate Operations: startWorkflow(), completeTask(), transitionState(), auditWorkflow().
16. Constraints: Must be subject to Governance/Policy if it affects agents or decisions.
17. Future Extension Points: workflow patterns, workflow variants.

## Workflow Orchestration

1. Canonical Name: Workflow Orchestration
2. Short Definition: The mechanism that coordinates tasks, agents, humans, and runtime services to execute workflows.
3. Extended Definition: The runtime or governance capability responsible for sequencing workflow activities, triggering tasks, and managing execution across agents and services.
4. Why the concept exists: To separate workflow definition from execution coordination.
5. Architecture Role: Logical/Operational entity.
6. Parent Concept: BehavioralEntity.
7. Child Concepts: Orchestration Engine, Event Dispatcher, Task Scheduler.
8. Related Concepts: Workflow, Runtime Service, Execution Environment, Communication Protocol.
9. Allowed Relationships: orchestrates, executes, coordinates, isObservedBy, isGovernedBy.
10. Forbidden Relationships: contains, isStoredIn.
11. Lifecycle Stage: Implemented, Operated.
12. Examples: workflow engine, orchestration service.
13. Non-examples: a static workflow definition.
14. Candidate Attributes: orchestrationMode, supportedWorkflows, runtimeDependencies.
15. Candidate Operations: triggerTask(), handleEvent(), retryTask(), logExecution().
16. Constraints: Must not be defined as a simple document; must be a runtime capability.
17. Future Extension Points: distributed orchestration, adaptive orchestration.

## Knowledge Asset

1. Canonical Name: Knowledge Asset
2. Short Definition: A unit of organizational knowledge.
3. Extended Definition: Any structured or unstructured item of knowledge the organization uses, including models, data definitions, documents, policies, and memory representations.
4. Why the concept exists: To capture knowledge as a first-class architecture element rather than buried in implementation details.
5. Architecture Role: Information entity.
6. Parent Concept: InformationEntity.
7. Child Concepts: Model, Data Definition, Policy Document, Memory Object.
8. Related Concepts: Organizational Memory, AI Agent, Workflow, Governance.
9. Allowed Relationships: isStoredIn, isConsumedBy, isProducedBy, isGovernedBy.
10. Forbidden Relationships: executes, isObservedBy.
11. Lifecycle Stage: Draft, Approved, Operated, Deprecated, Retired.
12. Examples: a knowledge model, policy document, organizational playbook.
13. Non-examples: runtime logs, infrastructure resources.
14. Candidate Attributes: assetType, retentionPolicy, owner, metadata.
15. Candidate Operations: retrieveAsset(), updateAsset(), archiveAsset(), classifyAsset().
16. Constraints: Must be governed and may require access controls.
17. Future Extension Points: knowledge ontology, knowledge lifecycle states.

## Organizational Memory

1. Canonical Name: Organizational Memory
2. Short Definition: The persistent information store and retrieval architecture.
3. Extended Definition: The architecture that captures historical context, decisions, artifacts, and structured knowledge for reuse, auditing, and continuous improvement.
4. Why the concept exists: To provide a stable, consistent representation of organizational knowledge and history.
5. Architecture Role: Information/Technology entity.
6. Parent Concept: InformationEntity.
7. Child Concepts: Historical Memory, Reference Knowledge, Decision Record, Operational Context.
8. Related Concepts: Knowledge Asset, Audit Trail, Runtime Service, Governance.
9. Allowed Relationships: stores, isStoredIn, contains, isProtectedBy.
10. Forbidden Relationships: executes, participatesIn.
11. Lifecycle Stage: Operated.
12. Examples: decision repositories, knowledge graphs, memory stores.
13. Non-examples: ephemeral runtime cache, workflow task.
14. Candidate Attributes: persistenceMechanism, retrievalCapabilities, retentionPolicy.
15. Candidate Operations: storeItem(), queryMemory(), purgeItem(), indexContent().
16. Constraints: Must support auditability and governance; must not be treated as a generic data store.
17. Future Extension Points: memory classification, memory governance policies.

## Communication Protocol

1. Canonical Name: Communication Protocol
2. Short Definition: Formal interface definitions and messaging patterns.
3. Extended Definition: The conventions and standards used by agents, humans, and services to exchange information within the AI-EOS architecture.
4. Why the concept exists: To capture interoperability requirements and ensure consistent communication semantics.
5. Architecture Role: Logical/Technology entity.
6. Parent Concept: BehavioralEntity.
7. Child Concepts: Messaging Pattern, Interface Definition, Data Exchange Format.
8. Related Concepts: Interoperability, Runtime Service, Security Control.
9. Allowed Relationships: communicatesWith, isProtectedBy, supports, isGovernedBy.
10. Forbidden Relationships: contains, isStoredIn.
11. Lifecycle Stage: Draft, Approved, Implemented.
12. Examples: API contract, message flow definition.
13. Non-examples: internal function call, undocumented integration.
14. Candidate Attributes: protocolName, version, supportedMediaTypes.
15. Candidate Operations: validateMessage(), negotiateProtocol(), logMessage().
16. Constraints: Must be explicit and vendor-neutral.
17. Future Extension Points: protocol profiles, interoperability certification.

## Interoperability

1. Canonical Name: Interoperability
2. Short Definition: The ability of components to work together under vendor-neutral standards.
3. Extended Definition: The degree to which agents, workflows, services, and external systems can exchange information, coordinate behavior, and collaborate without vendor lock-in.
4. Why the concept exists: To make vendor neutrality and cross-component integration an explicit architectural requirement.
5. Architecture Role: Constraint/Quality attribute.
6. Parent Concept: MotivationalEntity.
7. Child Concepts: Protocol Interoperability, Data Interoperability, Workflow Interoperability.
8. Related Concepts: Communication Protocol, Vendor Neutrality, Execution Environment.
9. Allowed Relationships: constrains, dependsOn, supports, isImplementedBy.
10. Forbidden Relationships: contains, isStoredIn.
11. Lifecycle Stage: Operational.
12. Examples: standard message formats, open APIs.
13. Non-examples: proprietary binary protocol, vendor-locked integration.
14. Candidate Attributes: interoperabilityLevel, complianceRating, supportedStandards.
15. Candidate Operations: assessInteroperability(), certifyIntegration().
16. Constraints: Must be enforced by Governance and Policy.
17. Future Extension Points: interoperability maturity models.

## Execution Environment

1. Canonical Name: Execution Environment
2. Short Definition: A logical environment where agents and runtime services execute.
3. Extended Definition: The logical or physical setting that hosts agents and runtime services, including compute, containers, and service platforms.
4. Why the concept exists: To distinguish where execution occurs from the execution logic itself.
5. Architecture Role: Technology/Logical entity.
6. Parent Concept: TechnologyEntity.
7. Child Concepts: Container Environment, Platform Environment, Hosting Environment.
8. Related Concepts: Runtime Service, Infrastructure Resource, Security Control.
9. Allowed Relationships: dependsOn, isProtectedBy, contains, hosts.
10. Forbidden Relationships: executes, isGovernedBy (except via policy).
11. Lifecycle Stage: Implemented, Operated.
12. Examples: Kubernetes cluster, managed execution platform.
13. Non-examples: a workflow definition, a policy.
14. Candidate Attributes: environmentType, isolationLevel, location.
15. Candidate Operations: allocateResource(), scaleEnvironment(), monitorHealth().
16. Constraints: Must not be vendor-specific in the core model.
17. Future Extension Points: environment profiles, environment certification.

## Runtime Service

1. Canonical Name: Runtime Service
2. Short Definition: The service layer that supports execution, orchestration, monitoring, and lifecycle for agents and workflows.
3. Extended Definition: The operational service capabilities that manage execution, coordination, observability, and lifecycle of AI-EOS components.
4. Why the concept exists: To model the runtime support layer separately from the environment and agents.
5. Architecture Role: Technology/Logical entity.
6. Parent Concept: TechnologyEntity.
7. Child Concepts: Orchestration Service, Monitoring Service, Lifecycle Service.
8. Related Concepts: Execution Environment, Workflow Orchestration, Observability.
9. Allowed Relationships: supports, coordinates, provides, dependsOn, isObservedBy.
10. Forbidden Relationships: contains, isStoredIn.
11. Lifecycle Stage: Implemented, Operated.
12. Examples: workflow engine, orchestration service.
13. Non-examples: a static architecture artifact.
14. Candidate Attributes: serviceName, responsibilities, availability.
15. Candidate Operations: startService(), stopService(), handleEvent().
16. Constraints: Must be treated as a service, not an agent.
17. Future Extension Points: runtime service patterns, service certification.

## Infrastructure Resource

1. Canonical Name: Infrastructure Resource
2. Short Definition: Physical or virtual resources required to host execution environments and services.
3. Extended Definition: The underlying compute, storage, networking, and platform resources that enable the runtime and execution environment for AI-EOS.
4. Why the concept exists: To separate infrastructure from runtime logic and application behavior.
5. Architecture Role: Technology entity.
6. Parent Concept: TechnologyEntity.
7. Child Concepts: Compute Resource, Storage Resource, Network Resource.
8. Related Concepts: Execution Environment, Security Control, Vendor Neutrality.
9. Allowed Relationships: supports, hosts, isProtectedBy, dependsOn.
10. Forbidden Relationships: governs, executes.
11. Lifecycle Stage: Operated.
12. Examples: virtual machine, cloud storage, network segment.
13. Non-examples: a policy, a workflow.
14. Candidate Attributes: resourceType, capacity, location.
15. Candidate Operations: allocate(), deallocate(), monitorUsage().
16. Constraints: Must not introduce vendor-specific semantics.
17. Future Extension Points: resource abstraction profiles.

## Security Control

1. Canonical Name: Security Control
2. Short Definition: A protective measure that enforces confidentiality, integrity, availability, and trust.
3. Extended Definition: Technical or procedural safeguards defined within AI-EOS to protect execution environments, data, communications, and governance boundaries.
4. Why the concept exists: To make security explicit and enforceable in the core model.
5. Architecture Role: Technology/Motivational entity.
6. Parent Concept: TechnologyEntity.
7. Child Concepts: Access Control, Encryption Control, Authentication Control.
8. Related Concepts: Policy, Trust Boundary, Compliance Requirement.
9. Allowed Relationships: protects, enforces, isGovernedBy, appliesTo.
10. Forbidden Relationships: contains, executes.
11. Lifecycle Stage: Implemented, Operated.
12. Examples: access control enforcement, audit logging.
13. Non-examples: a general guideline without enforcement.
14. Candidate Attributes: controlType, effectiveness, scope.
15. Candidate Operations: enforceControl(), verifyCompliance().
16. Constraints: Must be explicit and not only metadata.
17. Future Extension Points: security control catalog, control maturity.

## Trust Boundary

1. Canonical Name: Trust Boundary
2. Short Definition: The line between domains of differing control or authority.
3. Extended Definition: A boundary that separates zones with different security postures, responsibilities, or data governance characteristics.
4. Why the concept exists: To make boundary conditions explicit for security and governance.
5. Architecture Role: Technology/Security entity.
6. Parent Concept: OrganizationalEntity.
7. Child Concepts: Internal Boundary, External Boundary, Data Boundary.
8. Related Concepts: Security Control, Governance, Execution Environment.
9. Allowed Relationships: separates, protects, isProtectedBy, contains.
10. Forbidden Relationships: executes, isStoredIn.
11. Lifecycle Stage: Operated.
12. Examples: boundary between internal systems and external services.
13. Non-examples: an infrastructure resource without boundary semantics.
14. Candidate Attributes: boundaryType, controlOwner, trustLevel.
15. Candidate Operations: defineBoundary(), reviewBoundary().
16. Constraints: Must be explicit and tied to security controls.
17. Future Extension Points: boundary topology, trust models.

## Observability

1. Canonical Name: Observability
2. Short Definition: The ability to monitor, trace, log, and analyze behavior.
3. Extended Definition: The capabilities and mechanisms used to understand AI-EOS behavior through instrumentation, logging, metrics, and tracing.
4. Why the concept exists: To ensure visibility into runtime behavior and support monitoring and auditing.
5. Architecture Role: Operational/Quality concept.
6. Parent Concept: OperationalEntity.
7. Child Concepts: Monitoring, Tracing, Logging, Analytics.
8. Related Concepts: Audit Trail, Runtime Service, Workflow.
9. Allowed Relationships: observes, isObservedBy, generates, supports.
10. Forbidden Relationships: governs, isStoredIn.
11. Lifecycle Stage: Implemented, Operated.
12. Examples: telemetry platform, trace collection.
13. Non-examples: a static policy document.
14. Candidate Attributes: observabilityLevel, coverage, retentionPeriod.
15. Candidate Operations: collectMetrics(), analyzeLogs().
16. Constraints: Must not be conflated with audit trail.
17. Future Extension Points: observability maturity, analytics models.

## Audit Trail

1. Canonical Name: Audit Trail
2. Short Definition: The recorded evidence of actions, decisions, and changes.
3. Extended Definition: The persistent record of events, decisions, and changes generated by AI-EOS components for traceability, compliance, and accountability.
4. Why the concept exists: To provide evidence and historical context for governance and operations.
5. Architecture Role: Information/Operational entity.
6. Parent Concept: InformationEntity.
7. Child Concepts: Evidence Record, Decision Record.
8. Related Concepts: Governance, Compliance Requirement, Organizational Memory.
9. Allowed Relationships: isStoredIn, generates, isGovernedBy, supports.
10. Forbidden Relationships: executes, participatesIn.
11. Lifecycle Stage: Operated.
12. Examples: decision logs, event records.
13. Non-examples: transient metrics without persistence.
14. Candidate Attributes: recordId, timestamp, provenance.
15. Candidate Operations: recordEvent(), queryTrail(), archiveTrail().
16. Constraints: Must be persistent and auditable.
17. Future Extension Points: audit analytics, evidence federation.

## Compliance Requirement

1. Canonical Name: Compliance Requirement
2. Short Definition: A legal, regulatory, or policy mandate that must be satisfied.
3. Extended Definition: A defined requirement in AI-EOS that constrains behavior and architecture to satisfy external and internal mandates.
4. Why the concept exists: To align AI-EOS with external obligations and avoid risk.
5. Architecture Role: Motivational/Rule entity.
6. Parent Concept: MotivationalEntity.
7. Child Concepts: Regulatory Requirement, Internal Control Requirement.
8. Related Concepts: Policy, Governance, Security Control, Audit Trail.
9. Allowed Relationships: constrains, isCompliedWithBy, dependsOn, isGovernedBy.
10. Forbidden Relationships: executes, contains.
11. Lifecycle Stage: Draft, Approved, Operated.
12. Examples: GDPR requirement, corporate security mandate.
13. Non-examples: a technical guideline without obligation.
14. Candidate Attributes: requirementId, source, status, applicability.
15. Candidate Operations: assessCompliance(), documentEvidence().
16. Constraints: Must be traceable and enforceable.
17. Future Extension Points: compliance catalog.

## Capability

1. Canonical Name: Capability
2. Short Definition: A discrete competency or function AI-EOS must provide.
3. Extended Definition: A measurable ability of AI-EOS, such as decision management, memory management, interoperability, or workflow orchestration.
4. Why the concept exists: To express the product’s functional scope and align architecture to business outcomes.
5. Architecture Role: Motivational/Business entity.
6. Parent Concept: MotivationalEntity.
7. Child Concepts: Decision Management Capability, Memory Management Capability, Interoperability Capability.
8. Related Concepts: Product Scope, Organization, AI Agent, Workflow.
9. Allowed Relationships: realizes, supports, dependsOn, isGovernedBy.
10. Forbidden Relationships: contains, stores.
11. Lifecycle Stage: Defined, Implemented, Operated.
12. Examples: governance capability, knowledge management capability.
13. Non-examples: a single policy or technical artifact.
14. Candidate Attributes: capabilityName, purpose, maturityLevel.
15. Candidate Operations: assessCapability(), mapCapability().
16. Constraints: Must align to Product Scope.
17. Future Extension Points: capability maps, capability heatmaps.

## Architecture Artifact

1. Canonical Name: Architecture Artifact
2. Short Definition: A documented output, model, or specification within the AI-EOS repository.
3. Extended Definition: Any authoritative documentation, model, or specification used to define or communicate AI-EOS architecture, governance, or operations.
4. Why the concept exists: To distinguish actual architectural deliverables from generic documents.
5. Architecture Role: Artifact entity.
6. Parent Concept: ArtifactEntity.
7. Child Concepts: Specification, ADR, Reference Implementation, Document Family.
8. Related Concepts: Product Scope, Governance, Document Family.
9. Allowed Relationships: defines, isDefinedBy, references, supports, isGovernedBy.
10. Forbidden Relationships: executes, isStoredIn.
11. Lifecycle Stage: Draft, Approved, Retired.
12. Examples: master index, meta-model blueprint, product definition.
13. Non-examples: personal notes, email messages.
14. Candidate Attributes: artifactType, status, owner, revision.
15. Candidate Operations: publishArtifact(), reviseArtifact(), archiveArtifact().
16. Constraints: Must map to governance and product scope.
17. Future Extension Points: artifact metadata schema.

## Reference Implementation

1. Canonical Name: Reference Implementation
2. Short Definition: A concrete example or pattern validating AI-EOS concepts.
3. Extended Definition: A practical exemplar that demonstrates how AI-EOS architecture and specifications can be realized in a real or simulated implementation.
4. Why the concept exists: To validate that conceptual architecture can be applied in practice.
5. Architecture Role: Implementation/Migration entity.
6. Parent Concept: ArtifactEntity.
7. Child Concepts: Deployment Pattern, Operations Pattern, Integration Example.
8. Related Concepts: Architecture Artifact, Specification, Governance.
9. Allowed Relationships: validates, implements, references, dependsOn.
10. Forbidden Relationships: governs, isStoredIn.
11. Lifecycle Stage: Proposed, Implemented, Operated, Deprecated.
12. Examples: sample deployment pattern, governance implementation pattern.
13. Non-examples: conceptual text without practical example.
14. Candidate Attributes: implementationScope, status, dependencies.
15. Candidate Operations: validateDesign(), documentPattern().
16. Constraints: Must be linked to architecture artifacts and governance.
17. Future Extension Points: implementation playbooks.

## Document Family

1. Canonical Name: Document Family
2. Short Definition: A logical grouping of artifacts such as governance, security, or runtime.
3. Extended Definition: A category used to organize related AI-EOS documents and specifications for consistency and navigation.
4. Why the concept exists: To structure the repository and align documents to architecture domains.
5. Architecture Role: Artifact/Organizational entity.
6. Parent Concept: ArtifactEntity.
7. Child Concepts: Governance Family, Security Family, Runtime Family, Operations Family.
8. Related Concepts: Architecture Artifact, Specification, ADR.
9. Allowed Relationships: contains, groups, organizes, isGovernedBy.
10. Forbidden Relationships: executes, isStoredIn.
11. Lifecycle Stage: Static.
12. Examples: `docs/08-Security/`, `specifications/agents/`.
13. Non-examples: a single document without family association.
14. Candidate Attributes: familyName, purpose, domain.
15. Candidate Operations: addDocument(), reviewFamily().
16. Constraints: Must not be treated as a model concept in runtime.
17. Future Extension Points: cross-family relationships.

## Architecture Decision Record (ADR)

1. Canonical Name: Architecture Decision Record (ADR)
2. Short Definition: A formal record of a significant architecture decision and its rationale.
3. Extended Definition: Documentation that captures decisions, trade-offs, and rationale in the AI-EOS architecture process.
4. Why the concept exists: To provide traceability and governance for architecture choices.
5. Architecture Role: Artifact/Governance entity.
6. Parent Concept: ArtifactEntity.
7. Child Concepts: Decision Record, Decision Rationale.
8. Related Concepts: Governance, Product Scope, Policy, Architecture Artifact.
9. Allowed Relationships: records, isReferencedBy, supports, isGovernedBy.
10. Forbidden Relationships: executes, isStoredIn.
11. Lifecycle Stage: Draft, Approved, Retired.
12. Examples: documentation strategy ADR.
13. Non-examples: informal meeting notes.
14. Candidate Attributes: decisionId, date, status, contributors.
15. Candidate Operations: createADR(), reviewADR(), publishADR().
16. Constraints: Must be produced by a defined ADR process.
17. Future Extension Points: ADR categories.

## Stakeholder

1. Canonical Name: Stakeholder
2. Short Definition: An individual or organization with an interest in AI-EOS.
3. Extended Definition: Any party affected by, involved in, or responsible for AI-EOS, including executives, architects, operators, and users.
4. Why the concept exists: To identify who must be engaged and whose interests must be considered.
5. Architecture Role: Motivational/Business entity.
6. Parent Concept: MotivationalEntity.
7. Child Concepts: Executive Stakeholder, Technical Stakeholder, Operational Stakeholder.
8. Related Concepts: Human Participant, Governance, Capability.
9. Allowed Relationships: influences, isInfluencedBy, participatesIn, owns.
10. Forbidden Relationships: executes, isStoredIn.
11. Lifecycle Stage: Static / Ongoing.
12. Examples: CTO, compliance officer, platform engineer.
13. Non-examples: infrastructure component.
14. Candidate Attributes: stakeholderType, interestArea, authority.
15. Candidate Operations: consult(), notify(), assignResponsibility().
16. Constraints: Must be distinct from Human Participant in usage.
17. Future Extension Points: stakeholder engagement model.

## Product Scope

1. Canonical Name: Product Scope
2. Short Definition: The explicit boundaries of what AI-EOS includes and excludes.
3. Extended Definition: The defined set of capabilities, domains, and exclusions that constrain AI-EOS.
4. Why the concept exists: To prevent scope creep and keep the model aligned with product definition.
5. Architecture Role: Motivational/Constraint entity.
6. Parent Concept: MotivationalEntity.
7. Child Concepts: In-Scope Item, Out-of-Scope Item.
8. Related Concepts: AI-EOS Product, Governance, Capability.
9. Allowed Relationships: constrains, isDefinedBy, dependsOn.
10. Forbidden Relationships: executes, isStoredIn.
11. Lifecycle Stage: Defined, Reviewed.
12. Examples: enterprise governance, workflow orchestration.
13. Non-examples: specific cloud service.
14. Candidate Attributes: inScopeList, outOfScopeList, revision.
15. Candidate Operations: updateScope(), validateScope().
16. Constraints: Must be documented and traceable to `PRODUCT_DEFINITION.md`.
17. Future Extension Points: scope boundary models.

## Lifecycle

1. Canonical Name: Lifecycle
2. Short Definition: The stages through which entities evolve from creation to retirement.
3. Extended Definition: The generic model of states and transitions applicable to AI agents, documents, workflows, and other dynamic entities.
4. Why the concept exists: To make state management explicit and consistent across the repository.
5. Architecture Role: Behavioral/Operational entity.
6. Parent Concept: BehavioralEntity.
7. Child Concepts: Proposed, Draft, Approved, Implemented, Operated, Deprecated, Retired.
8. Related Concepts: ADR, Workflow, AI Agent, Architecture Artifact.
9. Allowed Relationships: appliesTo, governs, transitionsTo.
10. Forbidden Relationships: contains, isStoredIn.
11. Lifecycle Stage: N/A (meta-concept).
12. Examples: agent lifecycle, document lifecycle.
13. Non-examples: a one-off status field without defined transitions.
14. Candidate Attributes: stateName, validTransitions.
15. Candidate Operations: transitionState(), validateState().
16. Constraints: Must be defined for all dynamic entities.
17. Future Extension Points: lifecycle variants for different artifact classes.

## Vendor Neutrality

1. Canonical Name: Vendor Neutrality
2. Short Definition: The principle of avoiding vendor lock-in and supporting multiple implementations.
3. Extended Definition: A constraint that requires AI-EOS core concepts and interfaces to remain implementation-agnostic and interoperable across vendors.
4. Why the concept exists: To preserve the product’s vendor-neutral stance and ensure long-term portability.
5. Architecture Role: Constraint/Quality attribute.
6. Parent Concept: MotivationalEntity.
7. Child Concepts: Vendor Neutrality Constraint, Interoperability Constraint.
8. Related Concepts: Interoperability, Infrastructure Resource, Communication Protocol.
9. Allowed Relationships: constrains, supports, isImplementedBy.
10. Forbidden Relationships: governs, contains.
11. Lifecycle Stage: Operational.
12. Examples: open standard API requirement.
13. Non-examples: proprietary platform dependency.
14. Candidate Attributes: neutralityLevel, applicability.
15. Candidate Operations: assessVendorNeutrality().
16. Constraints: Must apply to core model concepts.
17. Future Extension Points: vendor-neutral certification.

## Specification

1. Canonical Name: Specification
2. Short Definition: A formalized contract or documented definition of interfaces, behavior, or requirements.
3. Extended Definition: A formal artifact that defines AI-EOS interfaces, APIs, workflow behavior, runtime contracts, or domain requirements.
4. Why the concept exists: To separate formal contract definitions from narrative architecture.
5. Architecture Role: Artifact entity.
6. Parent Concept: ArtifactEntity.
7. Child Concepts: API Specification, Workflow Specification, Security Specification.
8. Related Concepts: Architecture Artifact, Document Family, Reference Implementation.
9. Allowed Relationships: defines, isDefinedBy, references, supports.
10. Forbidden Relationships: governs, isStoredIn.
11. Lifecycle Stage: Draft, Approved, Operated.
12. Examples: `SPEC-0001-API-Catalog.md`.
13. Non-examples: informal design notes.
14. Candidate Attributes: specId, scope, version, status.
15. Candidate Operations: reviewSpec(), approveSpec(), publishSpec().
16. Constraints: Must be traceable to product definition and governance.
17. Future Extension Points: specification metadata.

## Notes

- Ambiguities are highlighted where concepts overlap: Governance/Policy/Compliance Requirement; Workflow/Workflow Orchestration; Execution Environment/Runtime Service/Infrastructure Resource; Observability/Audit Trail.
- Duplicated concepts are present in the repository as broad terms and artifact categories, especially: Architecture Artifact, Specification, ADR, Document Family.
- Missing definitions remain for the proposed extension concepts such as Agent Role, Data Domain, Control Domain, Evidence Record, and Service Contract.
- This dictionary should be treated as the core vocabulary for FOUND-0002, with explicit review of family and relationship constraints.
