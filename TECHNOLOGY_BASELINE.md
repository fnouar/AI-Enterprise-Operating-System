# TECHNOLOGY_BASELINE

Version: 0.1.0
Status: Draft
Owner: Enterprise Chief Architect

---

## 1. Purpose

This document fixes the definitive technology choices for AI-EOS. It establishes a normative, implementation-ready technology baseline for the platform, and justifies each choice using objective criteria aligned to AI-EOS functional and non-functional requirements.

This document is the authoritative reference for implementation planning and technology evaluation. It is not a wishlist: it selects technologies only when they meet AI-EOS requirements for vendor neutrality, scalability, governance, security, observability, and enterprise-grade maintainability.

## 2. Scope

This baseline covers:
- programming languages and frameworks,
- persistence and database technologies,
- workflow orchestration,
- event streaming and messaging,
- rule execution,
- vector search,
- frontend stack,
- authentication and identity,
- container orchestration,
- observability,
- CI/CD,
- testing.

Out of scope:
- foundation AI model training platforms,
- GPU hardware selection,
- organization-specific business strategy,
- proprietary cloud provider features.

## 3. Baseline Principles

AI-EOS technology decisions are governed by these principles:
- Vendor neutrality: avoid technology that locks the platform to a single cloud or AI provider.
- Replaceability: each major component must be replaceable without redesigning the platform.
- Enterprise maturity: prefer technologies with established adoption, large communities, and long-term support.
- Interoperability: standards-based interfaces and open protocols are required.
- Scalability: chosen technologies must support thousands of agents, workflows, and cross-tenant enterprise scale.
- Governance and auditability: technologies must support traceability, secure provenance, and compliance auditing.
- Maintainability: the baseline favors well-documented ecosystems and broad engineering talent availability.
- Open source preferred: avoid proprietary lock-in unless a clear enterprise justification exists.
- Performance balance: choose technologies that provide predictable, operationally manageable performance in distributed deployments.

## 4. Definitive Technology Choices

### 4.1 Programming Languages and Frameworks

Primary runtime:
- Java 17+ with Spring Boot 3.x for core AI-EOS services.

AI integration runtime:
- Python 3.11+ with FastAPI for AI adapter services that orchestrate models, prompt pipelines, and tooling.

Frontend:
- React with TypeScript.

Justification:
- Java/Spring Boot is enterprise-grade, vendor-neutral, highly mature, and well suited to distributed microservices, security integration, and long-term maintainability. It supports strong typing, advanced concurrency, and a wide ecosystem for service orchestration, observability, and data access.
- Python is the industry-standard integration language for AI/LLM tooling and model adapters. Isolating Python to AI-specific connectors preserves core platform consistency while enabling direct use of AI libraries when necessary.
- React/TypeScript is the de facto standard for enterprise web UIs. It offers a mature ecosystem, predictable type safety, and broad developer availability.

Alternatives considered:
- Kotlin/Micronaut/Quarkus: technically viable, but Spring Boot delivers broader enterprise ecosystem and lower adoption risk for a normative baseline.
- Node.js backend: good for developer productivity, but its single-threaded model and weaker enterprise security ecosystem make it a secondary option.

### 4.2 Database and Persistence

Primary transactional database:
- PostgreSQL 16+.

Caching and transient state:
- Redis.

Justification:
- PostgreSQL is open source, vendor-neutral, ACID-compliant, and supports JSONB for semi-structured data. It is widely adopted, supports multi-tenant schemas, and has a rich ecosystem for backup, replication, and high availability.
- Redis provides ephemeral state, distributed locks, queues, and caching for session and workflow coordination without imposing permanent persistence requirements.

Alternatives evaluated:
- MySQL/MariaDB: mature but less advanced JSON and indexing capabilities than PostgreSQL.
- CockroachDB: strong distribution model, but introduces operational complexity and a different consistency model; selected as a future alternative rather than baseline.

### 4.3 Workflow Engine

Primary workflow engine:
- Temporal.

