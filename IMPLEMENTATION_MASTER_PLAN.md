# IMPLEMENTATION_MASTER_PLAN

Version: 0.1.0
Status: Draft
Owner: Lead Software Engineer

---

## Purpose

This document is the implementation reference for converting AI-EOS from architecture artifacts into a fully executable software platform.

It does not restate architecture. It defines the implementation structure, code organization, runtime strategy, deployment artifacts, and the exact work sequence for engineering teams.

This plan uses the following documents as normative references:
- `PRODUCT_DEFINITION.md`
- `TECHNOLOGY_BASELINE.md`
- `MASTER_DOCUMENT_INDEX.md`
- `FOUNDATION_META_MODEL_BLUEPRINT.md`
- `FOUNDATION_META_MODEL_CONCEPTS.md`
- `FOUNDATION_META_MODEL_DICTIONARY.md`
- `AI_EOS_KERNEL_ARCHITECTURE.md`
- `AI_EOS_COMPONENT_MODEL.md`
- `AI_EOS_DATA_MODEL.md`
- `AI_EOS_EXECUTION_MODEL.md`
- `AI_EOS_GENERATION_PIPELINE.md`
- `AI_EOS_DECISION_ENGINE.md`
- `AI_EOS_SERVICE_CONTRACTS.md`

## 1. Complete repository restructuring for implementation

The repository is currently documentation-first. For implementation, the repository must be restructured into code, deployment, infrastructure, tests, SDKs, and documentation support.

Proposed root layout:

- `/src`
  - `/java`
  - `/python`
  - `/typescript`
- `/sdk`
  - `/java`
  - `/python`
  - `/typescript`
- `/cli`
- `/deploy`
  - `/docker`
  - `/k8s`
  - `/helm`
  - `/manifests`
- `/ci`
- `/infra`
- `/tests`
- `/data-model`
- `/ops`
- `/scripts`
- `/docs` (retained for implementation guidance, runbooks, and API docs)
- `/specifications` (existing normative service contracts remain)
- `/templates`

A second phase can optionally split `/src/java` into service-specific repositories if build-time separation is required.

## 2. Source code directory tree

The implementation tree should be:

```
/AI-Enterprise-Operating-System
  /src
    /java
      /kernel
      /workflow
      /agent
      /decision
      /knowledge
      /memory
      /security
      /gateway
      /integration
      /observability
      /common
    /python
      /ai_adapters
      /llm_abstraction
      /tool_execution
      /connectors
      /etl
      /scripts
    /typescript
      /frontend
        /app
        /components
        /pages
        /services
        /lib
      /ui_library
  /sdk
    /java
    /python
    /typescript
  /cli
    /src
      /main
  /deploy
    /docker
    /k8s
    /helm
    /manifests
  /ci
    /tekton
    /argocd
    /scripts
  /infra
    /terraform
    /ansible
    /platform
  /tests
    /unit
    /integration
    /contract
    /performance
    /acceptance
  /data-model
    /sql
    /migration
    /ddl
    /seed
  /ops
    /runbooks
    /monitoring
    /release
  /scripts
  /tools
  /docs
  /specifications
  /templates
  /decisions
```

This tree is the starting point for code placement and not a high-level conceptual diagram.

## 3. Backend architecture

The backend implementation is a polyglot service platform with clearly separated executable modules.

Primary backend modules:

- `kernel-service`: Java Spring Boot service implementing kernel lifecycle, subsystem registration, global runtime state, and control-plane APIs.
- `workflow-service`: Java Spring Boot service wrapping Temporal workflow orchestration, workflow definition repository, and workflow state APIs.
- `agent-service`: Java Spring Boot service for agent runtime lifecycle, scheduler, and execution coordination.
- `decision-service`: Java Spring Boot service implementing Decision Engine APIs, model repository, policy application, and audit recording.
- `knowledge-service`: Java Spring Boot service for knowledge asset catalog, semantic search orchestration, and governance controls.
- `memory-service`: Java Spring Boot service for organizational memory persistence, query APIs, retention, and archival.
- `security-service`: Java Spring Boot service for authorization decisions, policy evaluation, and integration with Keycloak.
- `gateway-service`: Java Spring Boot API gateway service for external REST/gRPC traffic, request validation, authentication, and routing.
- `integration-service`: Java Spring Boot service for connectors, external adapters, and event adapters.
- `observability-service`: Java Spring Boot service for telemetry ingestion, log forwarding, tracing export, and health endpoints.

