output "client_secret" {
  value = data.keycloak_openid_client.instance.client_secret
}
