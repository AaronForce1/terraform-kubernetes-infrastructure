# infrastructure-terraform-eks

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

An evolution of terraform-aws-infrastructure-eks to segregate Kubernetes components with optional supporting submodules for various cloud providers: AWS - GCP - etc; allowing for standard terraform-driven, Helm provisioning of baseline kubernetes components.

## Important Note

By default - this should be used for critical and essential base systems. While there are some legacy components, by default, we typically use this to provision ArgoCD and VPN services - while ArgoCD manages all other infrastructure components on k8s.

## Doc generation

Code formatting and documentation for variables and outputs is generated using [pre-commit-terraform hooks](https://github.com/antonbabenko/pre-commit-terraform) which uses [terraform-docs](https://github.com/segmentio/terraform-docs).

Follow [these instructions](https://github.com/antonbabenko/pre-commit-terraform#how-to-install) to install pre-commit locally.

And install `terraform-docs` with `go get github.com/segmentio/terraform-docs` or `brew install terraform-docs`.

## Contributing

Report issues/questions/feature requests on in the [issues](https://gitlab.com/magnetic-asia/infrastructure-as-code/infrastructure-terraform-eks/issues/new) section.

Full contributing [guidelines are covered here](https://gitlab.com/magnetic-asia/infrastructure-as-code/infrastructure-terraform-eks/blob/master/.github/CONTRIBUTING.md).

## Change log

- The [changelog](https://gitlab.com/magnetic-asia/infrastructure-as-code/infrastructure-terraform-eks/tree/master/CHANGELOG.md) captures all important release notes from 1.1.17

## Authors

Created by [Aaron Baideme](https://gitlab.com/aaronforce1) - [avbaideme@proton.me](mailto:avbaideme@proton.me)

Supported by:

- Marcus Cheng
- Suraj Tiwari

## License

MIT Licensed. See [LICENSE](https://gitlab.com/magnetic-asia/infrastructure-as-code/infrastructure-terraform-eks/tree/master/LICENSE) for full details.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