Shared modules:
- `common-models`: Java shared DTOs, event definitions, schema classes, and service contract types.
- `common-security`: authentication/authorization helpers, token parsing, and security utilities.
- `common-eventing`: Kafka producer/consumer utilities and event envelope definition.
- `common-persistence`: PostgreSQL repository base classes, migration utilities, and audit helpers.

Python backend modules:
- `python/ai_adapters`: model adapter services for LLMs, embedding generation, and tool orchestration.
- `python/llm_abstraction`: wrapper library exposing a stable interface for AI model providers.
- `python/tool_execution`: connectors for external tools invoked by agents.
- `python/connectors`: external system adapters and connector lifecycle code.

Frontend modules:
- `typescript/frontend/app`: UI application implementation with React and TypeScript.
- `typescript/frontend/services`: HTTP/gRPC client wrappers and authentication integration.
- `typescript/ui_library`: reusable design system components.

The backend modules are independent Maven projects with a shared parent build file and a common library drawer.

## 4. Frontend architecture

Frontend implementation is a React/TypeScript monorepo with UI modules grouped by capability.

Front-end packages:
- `app-shell`: authenticated admin/operator console.
- `workflow-console`: workflow authoring, execution monitoring, and state inspection.
- `decision-center`: decision request, rationale, and approval workflows.
- `knowledge-hub`: knowledge asset management and semantic search.
- `agent-dashboard`: agent inventory, runtime logs, and task management.
- `memory-browser`: organizational memory query and audit view.
- `platform-settings`: security, identity, and deployment configuration.

Implementation details:
- Use Vite for build and development.
- Use React Router for navigation.
- Use TypeScript with strict mode enabled.
- Use a component library such as Material UI or Tailwind CSS utility layer.
- Expose API clients in `/services/api` backed by `openapi-typescript` generated clients from backend contracts.
- Create a form-state library for workflow and decision input schemas.
- Implement observability pages driven by backend metrics APIs.

## 5. Kernel implementation strategy

The `kernel-service` is the control plane implementation. It will be the first backend component that is executable.

Kernel implementation tasks:
- implement service startup, shutdown, registration, and health management.
- define `kernel-control` REST and gRPC APIs from `AI_EOS_SERVICE_CONTRACTS.md`.
- implement global configuration loading, validation, and snapshot persistence.
- implement subsystem registry and lifecycle state store.
- implement event emission to Kafka for `SystemStarted`, `SystemStopping`, `SubsystemRegistered`, and `StateSnapshotCreated`.
- implement status polling and runtime state query endpoints.

Key implementation outputs:
- `kernel-service/src/main/java/.../KernelApplication.java`
- `kernel-service/src/main/java/.../controller/KernelController.java`
- `kernel-service/src/main/java/.../service/KernelLifecycleManager.java`
- `kernel-service/src/main/java/.../repository/SystemStateRepository.java`

Kernel is the first completed service and the central dependency for the rest of the platform.

## 6. Runtime implementation strategy

Runtime implementation is the code that enables services to execute, coordinate, and scale.

Implementation tasks:
- implement the runtime abstraction layer in `common-runtime`.
- add health checks, liveness/readiness endpoints, and service registration to Kafka and service registry.
- implement resource manager and health monitor capabilities in `runtime-service` or `kernel-service` as a runtime support module.
- implement service discovery and metadata propagation.
- implement event bus client infrastructure and runtime event schemas.

Runtime outputs:
- runtime-startup bootstrap classes.
- service heartbeat producer/consumer.
- event dispatch middleware.
- runtime state APIs.