Justification:
- Temporal provides a durable, event-driven workflow runtime with first-class support for long-running processes, retries, compensation, and multi-language client SDKs. It aligns with AI-EOS requirements for workflow orchestration, stateful task coordination, and human-in-the-loop workflow persistence.
- Temporal is vendor-neutral, open source, and optimized for large-scale enterprise workflows.

Alternatives evaluated:
- Camunda/Zeebe: strong BPMN support, but less mature multi-language workflow SDKs and higher complexity for the event-driven patterns AI-EOS requires.
- Apache Airflow: oriented to batch pipelines rather than interactive enterprise workflows.

### 4.4 Event Bus

Primary event streaming platform:
- Apache Kafka.

Justification:
- Kafka is the de facto enterprise event streaming platform. It supports durable, partitioned, replayable logs, high throughput, and exactly-once semantics when configured appropriately.
- Kafka supports the event-driven architecture required by AI-EOS, enables service decoupling, and scales horizontally across multi-tenant environments.

Alternatives evaluated:
- Apache Pulsar: mature, but less widely adopted and a higher operational ramp than Kafka for this baseline.
- RabbitMQ: strong for message queues, but not ideal for event streaming and replay semantics at enterprise scale.

### 4.5 Rule Engine

Primary business rule engine:
- Drools (KIE).

Justification:
- Drools is a mature, open-source business rule management system with a strong Java ecosystem. It supports declarative rules, decision tables, and complex event processing suitable for AI-EOS decision management and business rule evaluation.
- Drools integrates naturally with Spring Boot and the Java-based Decision Engine service.

Alternatives evaluated:
- Open Policy Agent (OPA): excellent for policy enforcement, but not optimized for business rule modeling and decision workflows. OPA remains the preferred policy evaluation engine for security and compliance interfaces.
- Custom rule engines: rejected due to poor maintainability and higher implementation risk.

### 4.6 Vector Search Engine

Primary vector search:
- Milvus.

Justification:
- Milvus is open-source, vendor-neutral, and designed specifically for large-scale vector similarity search. It supports horizontal scaling, multiple index types, and integration with embedding pipelines.
- Milvus satisfies AI-EOS requirements for organizational knowledge retrieval, semantic search, and long-term memory access.

Alternatives evaluated:
- Weaviate: strong feature set, but newer ecosystem and less enterprise production maturity than Milvus at the time of baseline.
- Pinecone: managed service with strong capabilities, but vendor lock-in and not aligned with AI-EOS vendor-neutral baseline.
- PostgreSQL + PGVector: acceptable for small-scale deployments, but insufficient for enterprise vector search throughput; retained as an edge-case fallback, not baseline.

### 4.7 Frontend Architecture

Primary frontend stack:
- React with TypeScript,
- Vite or Create React App for build,
- Tailwind CSS or Material UI for component consistency.

Justification:
- React and TypeScript together provide high productivity, strong typing, and broad developer ecosystem. They support rich operator dashboards, workflow design consoles, and audit interfaces.
- Using a standard component library ensures consistent enterprise UX and maintainability.

Alternatives evaluated:
- Angular: enterprise-grade but heavier and more opinionated; React provides faster team onboarding and broader library support.
- Vue: technically capable, but lower enterprise adoption in this class of platform than React.

### 4.8 Authentication and Identity

Primary identity provider:
- Keycloak.

Authentication protocol:
- OpenID Connect / OAuth 2.0.

Service authentication:
- mTLS and JWT-based service tokens.

Justification:
- Keycloak is open source, vendor-neutral, and supports OIDC, OAuth2, SAML, and user federation. It satisfies AI-EOS security requirements for identity management, single sign-on, role-based access control, and multi-factor authentication.
- Using OIDC/OAuth2 aligns with industry standards and allows integration with external identity providers later.
- mTLS plus JWT service tokens enforce strong service-to-service authentication and support zero-trust architecture patterns.

Alternatives evaluated:
- Auth0/Azure AD: strong products but vendor lock-in and not aligned with the vendor-neutral baseline.
- Custom authentication: rejected for security risk and maintainability.

### 4.9 Container Orchestration

Primary orchestration platform:
- Kubernetes.

Supporting tools:
- Helm for packaging,
- Tekton for CI pipeline execution,
- Argo CD for continuous deployment.

