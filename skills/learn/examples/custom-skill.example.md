---
name: deploy-pipeline
description: >-
  Standard operating procedure for deploying staging and production builds.
  Use when the user asks to deploy, release a version, or push to staging/production.
---

# Deploy Pipeline Skill Example

Step-by-step procedures to run a safe production deployment.

## Steps:
1. Run pre-flight linting and tests:
   ```bash
   npm run lint && npm test
   ```
2. Build the distribution bundles:
   ```bash
   npm run build
   ```
3. Run smoke tests on the production build output.
4. Deploy using the cloud CLI and verify HTTP 200 health check.