## 7. Database implementation strategy

Persistence is implemented using PostgreSQL and Redis.

Database implementation tasks:
- translate `AI_EOS_DATA_MODEL.md` entities into SQL schema migrations in `/data-model/sql/migrations`.
- implement DDL and DML using Flyway or Liquibase in Java services.
- create separate schema modules for domains: identity, organization, workflow, decision, knowledge, memory, audit.
- implement repository classes per domain using Spring Data JPA or jOOQ.
- store immutable decision audit records, workflow checkpoints, knowledge asset metadata, and memory records with versioning.
- implement Redis for transient state: workflow locks, runtime caches, scheduler leases, agent execution coordination.
- implement a JSONB store for semi-structured payloads and policy definitions.

Database artifacts:
- `data-model/sql/migrations/V1__init_schema.sql`
- `data-model/sql/migrations/V2__workflow_tables.sql`
- `data-model/sql/migrations/V3__decision_tables.sql`
- `data-model/sql/migrations/V4__knowledge_tables.sql`
- `data-model/sql/migrations/V5__memory_tables.sql`
- `data-model/sql/migrations/V6__audit_tables.sql`

## 8. Event Bus implementation

Event bus implementation is Kafka-based.

Implementation tasks:
- implement a shared Kafka client library in `common-eventing`.
- define event envelope formats for all domain events in `common-models`.
- implement producer and consumer adapters in each service.
- implement durable event persistence for audit and replay support.
- implement event router and topic naming conventions: `kernel.events`, `workflow.events`, `decision.events`, `agent.events`, `knowledge.events`, `memory.events`, `security.events`.
- implement a `replayEvents()` endpoint in the event bus adapter service.

Implementation outputs:
- `common-eventing/src/main/java/.../KafkaEventPublisher.java`
- `common-eventing/src/main/java/.../KafkaEventSubscriber.java`
- Kafka deployment manifests in `/deploy/k8s/kafka`

## 9. Agent Runtime implementation

The agent runtime is an executable container and scheduler implementation.

Implementation tasks:
- implement `agent-service` with agent lifecycle, instantiation, execution, termination, and status APIs.
- implement runtime isolation using container-friendly execution contexts or process sandboxes.
- implement agent metadata and capability descriptors persisted in PostgreSQL.
- implement scheduler integration with resource manager.
- implement runtime contracts for tool invocation and context injection.
- implement agent health reporting and log forwarding.
- implement support for Python-based AI adapters as external services called by agents.

Implementation outputs:
- `agent-service/src/main/java/.../AgentController.java`
- `agent-service/src/main/java/.../AgentRuntimeContainer.java`
- `agent-service/src/main/java/.../AgentSchedulerService.java`
- `python/ai_adapters` service package for external AI model interactions

## 10. Workflow Engine implementation

Workflow implementation will be built on Temporal.

Implementation tasks:
- implement Temporal client integration in `workflow-service`.
- implement workflow definition repository and versioning.
- implement workflow instance start, resume, cancel, and query APIs.
- implement task dispatch requests to `agent-service` and human/task interaction channels.
- implement checkpointing and replay using Temporal state persistence.
- implement compensation and retry policies.
- implement workflow definition validation and schema enforcement.

Implementation outputs:
- `workflow-service/src/main/java/.../WorkflowOrchestrator.java`
- `workflow-service/src/main/java/.../WorkflowDefinitionRepository.java`
- `workflow-service/src/main/java/.../TemporalWorkflowClientConfig.java`

## 11. Decision Engine implementation

Decision Engine implementation is a standalone Java service.

Implementation tasks:
- implement decision model repository and registration APIs.
- implement rule execution integration with Drools.
- implement policy evaluation service and context service.
- implement risk/cost assessment modules.
- implement human approval workflow and decision rationale generation.
- implement audit and traceability persistence.
- implement event adapter for decision lifecycle events.
- implement safe fallback behavior and escalation logic.

