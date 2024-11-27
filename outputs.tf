output "service_user_name" {
  value       = azurerm_storage_account.service_user.name
  description = "Nome do usuario de servico"
}

output "sas_url_query_string" {
  value = "url gerada pro storage:${data.azurerm_storage_account_sas.sas_key.sas}"

  sensitive   = true
  description = "Url do storage criado"
}

