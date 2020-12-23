provider "aws" {
  region = var.region
}

provider "keycloak" {
  # configuration from environment...
}

module "terraform_state_backend" {
  source         = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=tags/0.29.0"
  force_destroy  = true
  name           = var.id
  s3_bucket_name = "${var.id}-state"
  tags           = var.tags
}

resource "keycloak_openid_client" "instance" {
  access_token_lifespan                    = var.access_token_lifespan
  access_type                              = var.access_type
  admin_url                                = var.admin_url
  base_url                                 = var.base_url
  client_id                                = var.client_id
  client_secret                            = var.client_secret
  consent_required                         = var.consent_required
  description                              = var.description
  direct_access_grants_enabled             = var.direct_access_grants_enabled
  enabled                                  = var.enabled
  exclude_session_state_from_auth_response = var.exclude_session_state_from_auth_response
  full_scope_allowed                       = var.full_scope_allowed
  implicit_flow_enabled                    = var.implicit_flow_enabled
  login_theme                              = var.login_theme
  name                                     = var.name
  pkce_code_challenge_method               = var.pkce_code_challenge_method
  realm_id                                 = var.realm_id
  root_url                                 = var.root_url
  service_accounts_enabled                 = var.service_accounts_enabled
  standard_flow_enabled                    = var.standard_flow_enabled
  valid_redirect_uris                      = var.valid_redirect_uris
  web_origins                              = var.web_origins

  dynamic "authorization" {
    for_each = var.authorization == null ? [] : [var.authorization]
    content {
      allow_remote_resource_management = authorization.value.allow_remote_resource_management == null ? false : authorization.value.allow_remote_resource_management
      keep_defaults                    = authorization.value.keep_defaults == null ? false : authorization.value.keep_defaults
      policy_enforcement_mode          = authorization.value.policy_enforcement_mode
    }
  }

  dynamic "authentication_flow_binding_overrides" {
    for_each = var.authentication_flow_binding_overrides == null ? [] : [var.authentication_flow_binding_overrides]
    content {
      browser_id      = authentication_flow_binding_overrides.value.browser_id == null ? null : authentication_flow_binding_overrides.value.browser_id
      direct_grant_id = authentication_flow_binding_overrides.value.direct_grant_id == null ? null : authentication_flow_binding_overrides.value.direct_grant_id
    }
  }
}

data "keycloak_openid_client" "instance" {
  depends_on = [keycloak_openid_client.instance]
  realm_id   = var.realm_id
  client_id  = var.client_id
}
