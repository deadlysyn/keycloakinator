variable "assertion_consumer_post_url" {
  description = "(Optional) SAML POST Binding URL for the client's assertion consumer service (login responses)."
  type        = string
  default     = ""
}

variable "assertion_consumer_redirect_url" {
  description = "(Optional) SAML Redirect Binding URL for the client's assertion consumer service (login responses)."
  type        = string
  default     = ""
}

variable "base_url" {
  description = "(Optional) When specified, this URL will be used whenever Keycloak needs to link to this client."
  type        = string
  default     = ""
}

variable "client_id" {
  description = "The Client ID for this client, referenced in the URI during authentication and in issued tokens."
  type        = string
}

variable "client_signature_required" {
  description = "(Optional) When true, Keycloak will expect that documents originating from a client will be signed using the certificate and/or key configured via signing_certificate and signing_private_key."
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of this client in the GUI."
  type        = string
}

variable "enabled" {
  description = "(Optional) When false, this client will not be able to initiate a login or obtain access tokens."
  type        = bool
  default     = true
}

variable "encrypt_assertions" {
  description = "(Optional) When true, the SAML assertions will be encrypted by Keycloak using the client's public key."
  type        = bool
  default     = false
}

variable "encryption_certificate" {
  description = "(Optional) If assertions for the client are encrypted, this certificate will be used for encryption."
  type        = string
  default     = null
}

variable "force_name_id_format" {
  description = "(Optional) Ignore requested NameID subject format and use the one defined in name_id_format instead."
  type        = bool
  default     = false
}

variable "force_post_binding" {
  description = "(Optional) When true, Keycloak will always respond to an authentication request via the SAML POST Binding."
  type        = bool
  default     = false
}

variable "front_channel_logout" {
  description = "(Optional) When true, this client will require a browser redirect in order to perform a logout."
  type        = bool
  default     = false
}

variable "full_scope_allowed" {
  description = "(Optional) Allow to include all roles mappings in the access token."
  type        = bool
  default     = false
}

variable "id" {
  description = "Unique identifier (UUID) used for AWS resources"
  type        = string
}

variable "idp_initiated_sso_url_name" {
  description = "(Optional) URL fragment name to reference client when you want to do IDP Initiated SSO."
  type        = string
  default     = ""
}

variable "idp_initiated_sso_relay_state" {
  description = "(Optional) Relay state you want to send with SAML request when you want to do IDP Initiated SSO."
  type        = string
  default     = ""
}

variable "include_authn_statement" {
  description = "(Optional) When true, an AuthnStatement will be included in the SAML response."
  type        = bool
  default     = false
}

variable "logout_service_post_binding_url" {
  description = "(Optional) SAML POST Binding URL for the client's single logout service."
  type        = string
  default     = ""
}

variable "logout_service_redirect_binding_url" {
  description = "(Optional) SAML Redirect Binding URL for the client's single logout service."
  type        = string
  default     = ""
}

variable "master_saml_processing_url" {
  description = "(Optional) When specified, this URL will be used for all SAML requests."
  type        = string
  default     = ""
}

variable "name" {
  description = "The display name of this client in the GUI."
  type        = string
}

variable "name_id_format" {
  description = "(Optional) Sets the Name ID format for the subject."
  type        = string
  default     = ""
}

variable "realm_id" {
  description = "The realm this client is attached to."
  type        = string
}

variable "region" {
  description = "AWS region used for remote state."
  type        = string
  default     = "us-east-2"
}

variable "root_url" {
  description = "(Optional) When specified, this value is prepended to all relative URLs."
  type        = string
  default     = ""
}

variable "sign_assertions" {
  description = "(Optional) When true, the SAML assertions will be signed by Keycloak using the realm's private key, and embedded within the SAML XML Auth response."
  type        = bool
  default     = false
}

variable "sign_documents" {
  description = "(Optional) When true, the SAML document will be signed by Keycloak using the realm's private key."
  type        = bool
  default     = false
}

variable "signature_algorithm" {
  description = "(Optional) The signature algorithm used to sign documents. Should be one of RSA_SHA1, RSA_SHA256, RSA_SHA512, or DSA_SHA1."
  type        = string
  default     = ""
}

variable "signing_certificate" {
  description = "(Optional) If documents or assertions from the client are signed, this certificate will be used to verify the signature."
  type        = string
  default     = null
}

variable "signing_private_key" {
  description = "(Optional) If documents or assertions from the client are signed, this private key will be used to verify the signature."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for AWS resources"
  type        = map(string)
  default = {
    Description = "https://github.com/deadlysyn/keycloakinator"
    Service     = "Keycloakinator Client"
  }
}

variable "valid_redirect_uris" {
  description = "(Optional) A list of valid URIs a browser is permitted to redirect to after a successful login or logout. Simple wildcards in the form of an asterisk can be used here. This attribute must be set if either standard_flow_enabled or implicit_flow_enabled is set to true."
  type        = list(string)
  default     = []
}