Justification:
- Kubernetes is the enterprise standard for container orchestration and supports the cloud-neutral, multi-environment deployment model AI-EOS requires.
- Helm provides consistent packaging of microservices.
- Tekton and Argo CD are open-source, Kubernetes-native CI/CD solutions offering vendor-neutral automation and declarative deployment.

Alternatives evaluated:
- HashiCorp Nomad: less mature ecosystem for the full enterprise stack and fewer native Kubernetes integration points.
- GitHub Actions/GitLab CI: excellent hosted solutions, but dependent on external platforms; selected only as a secondary option for organizations that choose managed CI.

### 4.10 Observability

Primary observability stack:
- OpenTelemetry for instrumentation,
- Prometheus for metrics,
- Grafana for dashboards,
- Loki for logs,
- Jaeger for distributed tracing.

Justification:
- OpenTelemetry is the open standard for telemetry data across services and languages. It enables consistent observability for Java, Python, and frontend components.
- Prometheus is the default open-source monitoring system for Kubernetes-native systems and suits the AI-EOS requirement for service-level telemetry.
- Grafana is a mature visualization layer with broad integration.
- Loki is a scalable, Grafana-native log aggregation engine for structured logs.
- Jaeger provides distributed tracing for event-driven workflows and policy executions.

Alternatives evaluated:
- Datadog/New Relic: powerful managed offerings, but vendor-dependent and not aligned with the vendor-neutral baseline.
- Elastic Stack: capable, but greater operational complexity for this platform baseline.

### 4.11 CI/CD

Primary pipeline tools:
- Tekton Pipelines for CI,
- Argo CD for CD.

Justification:
- Tekton provides Kubernetes-native CI pipelines, strong separation of tasks, and the ability to express reusable pipeline steps.
- Argo CD supports declarative GitOps deployments for Kubernetes and enforces consistency between repository state and cluster state.
- This combination supports AI-EOS requirements for independent service delivery, auditability, and deployment repeatability.

Alternatives evaluated:
- Jenkins: mature but heavier and less cloud-native.
- GitHub Actions: strong, but not vendor-neutral.

### 4.12 Tests

Primary testing frameworks:
- Java: JUnit 5, Mockito, Testcontainers,
- Python: pytest,
- TypeScript: Jest, React Testing Library,
- Contract testing: Pact,
- Load and performance: k6.

Justification:
- JUnit and Mockito are industry standards for Java service unit and integration tests. Testcontainers enables realistic dependency testing with ephemeral databases and Kafka brokers.
- pytest is the standard Python testing framework and integrates with AI adapter services.
- Jest and React Testing Library provide robust coverage for React/TypeScript UI components.
- Pact supports consumer-driven contract testing for REST/gRPC interfaces.
- k6 provides open-source, scriptable performance testing aligned to enterprise load validation.

Alternatives evaluated:
- Spock/Geb: powerful but less mainstream than JUnit.
- Cypress: useful for end-to-end UI tests, but not chosen as the baseline for unit/component testing; it remains an optional addition for end-to-end web validation.

## 5. Alternative Evaluation by Criteria

### 5.1 Programming Language and Backend Framework

| Candidate | Performance | Maturity | Ecosystem | Maintainability | License | Scalability | Baseline Decision |
|---|---|---|---|---|---|---|---|
| Java + Spring Boot | High | Very high | Very large | Very high | Apache 2.0 | High | Selected |
| Kotlin + Spring Boot | High | High | Large | High | Apache 2.0 | High | Alternative |
| Go + gRPC | High | High | Large | Medium-high | Apache 2.0 | High | Alternate service layer only |
| Node.js + Express | Medium | High | Large | Medium | MIT | Medium-high | Not selected |

### 5.2 Persistence

| Candidate | Maturity | Feature breadth | Vendor neutrality | Operational complexity | Scalability | Baseline Decision |
|---|---|---|---|---|---|---|
| PostgreSQL | Very high | High (ACID, JSONB, indexing) | Very high | Moderate | High | Selected |
| MySQL | High | Moderate | Very high | Moderate | High | Rejected |
| CockroachDB | High | High | High | Higher | Very high | Alternative for geo-distributed deployments |

