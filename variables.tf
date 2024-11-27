variable "subscription_id" {
  type        = string
  default     = "cffdc34f-2de5-4fd1-ba70-cf65055d7e53"
  description = "ID da subscription na azure"
  validation {
    condition     = length(var.subscription_id) > 0 && length(var.subscription_id) <= 50
    error_message = "O tamanho do id é incorreto"
  }
}

#RresourceGroup
variable "rg_name" {
  type        = string
  default     = "rg_clinicallink"
  description = "Resource Group"
  validation {
    condition     = length(var.rg_name) >= 1 && length(var.rg_name) <= 30 || can(regex(lower("([a-z0-9])", var.rg_name)))
    error_message = "O nome nao cumpre com os requisitos minimos:\n- O valor precisa ter letras minusculas\n- "
  }
}
variable "rg_location" {
  type        = string
  default     = "Central US"
  description = "Regiao usada para criar o resource group e os demais recursos"
  validation {
    condition     = contains(["Central US", "North Central US", "South Central US"], var.rg_location)
    error_message = "As regioes permitidas sao:\n- Central US\n- North Central US\n- South Central US"
  }
}

#storage account
variable "storage_account_name" {
  type        = string
  default     = "clinicalstgaccount"
  description = "Nome da storage account"
  validation {
    condition     = length(var.storage_account_name) >= 1 && length(var.storage_account_name) <= 30
    error_message = "O tamanho do nome da storage account precisa ser entre 1 e 30"
  }
}
variable "storage_account_tier" {
  type        = string
  default     = "Standard"
  description = "Tipo da classe da storage account"
  validation {
    condition     = contains(["Standard"], var.storage_account_tier)
    error_message = "O tier permitido pela azure e 'Standard' como padrao"
  }
}
variable "storage_account_replication_type" {
  type        = string
  default     = "LRS"
  description = "Tipo de replicacao de dados da storage account (definido pela azure e sem descricao do que o parametro influencia)"
  validation {
    condition     = contains(["LRS"], var.storage_account_replication_type)
    error_message = "O tipo precisa ser 'LRS'"
  }
}

# Storage container
variable "container_name" {
  type        = string
  default     = "containerclinical"
  description = "Nome do container que ficara o bucket"
  validation {
    condition     = length(var.container_name) >= 1 && length(var.container_name) <= 30
    error_message = "O tamanho do nome da storage account precisa ser entre 1 e 30"
  }
}
variable "container_access_type" {
  type        = string
  default     = "private"
  description = "Tipo de acesso ao container"
}

#Role assignment
variable "service_user_role_definition_name" {
  type        = string
  default     = "Storage Blob Data Contributor"
  description = "Nome da role utilizada no usuario de servico"
  validation {
    condition     = contains(["Storage Blob Data Contributor"], var.service_user_role_definition_name)
    error_message = "O tipo da role que defini pra esse service user seria a 'Storage Blob Data Contributor'"
  }
}
