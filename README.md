# Tasks
1. Execute Terraform from shared runtime (GitHub Actions)
1. Have Terraform changes automated validation (on PR level)
1. Apply Terraform changes in the same way for all environments
1. Get approve before apply against certain environments (e.g. PROD)
1. Have plan output before Terraform execution (apply)
1. Have Terraform execution history
1. Be able to add more tests in the future

# Solutions
1. GitHub Action dedicated workflows for each env
1. Dedicated workflow for Pull Request validation
1. Terraform is executed in Docker container, so nothing is required from build agent
1. Critical envs have reviewers specified
1. Each env pipeline run plan before asking for approve
1. All history is in GitHub UI in a fancy format
1. Tests consider modular structure

# Issues
1. Successful Terraform plan doesn't guarantee successful Terraform apply - #TODO: need to clone environment
1. Current PRV job checks only syntax - #TODO: need to clone env to apply changes
1. Current Docker image has latest Terraform version only - #TODO: add var to Dockerfile
1. GitHub actions don't have manual trigger now - #TODO: check this functionality
1. GitHub Environments are not available for private repos - #TODO: investigate, sounds strange
1. GitHub actions deploy doesn't allow to specify Artifact version to deploy - #TODO: use forks?
1. Some actions (e.g. `destroy`, `import`, `rm`, etc.) are still have to be executed manually - #TODO: watch and add pipelines for common actions
