# Azure Packer Hardened VHD

This project provides a template for building, testing, and publishing a hardened Linux Virtual Hard Disk (VHD) for Azure using Packer and a CI/CD pipeline. The goal is to automate the process of creating a secure and compliant image that can be deployed in Azure environments.

## Project Structure

The project is organized into several directories, each serving a specific purpose:

- **packer/**: Contains all Packer-related files, including templates, variables, scripts for provisioning and cleanup, and post-processors for publishing the image.
- **ansible/**: Contains Ansible playbooks and roles for applying hardening configurations to the Linux image.
- **tests/**: Includes scripts and controls for validating the built image and ensuring it meets security standards.
- **ci/**: Contains CI/CD pipeline configurations for Azure DevOps and GitHub Actions to automate the build and deployment process.
- **docs/**: Provides documentation on concepts related to the project and guidelines for hardening the image.
- **scripts/**: Contains utility scripts for publishing the image to Azure.
- **examples/**: Provides example variable definitions for Packer.

## Getting Started

### Prerequisites

- Install [Packer](https://www.packer.io/downloads)
- Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- Set up an Azure account and configure the Azure CLI
- Install [Git](https://git-scm.com/downloads)

### Building the Image

1. Clone the repository:
   ```
   git clone <repository-url>
   cd azure-packer-hardened-vhd
   ```

2. Customize the Packer variables in `packer/variables.pkrvars.hcl` as needed.

3. Run the Packer build command:
   ```
   packer build -var-file=packer/variables.pkrvars.hcl packer/templates/azure-linux.pkr.hcl
   ```

### CI/CD Pipeline

The project includes CI/CD configurations for both Azure DevOps and GitHub Actions. These pipelines automate the process of building, testing, and publishing the hardened VHD.

- For Azure DevOps, configure the pipeline using `ci/azure-pipelines.yml`.
- For GitHub Actions, use the workflow defined in `ci/github/packer-build.yml`.

### Hardening the Image

The Ansible playbook located at `ansible/playbooks/harden.yml` applies security hardening configurations to the image. You can customize this playbook to meet your specific security requirements.

### Testing the Image

The tests are located in the `tests/` directory. Use InSpec controls in `tests/inspec/controls/baseline.rb` to validate the security posture of the built image. The validation script `tests/validation/validate-image.sh` can be executed to ensure compliance.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.