Implementation outputs:
- `decision-service/src/main/java/.../DecisionEvaluatorController.java`
- `decision-service/src/main/java/.../PolicyEvaluationService.java`
- `decision-service/src/main/java/.../DroolsDecisionEngineAdapter.java`
- `decision-service/src/main/java/.../DecisionAuditRepository.java`

## 12. Knowledge Engine implementation

Knowledge Engine implementation is a Java service exposing catalog and search APIs.

Implementation tasks:
- implement knowledge asset registration, versioning, metadata, and classification APIs.
- implement Milvus integration for vector search.
- implement metadata search and semantic search query paths.
- implement indexing pipelines and refresh scheduling.
- implement knowledge lineage and governance controls.
- implement knowledge access authorization.

Implementation outputs:
- `knowledge-service/src/main/java/.../KnowledgeCatalogController.java`
- `knowledge-service/src/main/java/.../KnowledgeSearchService.java`
- `knowledge-service/src/main/java/.../MilvusClientAdapter.java`

## 13. Memory Engine implementation

Memory Engine implementation is a Java service with long-term persistence.

Implementation tasks:
- implement memory record write and query APIs.
- define memory record schema and retention policies.
- implement archival and purge workflows.
- implement query optimization and index support for memory retrieval.
- implement event-driven memory persistence for decision outcomes, workflow artifacts, and audit records.

Implementation outputs:
- `memory-service/src/main/java/.../MemoryController.java`
- `memory-service/src/main/java/.../MemoryRecordRepository.java`
- `memory-service/src/main/java/.../MemoryRetentionService.java`

## 14. Authentication implementation

Authentication is implemented via Keycloak and OIDC integration.

Implementation tasks:
- deploy Keycloak in `/deploy/k8s/keycloak`.
- implement OIDC client integration in `gateway-service` and each backend service.
- implement service credential handling for internal service-to-service authentication.
- implement JWT validation middleware in all Java services.
- implement identity provisioning automation for users and service accounts.

Implementation outputs:
- `security-service/src/main/java/.../KeycloakOidcConfig.java`
- `gateway-service/src/main/java/.../OidcAuthenticationFilter.java`
- `deploy/k8s/keycloak/keycloak-deployment.yaml`

## 15. Authorization implementation

Authorization is implemented as an RBAC/ABAC service backed by PostgreSQL.

Implementation tasks:
- implement `security-service` authorization APIs: `authorize()`, `checkPermission()`, `listRoles()`, `listPermissions()`.
- implement role, permission, user, and identity schemas in the data model.
- implement policy evaluation via OPA for security policy enforcement over resource actions.
- implement endpoint-level authorization middleware in `gateway-service`.
- implement admin APIs for role and permission management.

Implementation outputs:
- `security-service/src/main/java/.../AuthorizationController.java`
- `security-service/src/main/java/.../RolePermissionRepository.java`
- `security-service/src/main/java/.../OpaPolicyAdapter.java`

## 16. API implementation

API implementation is the concrete realization of service contracts.

Implementation tasks:
- translate `AI_EOS_SERVICE_CONTRACTS.md` REST and gRPC definitions into OpenAPI and Protobuf sources.
- implement REST controllers in Java services and gRPC server endpoints.
- implement API gateway routing for external clients.
- implement request/response validation and versioning.
- implement API documentation generation with Swagger/OpenAPI and gRPC reflection.
- implement API health and readiness probes.

Implementation outputs:
- `gateway-service/src/main/resources/openapi.yaml`
- `specifications/apis` generated API clients and service definitions
- `gateway-service/src/main/java/.../ApiGatewayController.java`

## 17. SDK implementation

SDK implementation is the developer-facing client layer.

Implementation tasks:
- implement Java SDK that wraps gRPC and REST service contracts.
- implement Python SDK for AI adapters and runtime integration.
- implement TypeScript SDK for frontend applications and CLI.
- implement SDK packaging, versioning, and distribution metadata.
- include authentication helpers, retry policies, and typed models.