### 5.3 Workflow Engine

| Candidate | Long-running workflows | Multi-language clients | Enterprise maturity | Event-driven support | Operational complexity | Baseline Decision |
|---|---|---|---|---|---|---|
| Temporal | High | High | High | High | Moderate | Selected |
| Camunda/Zeebe | High | Medium | High | High | Moderate | Alternative |
| Apache Airflow | Medium | Medium | High | Low | Moderate | Not selected |

### 5.4 Event Bus

| Candidate | Throughput | Durability | Ecosystem | Vendor neutrality | Operational complexity | Baseline Decision |
|---|---|---|---|---|---|---|
| Apache Kafka | High | High | Very high | Very high | Moderate-high | Selected |
| Apache Pulsar | High | High | High | High | Moderate-high | Alternative |
| RabbitMQ | Medium | Medium | High | Very high | Moderate | Not selected |

### 5.5 Rule Engine

| Candidate | Business rule alignment | Integration with Java | Maturity | Maintainability | License | Baseline Decision |
|---|---|---|---|---|---|---|
| Drools (KIE) | High | Native | High | High | ASL 2.0 | Selected |
| OpenRules | Medium | Java-friendly | Medium | Medium | Commercial/OSS | Alternative |
| OPA | Low for business rules | REST-based | High | High | Apache 2.0 | Selected for policy enforcement, not business rules |

### 5.6 Vector Search

| Candidate | Vector performance | Scaling | Open source | Ecosystem | Baseline Decision |
|---|---|---|---|---|---|
| Milvus | High | High | Yes | Growing | Selected |
| Weaviate | High | Medium | Yes | Growing | Alternative |
| Pinecone | High | High | No | Strong | Not baseline |
| PostgreSQL + PGVector | Medium | Medium | Yes | High | Fallback for limited deployments |

### 5.7 Frontend

| Candidate | Enterprise adoption | Ecosystem | Maintainability | Performance | Baseline Decision |
|---|---|---|---|---|---|
| React + TypeScript | High | Very high | High | High | Selected |
| Angular | High | High | Medium | High | Alternative |
| Vue | High | High | High | High | Alternative |

### 5.8 Authentication

| Candidate | Standards compliance | Maturity | Vendor neutrality | Integration | Baseline Decision |
|---|---|---|---|---|---|
| Keycloak (OIDC/OAuth2) | Very high | High | Very high | High | Selected |
| Auth0 | Very high | High | Lower | High | Not baseline |
| Custom identity service | Variable | Low | Variable | Low | Rejected |

### 5.9 Orchestration

| Candidate | Ecosystem | Vendor neutrality | Kubernetes-native | Learning curve | Baseline Decision |
|---|---|---|---|---|---|
| Kubernetes | Very high | Very high | Yes | Moderate | Selected |
| Nomad | High | High | Partial | Moderate | Alternative |
| ECS/EKS providers | High | Lower | No | Low | Not baseline |

### 5.10 Observability

| Candidate | Standardization | Integrations | Enterprise maturity | Vendor neutrality | Baseline Decision |
|---|---|---|---|---|---|
| OpenTelemetry + Prometheus + Grafana + Loki + Jaeger | Very high | Very high | Very high | Very high | Selected |
| Elastic Stack | High | High | Very high | Medium | Alternative |
| Proprietary SaaS APM | Very high | High | Lower | High | Not baseline |

### 5.11 CI/CD

| Candidate | Kubernetes-native | Vendor neutrality | Maturity | Declarative support | Baseline Decision |
|---|---|---|---|---|---|
| Tekton + Argo CD | High | Very high | High | High | Selected |
| Jenkins | High | High | High | Medium | Alternative |
| GitHub Actions + Flux | High | Lower | High | High | Not baseline for vendor neutrality |

### 5.12 Testing

| Candidate | Language fit | Ecosystem | Maintainability | Enterprise suitability | Baseline Decision |
|---|---|---|---|---|---|
| JUnit + Mockito + Testcontainers | Java | Very high | Very high | Selected |
| pytest | Python | Very high | High | Selected |
| Jest + React Testing Library | TS/React | Very high | Very high | Selected |
| Pact | Multi-language contract tests | High | High | Selected |
| k6 | Performance testing | High | High | Selected |

