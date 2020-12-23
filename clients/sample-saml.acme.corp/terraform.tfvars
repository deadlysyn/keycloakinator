######################################################################
# REQUIRED
######################################################################

client_id                    = "https://service.acme.corp"
description                  = "Used by X [foo@bar.baz]"
force_name_id_format         = true
force_post_binding           = true
include_authn_statement      = true
master_saml_processing_url   = "https://service.acme.corp/auth/saml/callback"
name                         = "Sample Public OIDC Client"
# username, email, transient, persistent
name_id_format               = "username"
realm_id                     = "yourKeycloakRealmName"
sign_assertions              = true
# RSA_SHA1, RSA_SHA256, RSA_SHA512, DSA_SHA1
signature_algorithm          = "RSA_SHA256"
valid_redirect_uris          = [
  "https://service.acme.corp/*",
  "*"
]

######################################################################
# OPTIONAL
######################################################################

# When specified, this URL will be used whenever Keycloak needs to
# link to this client.
#base_url    = "https://service.acme.corp/login"
#
# When specified, this value is prepended to all relative URLs.
#root_url    = "https://service.acme.corp"

######################################################################
# DON'T CHANGE THIS
######################################################################

id = "%%ID%%"
