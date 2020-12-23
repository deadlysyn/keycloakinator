######################################################################
# REQUIRED
######################################################################

access_type              = "CONFIDENTIAL"
client_id                = "%%CLIENT%%"
description              = "Used by X [foo@bar.baz]"
name                     = "Sample Confidential OIDC Client"
realm_id                 = "yourKeycloakRealmName"
service_accounts_enabled = true

######################################################################
# OPTIONAL
######################################################################

# Allow to include all role mappings in the access token.
full_scope_allowed       = true

# URL to the admin interface of the client.
# NOTE: Only set this if client supports adapter REST API.
#admin_url   = "https://service.acme.corp/admin"
#
# Default URL to use when the auth server needs to redirect or link
# back to the client.
#base_url    = "https://service.acme.corp/login"
#
# When specified, this URL is prepended to any relative URLs found
# within valid_redirect_uris, web_origins, and admin_url.
# NOTE: Due to Keycloak API limitations, when root_url is used,
# valid_redirect_uris, web_origins, and admin_url are required.
#root_url    = "https://service.acme.corp"

# Enable OAuth2 Authorization Code Grant for this client.
#standard_flow_enabled = true
#
# Enable OAuth2 Implicit Grant for this client.
#implicit_flow_enabled = true
#
# Enable OAuth2 Resource Owner Password Grant for this client.
#direct_access_grants_enabled = true

# List of allowed CORS origins. '+' can be used to permit all valid
# redirect URIs, and '*' can be used to permit all origins.
#web_origins  = ["+"]

######################################################################
# DON'T CHANGE THIS
######################################################################

id = "%%ID%%"
