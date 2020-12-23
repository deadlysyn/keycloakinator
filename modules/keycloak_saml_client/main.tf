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

resource "keycloak_saml_client" "instance" {
  assertion_consumer_post_url         = var.assertion_consumer_post_url
  assertion_consumer_redirect_url     = var.assertion_consumer_redirect_url
  base_url                            = var.base_url
  client_id                           = var.client_id
  client_signature_required           = var.client_signature_required
  description                         = var.description
  enabled                             = var.enabled
  encrypt_assertions                  = var.encrypt_assertions
  encryption_certificate              = var.encryption_certificate
  force_name_id_format                = var.force_name_id_format
  force_post_binding                  = var.force_post_binding
  front_channel_logout                = var.front_channel_logout
  full_scope_allowed                  = var.full_scope_allowed
  idp_initiated_sso_url_name          = var.idp_initiated_sso_url_name
  idp_initiated_sso_relay_state       = var.idp_initiated_sso_relay_state
  include_authn_statement             = var.include_authn_statement
  logout_service_post_binding_url     = var.logout_service_post_binding_url
  logout_service_redirect_binding_url = var.logout_service_redirect_binding_url
  master_saml_processing_url          = var.master_saml_processing_url
  name                                = var.name
  name_id_format                      = var.name_id_format
  realm_id                            = var.realm_id
  root_url                            = var.root_url
  sign_assertions                     = var.sign_assertions
  sign_documents                      = var.sign_documents
  signature_algorithm                 = var.signature_algorithm
  signing_certificate                 = var.signing_certificate
  signing_private_key                 = var.signing_private_key
  valid_redirect_uris                 = var.valid_redirect_uris
}
