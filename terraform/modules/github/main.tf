
resource "github_actions_secret" "az-swa-api-key" {
  repository       =  var.github_repo
  secret_name      = "AZURE_STATIC_WEB_APPS_API_TOKEN"
  plaintext_value  = var.api_key
}