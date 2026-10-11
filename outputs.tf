output "bigquery_connections_id" {
  description = "Map of id values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no id are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bigquery_connections_aws" {
  description = "Map of aws values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no aws are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => one(v.aws) if v.aws != null && length(v.aws) > 0 }
}
output "bigquery_connections_azure" {
  description = "Map of azure values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no azure are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => one(v.azure) if v.azure != null && length(v.azure) > 0 }
}
output "bigquery_connections_cloud_resource" {
  description = "Map of cloud_resource values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no cloud_resource are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => one(v.cloud_resource) if v.cloud_resource != null && length(v.cloud_resource) > 0 }
}
output "bigquery_connections_cloud_spanner" {
  description = "Map of cloud_spanner values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no cloud_spanner are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => one(v.cloud_spanner) if v.cloud_spanner != null && length(v.cloud_spanner) > 0 }
}
output "bigquery_connections_cloud_sql" {
  description = "Map of cloud_sql values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no cloud_sql are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => one(v.cloud_sql) if v.cloud_sql != null && length(v.cloud_sql) > 0 }
  sensitive   = true
}
output "bigquery_connections_configuration" {
  description = "Map of configuration values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no configuration are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => one(v.configuration) if v.configuration != null && length(v.configuration) > 0 }
  sensitive   = true
}
output "bigquery_connections_connection_id" {
  description = "Map of connection_id values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no connection_id are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.connection_id if v.connection_id != null && length(v.connection_id) > 0 }
}
output "bigquery_connections_deletion_policy" {
  description = "Map of deletion_policy values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no deletion_policy are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "bigquery_connections_description" {
  description = "Map of description values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no description are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.description if v.description != null && length(v.description) > 0 }
}
output "bigquery_connections_friendly_name" {
  description = "Map of friendly_name values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no friendly_name are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.friendly_name if v.friendly_name != null && length(v.friendly_name) > 0 }
}
output "bigquery_connections_has_credential" {
  description = "Map of has_credential values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no has_credential are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.has_credential if v.has_credential != null }
}
output "bigquery_connections_kms_key_name" {
  description = "Map of kms_key_name values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no kms_key_name are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.kms_key_name if v.kms_key_name != null && length(v.kms_key_name) > 0 }
}
output "bigquery_connections_location" {
  description = "Map of location values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no location are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.location if v.location != null && length(v.location) > 0 }
}
output "bigquery_connections_name" {
  description = "Map of name values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no name are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.name if v.name != null && length(v.name) > 0 }
}
output "bigquery_connections_project" {
  description = "Map of project values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no project are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => v.project if v.project != null && length(v.project) > 0 }
}
output "bigquery_connections_spark" {
  description = "Map of spark values across all bigquery_connections, keyed the same as var.bigquery_connections except keys with no spark are omitted"
  value       = { for k, v in google_bigquery_connection.bigquery_connections : k => one(v.spark) if v.spark != null && length(v.spark) > 0 }
}