Implementation outputs:
- `sdk/java/ai-eos-client` Maven module.
- `sdk/python/ai_eos_client` package.
- `sdk/typescript/ai-eos-client` npm package.

## 18. CLI implementation

The CLI is a command-line tool for operators and developers.

Implementation tasks:
- implement CLI commands: `bootstrap`, `deploy`, `status`, `workflow`, `decision`, `knowledge`, `memory`, `auth`, `refresh`, `logs`.
- implement CLI using Java with Picocli or Python with Click.
- implement direct API calls to gateway endpoints.
- implement local development mode for running against mini-clusters.

Implementation outputs:
- `cli/src/main/java/.../AiEosCli.java`
- `cli/README.md` usage guide.

## 19. Docker implementation

Implementation tasks:
- create Dockerfiles for each Java service and Python adapter.
- create shared base images for Java runtime, Python runtime, and TypeScript frontend.
- implement multi-stage builds and image provenance metadata.
- publish image tags aligned to repository versioning.
- implement local compose manifests for developer bootstrap.

Implementation outputs:
- `deploy/docker/kernel-service.Dockerfile`
- `deploy/docker/workflow-service.Dockerfile`
- `deploy/docker/agent-service.Dockerfile`
- `deploy/docker/frontend.Dockerfile`
- `deploy/docker/docker-compose.yaml`

## 20. Kubernetes deployment

Implementation tasks:
- create Helm charts for each service.
- create Kubernetes manifests for PostgreSQL, Redis, Kafka, Milvus, Temporal, Keycloak, and AI-EOS services.
- implement Namespace, ConfigMap, Secret, Service, Deployment, StatefulSet, Ingress, and NetworkPolicy resources.
- implement monitoring stack manifests for Prometheus, Grafana, Loki, and Jaeger.
- implement GitOps manifests for Argo CD.

Implementation outputs:
- `deploy/k8s/ai-eos-core/values.yaml`
- `deploy/k8s/ai-eos-core/templates/*.yaml`
- `deploy/k8s/platform-stack.yaml`
- `deploy/helm/ai-eos-chart/Chart.yaml`

## 21. CI/CD implementation

Implementation tasks:
- implement Tekton pipelines for build, test, package, and deploy.
- implement Argo CD application manifests for runtime deployment.
- implement pipeline steps for lint, unit test, integration test, container build, image push, and deployment.
- implement environment-specific Git branches and promotion pipelines.
- implement security scanning and policy checks in the CI pipeline.

Implementation outputs:
- `ci/tekton/build-pipeline.yaml`
- `ci/tekton/test-pipeline.yaml`
- `ci/tekton/deploy-pipeline.yaml`
- `ci/argocd/ai-eos-app.yaml`

## 22. Testing strategy

Testing must be implemented as code and automated.

Test types:
- unit tests for service classes and controller logic.
- integration tests for service interactions, database access, and Kafka messaging.
- contract tests using Pact for API boundaries.
- end-to-end smoke tests for service deploy and basic workflow execution.
- performance tests for agent scheduling, workflow throughput, and decision latency.
- security tests for authorization, authentication, and policy enforcement.

Implementation tasks:
- implement JUnit 5 tests for Java services.
- implement Mockito mocks for unit tests.
- implement Testcontainers for PostgreSQL, Kafka, Redis, Temporal, and Keycloak in integration tests.
- implement pytest tests for Python adapters.
- implement Jest tests for frontend components.
- implement k6 scripts for performance validation.
- integrate tests into CI pipeline with pass/fail gating.

## 23. Incremental implementation roadmap

Milestone 1: Foundations and runtime skeleton
- Repo restructure.
- Kernel service.
- PostgreSQL and Redis schema migration.
- Kafka event bus and basic producer/consumer.
- API gateway skeleton.
- local docker compose bootstrap.

Milestone 2: Workflow and agent basics
- workflow-service + Temporal integration.
- agent-service execution and scheduler.
- kernel routing of workflow and agent requests.
- frontend skeleton with login and dashboard.
- basic end-to-end workflow path.

