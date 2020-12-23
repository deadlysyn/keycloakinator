terraform {
  #backend "s3" {}
}

module "keycloak_openid_client" {
  source                                   = "../../modules/keycloak_openid_client"
  access_token_lifespan                    = var.access_token_lifespan
  access_type                              = var.access_type
  admin_url                                = var.admin_url
  authorization                            = var.authorization
  authentication_flow_binding_overrides    = var.authentication_flow_binding_overrides
  base_url                                 = var.base_url
  client_id                                = var.client_id
  client_secret                            = var.client_secret
  consent_required                         = var.consent_required
  description                              = var.description
  direct_access_grants_enabled             = var.direct_access_grants_enabled
  enabled                                  = var.enabled
  exclude_session_state_from_auth_response = var.exclude_session_state_from_auth_response
  full_scope_allowed                       = var.full_scope_allowed
  id                                       = var.id
  implicit_flow_enabled                    = var.implicit_flow_enabled
  login_theme                              = var.login_theme
  name                                     = var.name
  pkce_code_challenge_method               = var.pkce_code_challenge_method
  realm_id                                 = var.realm_id
  root_url                                 = var.root_url
  service_accounts_enabled                 = var.service_accounts_enabled
  standard_flow_enabled                    = var.standard_flow_enabled
  tags                                     = var.tags
  valid_redirect_uris                      = var.valid_redirect_uris
  web_origins                              = var.web_origins
}