## 6. Traceability Matrix

The following matrix demonstrates how each technology choice satisfies requirements in `PRODUCT_DEFINITION.md`.

| Technology | Product Requirement(s) Satisfied | Rationale |
|---|---|---|
| Java + Spring Boot | enterprise governance, runtime management, infrastructure management, security, scalability | Provides an enterprise-grade service platform with mature security, observability, and integration support. |
| Python + FastAPI | organizational intelligence, decision management, AI vendor neutrality | Enables direct AI/LLM integration without constraining the core platform to a single model provider. |
| PostgreSQL | vendor-neutral interoperability, knowledge management, auditability | Enables strong transactional consistency and schema flexibility for multi-tenant enterprise data. |
| Redis | runtime management, workflow management, performance | Supports distributed state, caching, and coordination needed for large-scale workflow/runtime operations. |
| Temporal | workflow management, multi-agent coordination, human collaboration | Provides durable workflow execution and long-running state management required by AI-EOS orchestration. |
| Apache Kafka | event-driven architecture, organizational intelligence, interoperability | Supports the platform event bus and decouples services for scalable event streaming and audit traceability. |
| Drools | decision management, governance, policy integration | Supports declarative business rule evaluation embedded in the Decision Engine. |
| Milvus | knowledge management, organizational memory, inference | Provides scalable vector search for semantic knowledge retrieval and long-term memory. |
| React + TypeScript | human collaboration, observability, governance | Supports operator UX and workflow tooling with a maintainable enterprise frontend. |
| Keycloak (OIDC/OAuth2) | security by design, governance by design, auditability | Implements standard authentication and identity federation patterns required by the platform. |
| Kubernetes | infrastructure management, vendor-neutral deployment, scalability | Provides a cloud-neutral orchestration foundation for distributed AI-EOS services. |
| OpenTelemetry + Prometheus + Grafana + Loki + Jaeger | observability, auditability, security | Enables consistent telemetry, tracing, logging, and incident investigation across the platform. |
| Tekton + Argo CD | infrastructure management, governance, continuous evolution | Enables declarative CI/CD pipelines and GitOps deployments aligned with enterprise release control. |
| JUnit / pytest / Jest / Pact / k6 | maintainability, governance, auditability, reliability | Provides a comprehensive, multi-language test baseline for unit, integration, contract, and performance validation. |

## 7. Implementation Constraints and Governance

These technology choices are normative for the initial AI-EOS implementation. Changes to the baseline require an explicit governance decision recorded through an Architecture Decision Record (ADR).

The baseline is constrained as follows:
- no managed cloud-only technology may be adopted as the primary platform component unless a future ADR justifies it,
- all selected technologies must be deployed in a vendor-neutral manner,
- security, observability, and auditability requirements must be implemented for every selected technology,
- alternative technologies may be used only for non-production prototypes or as part of clearly documented migration paths.

## 8. Deployment Notes

The platform baseline assumes the following deployment pattern:
- core AI-EOS microservices run in Kubernetes,
- PostgreSQL and Redis are deployed as stateful services with HA,
- Kafka is deployed as an enterprise streaming cluster,
- Temporal runs as a durable workflow backend,
- Milvus runs as a dedicated vector search cluster,
- Keycloak serves as the authoritative identity provider,
- OpenTelemetry agents export telemetry to Prometheus/Grafana/Loki/Jaeger,
- Tekton executes CI workflows and Argo CD manages Kubernetes application deployment.

## 9. Future Evolution

The following are normative extension directions, not baseline replacements:
- evaluate CockroachDB or YugabyteDB for geo-distributed workloads,
- evaluate Zeebe/Camunda if BPMN-specific workflows become mandatory,
- evaluate Weaviate or a managed vector search service only if operational constraints prohibit Milvus,
- evaluate alternative CI/CD platforms if Kubernetes-native tooling is not operationally viable.

Any such evolution must be captured in a governance ADR and reconciled with the traceability matrix.