Milestone 3: Decision and knowledge core
- decision-service with Drools policy execution.
- knowledge-service with Milvus integration.
- memory-service with write/query APIs.
- security-service authorization.
- SDK prototypes.

Milestone 4: Platform completeness
- full gateway and public API surface.
- user-facing consoles for workflows, decisions, knowledge, memory.
- CLI and SDK stabilization.
- Kubernetes deployment and GitOps.
- CI/CD and observability stack.

Milestone 5: ERP generation baseline
- generation pipeline implementation for business intent inputs.
- artifact scaffolding and deployment packaging.
- ERP generator integration with workflow and knowledge domains.
- first ERP generation end-to-end test.

Milestone 6: Production readiness
- multi-node scalability validation.
- governance, audit, and compliance features complete.
- performance and security hardening.
- final production milestone with monitored Kubernetes deployment.

## 24. Definition of Done for every milestone

Milestone 1 Done:
- repository layout created,
- kernel service compiles, starts, and exposes health APIs,
- database schema migrates successfully,
- Kafka broker starts and services can publish/consume sample events,
- local docker compose can bootstrap the minimal platform.

Milestone 2 Done:
- workflow-service can start a Temporal workflow instance,
- agent-service can accept and complete a simple task,
- kernel routes a workflow request to agent execution,
- frontend login and dashboard pages render with authenticated access,
- integration smoke tests pass.

Milestone 3 Done:
- decision-service can evaluate a decision against a loaded decision model,
- knowledge-service can register and search a knowledge asset,
- memory-service can persist and query memory records,
- security-service enforces RBAC for at least one cross-service operation,
- SDKs can call core APIs.

Milestone 4 Done:
- all core APIs from `AI_EOS_SERVICE_CONTRACTS.md` have runnable endpoints,
- frontend user flows for workflow, decision, knowledge, and memory exist,
- CLI executes platform lifecycle commands,
- Helm charts deploy the full stack to a Kubernetes test environment,
- CI/CD pipelines execute build and deploy to a staging cluster.

Milestone 5 Done:
- generation pipeline can ingest a business intent object and produce deployable artifacts,
- generated artifacts include backend, frontend, database migrations, and deployment manifests,
- ERP generator passes an end-to-end validation pipeline,
- generated package is deployable to the same Kubernetes environment.

Milestone 6 Done:
- production cluster runs the full platform under load,
- governance and audit logging are active,
- recovery and failover procedures are validated,
- documentation and runbooks exist for operations,
- release process includes versioned container images and deployment manifests.

## 25. Build order

1. Create `/src`, `/deploy`, `/ci`, `/data-model`, `/sdk`, `/cli`, `/tests` directories.
2. Implement database migration scaffold and shared persistence module.
3. Implement Kafka eventing shared library.
4. Implement `kernel-service` core.
5. Implement `gateway-service` API routing.
6. Implement `workflow-service` Temporal integration.
7. Implement `agent-service` scheduler and runtime.
8. Implement `security-service` authz and user/role models.
9. Implement `decision-service`.
10. Implement `knowledge-service`.
11. Implement `memory-service`.
12. Implement Python AI adapters and LLM abstraction.
13. Implement frontend application shell.
14. Implement SDKs and CLI.
15. Implement Docker images and local compose.
16. Implement Kubernetes and Helm deployment.
17. Implement CI/CD pipelines.
18. Implement observability stack.
19. Implement ERP generation pipeline.
20. Harden production readiness.

## 26. Parallel development opportunities

- `kernel-service`, `common-eventing`, and `data-model` can be built in parallel.
- `workflow-service` and `agent-service` can be developed concurrently after kernel scaffolding.
- `decision-service` and `knowledge-service` can be developed in parallel because they share events and common libraries but have separate domains.
- `memory-service` and `security-service` can be implemented in parallel with clear API contracts.
- frontend, SDK, and CLI can start once gateway and auth contracts exist.
- Docker/Kubernetes deployment and CI/CD pipelines can be built alongside service implementation.

