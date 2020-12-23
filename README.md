# keycloakinator

![keycloakinator](https://raw.githubusercontent.com/deadlysyn/keycloakinator/main/assets/terminator.png "Terminated!")

Generate or terminate keycloak clients with machine efficiency.

## Prerequisites

- [aws-vault](https://github.com/99designs/aws-vault) installed and configured
- Profile in `~/.aws/config` to be used by `aws-vault`
- Recent terraform CLI (0.14+)
- UNIX-like OS with make, sed, etc.

The automation leverages `aws-vault` to run `terraform` using the configured AWS
profile. Client resources are created within Keycloak, and AWS is only used
for remote state (S3 bucket, DynamoDB table, etc).

To avoid collisions between teams or environments, each client uses its own
state bucket. This is a safe starting point, but may hit account limits if you have
hundreds or thousands of clients. In that case you could request a limit
increase or refactor to leverage multiple state files in a single bucket
(or other creative ideas). Depending on your use case that could pose more
risk of destory opertions impacting unintended clients.

## Setup

For each Keycloak server you want to manage, you'll need to create
client credentials to be used by Keycloakinator. Follow
[Client Credentials Grant Setup](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs#keycloak-setup),
saving the client ID and secret for use below.

The Keycloak provider is configured via environment. Export the
required variables or use something like [direnv](https://direnv.net)
and create a `.envrc` at the top level of this repo with the following
(adjust as needed):

```console
export AWS_PROFILE="<profile to use from ~/.aws/config>"
export AWS_REGION="<preferred AWS region>"
export KEYCLOAK_URL="https://keycloak.your.tld"
export KEYCLOAK_REALM="yourRealm"
export KEYCLOAK_CLIENT_ID="keycloakinator"
export KEYCLOAK_CLIENT_SECRET="<client secret>"
```

## Create Client

To create a new Keycloak client, first identify the type of client you need:

| Type         | Template Directory                 | Notes                                                                              |
| ------------ | ---------------------------------- | ---------------------------------------------------------------------------------- |
| confidential | sample-oidc-confidential.acme.corp | User-facing REST or UI clients using client_id/client_secret or username/password. |
| public       | sample-oidc-public.acme.corp       | Machine to machine communication with shared secret.                               |
| saml         | sample-saml.acme.corp              |                                                                                    |

The sample directories have common options ready to go in `terraform.tfvars`. If you don't
find what you need, browse `variables.tf`. Anything there can be added to
`terraform.tfvars` to override defaults. Some options are mutually exclusive, or require
specific combinations. Let the comments guide you.

1. `cd clients`
1. `./mkclient -c your.client.name -t client_type`
1. An editor will be spawned with `terraform.tfvars`, adjust as needed
1. Commit your updates (perhaps create a PR for review)

## Deploy Client

Deployment leverages make for less typing. The `all` target will initialize modules,
deploy the client, and configure remote state to get critical bits off your workstation.

1. `cd clients/client.name`
1. `make all`

## Edit Client

1. `cd clients/client.name`
1. `vi terraform.tfvars`
1. `make apply`

## Destroy Client

1. `cd clients/client.name`
1. `make destroy`
1. Review proposed changes and type `yes`

## TODO

- Better document common variations
- Handle roles and groups
- Terratests

## References

- [Keycloak Terraform Provider](https://github.com/mrparkers/terraform-provider-keycloak)