## 27. Critical path

The critical path is:
1. `data-model` schema and persistence layer.
2. `common-eventing` Kafka integration.
3. `kernel-service` boot and control plane.
4. `gateway-service` API routing and auth.
5. `workflow-service` and `agent-service` runtime flow.
6. `decision-service` policy and audit.
7. `knowledge-service` vector search integration.
8. `memory-service` persistence.
9. Kubernetes deployment and CI/CD.

Any delay in the persistence, event bus, or gateway layers delays the entire platform.

## 28. Estimated source files

Initial implementation estimate:
- Java backend: 850 source files
- Python adapters: 150 source files
- TypeScript frontend: 320 source files
- SDKs: 120 source files
- CLI: 30 source files
- Deployment manifests: 180 files
- Tests: 600 files
- Total estimated source files: 2,250

## 29. Estimated classes

Estimated Java classes in initial implementation:
- Kernel/service classes: 40
- Workflow: 45
- Agent: 35
- Decision: 40
- Knowledge: 28
- Memory: 25
- Security: 30
- Gateway: 20
- Common/shared: 50
- Python adapter classes: 20
- Frontend components: 120
- SDK classes: 60
- CLI classes: 10
- Total estimated classes: 463

## 30. Estimated APIs

Estimated service API count:
- Kernel API endpoints: 12
- Workflow API endpoints: 18
- Agent API endpoints: 16
- Decision API endpoints: 14
- Knowledge API endpoints: 12
- Memory API endpoints: 10
- Security API endpoints: 18
- Gateway-level APIs: 22
- SDK entry points: 30
- CLI commands: 14
- Total estimated APIs: 156

## 31. Estimated database tables

Estimated tables:
- identity and auth: 12
- organization and tenant: 8
- workflow: 14
- agent: 12
- decision: 16
- knowledge: 14
- memory: 10
- audit: 10
- event metadata: 6
- observability and health: 8
- total estimated tables: 100

## 32. Estimated implementation duration

Estimated calendar duration for a dedicated team working full-time on this plan:
- foundation implementation and runtime skeleton: 8 weeks
- workflow, agent, and decision core: 10 weeks
- knowledge, memory, security, and gateway: 8 weeks
- frontend, SDK, CLI, deployment, and CI/CD: 8 weeks
- ERP generation pipeline and production hardening: 10 weeks
- total estimated duration: 44 weeks

This estimate assumes parallel work by multiple teams and a stable requirements baseline.

## 33. Team organization

Suggested team structure:

- Platform Core Team
  - Kernel lead
  - Runtime lead
  - Persistence engineer
  - Eventing engineer
- Workflow & Agent Team
  - Workflow lead
  - Agent runtime engineer
  - Temporal engineer
- Decision & Knowledge Team
  - Decision engine engineer
  - Policy engineer
  - Knowledge search engineer
- Security & Identity Team
  - Auth lead
  - Authorization engineer
  - Compliance engineer
- Frontend & SDK Team
  - React lead
  - UX/frontend engineer
  - SDK engineer
  - CLI engineer
- Deployment & Operations Team
  - Kubernetes engineer
  - CI/CD engineer
  - Observability engineer
  - Release engineer

Team organization should follow domain boundaries rather than architecture boundaries.

## 34. Repository migration plan

Step 1: add implementation root directories and move existing docs to `/docs`, `/specifications`, and `/decisions` if needed.
Step 2: initialize root build files: Maven parent POM, NPM workspace, Python package configuration.
Step 3: create skeletal modules for each service and shared library.
Step 4: add `.gitignore`, `README.md` updated for implementation, and developer bootstrap scripts.
Step 5: introduce the `data-model/sql` migration baseline and `deploy/docker` compose.
Step 6: commit the implementation scaffold before service code is added.
Step 7: progressively add service code, one module at a time, using the ordered backlog.

The repo migration must preserve existing documentation and add implementation artifacts under the new structure without deleting normative docs.

## 35. First executable milestone

Deliverables:
- repository restructure complete,
- `kernel-service` builds and starts,
- PostgreSQL and Redis launch locally,
- Kafka bootstrap with sample topics,
- `gateway-service` exposes `GET /health` and `GET /status`,
- sample event produced and consumed,
- local Docker Compose environment starts the skeleton platform.

This milestone yields the first executable software platform.

## 36. Minimum executable AI-EOS

Definition:
A deployable platform containing:
- kernel control plane,
- API gateway,
- workflow service able to start and track a simple workflow,
- agent service able to execute a stub task,
- event bus connectivity,
- PostgreSQL persistence,
- Keycloak authentication,
- frontend login and status page.

Minimum executable AI-EOS should support one authenticated user starting one workflow and receiving a completed agent result.

## 37. First ERP generation milestone

Deliverables:
- Generation engine component scaffolded in `src/java/generation` or `src/python/generation`.
- generated artifact model and packaging service implemented.
- business intent input schema accepted.
- generated backend, frontend, database migration, and deployment manifest artifacts produced in a repository output folder.
- validation harness that exercises generated ERP package deployment in a local test environment.

This milestone demonstrates the first operational ERP generation capability.

## 38. Final production milestone

Deliverables:
- full platform deployed to a Kubernetes production environment,
- complete governance and audit logging enabled,
- cross-service security policies enforced,
- scalable agent scheduling and workflow orchestration validated,
- generation engine integrated and producing deployable ERP packages,
- CI/CD pipelines fully automated through Tekton and Argo CD,
- production runbooks and incident process documented.

This is the final executable platform release.

## Implementation backlog ordered exactly in sequence the code should be written

1. Create implementation repository scaffold and restructure directories.
2. Initialize Maven parent build and NPM workspace.
3. Implement shared persistence module and PostgreSQL schema migration baseline.
4. Implement shared eventing module with Kafka producer/consumer.
5. Implement common DTOs and event envelope models.
6. Implement `kernel-service` startup, bootstrap, health, and subsystem registry.
7. Implement `gateway-service` authentication middleware and routing.
8. Implement `common-security` JWT/OIDC helpers.
9. Implement `security-service` identity, role, and permission models.
10. Implement `workflow-service` Temporal client and workflow controller.
11. Implement `agent-service` runtime container and scheduler skeleton.
12. Implement `decision-service` model repository and evaluation endpoint.
13. Implement `knowledge-service` asset metadata repository.
14. Implement `memory-service` record persistence and query API.
15. Implement Redis support for transient state and scheduler leases.
16. Implement persistent event topic creation and sample event handlers.
17. Add API contract generation from `AI_EOS_SERVICE_CONTRACTS.md`.
18. Implement frontend app shell, authentication, and home dashboard.
19. Implement basic workflow request UI and status polling.
20. Implement SDK generation and Java client wrappers.
21. Implement CLI bootstrap and status commands.
22. Add Dockerfiles for kernel, gateway, workflow, agent, decision, knowledge, memory, and frontend.
23. Add Docker Compose for local platform bootstrap.
24. Add Kubernetes manifests and Helm chart skeletons.
25. Add Tekton pipeline definitions for build and test.
26. Add Argo CD application manifests for staging deployment.
27. Implement unit and integration tests for kernel, workflow, agent, and security.
28. Implement contract tests for gateway and decision APIs.
29. Implement frontend component tests and SDK validation tests.
30. Implement performance test scripts for workflow and decision latency.
31. Implement knowledge search index integration with Milvus.
32. Implement decision engine Drools integration and policy evaluation.
33. Implement memory retention and archival workflows.
34. Implement Keycloak deployment and OIDC integration.
35. Implement production-ready Kubernetes deployment and monitoring stack.
36. Implement generation engine artifact scaffolding and packaging.
37. Validate end-to-end workflow, decision, knowledge, and memory execution.
38. Perform production hardening, governance, and audit validation.
39. Complete documentation of usage, deployment, and operations runbooks.
40. Release first production-ready AI-EOS platform.
