resource "google_bigquery_connection" "bigquery_connections" {
  for_each = var.bigquery_connections

  connection_id   = each.value.connection_id
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  friendly_name   = each.value.friendly_name
  kms_key_name    = each.value.kms_key_name
  location        = each.value.location
  project         = each.value.project

  dynamic "aws" {
    for_each = each.value.aws != null ? [each.value.aws] : []
    content {
      access_role {
        iam_role_id = aws.value.access_role.iam_role_id
      }
    }
  }

  dynamic "azure" {
    for_each = each.value.azure != null ? [each.value.azure] : []
    content {
      customer_tenant_id              = azure.value.customer_tenant_id
      federated_application_client_id = azure.value.federated_application_client_id
    }
  }

  dynamic "cloud_resource" {
    for_each = each.value.cloud_resource != null ? [each.value.cloud_resource] : []
    content {
    }
  }

  dynamic "cloud_spanner" {
    for_each = each.value.cloud_spanner != null ? [each.value.cloud_spanner] : []
    content {
      database                 = cloud_spanner.value.database
      database_role            = cloud_spanner.value.database_role
      max_parallelism          = cloud_spanner.value.max_parallelism
      use_data_boost           = cloud_spanner.value.use_data_boost
      use_parallelism          = cloud_spanner.value.use_parallelism
      use_serverless_analytics = cloud_spanner.value.use_serverless_analytics
    }
  }

  dynamic "cloud_sql" {
    for_each = each.value.cloud_sql != null ? [each.value.cloud_sql] : []
    content {
      credential {
        password            = cloud_sql.value.credential.password
        password_wo         = cloud_sql.value.credential.password_wo
        password_wo_version = cloud_sql.value.credential.password_wo_version
        username            = cloud_sql.value.credential.username
      }
      database    = cloud_sql.value.database
      instance_id = cloud_sql.value.instance_id
      type        = cloud_sql.value.type
    }
  }

  dynamic "configuration" {
    for_each = each.value.configuration != null ? [each.value.configuration] : []
    content {
      asset {
        database              = configuration.value.asset.database
        google_cloud_resource = configuration.value.asset.google_cloud_resource
      }
      dynamic "authentication" {
        for_each = configuration.value.authentication != null ? [configuration.value.authentication] : []
        content {
          dynamic "username_password" {
            for_each = authentication.value.username_password != null ? [authentication.value.username_password] : []
            content {
              password {
                plaintext = username_password.value.password.plaintext
              }
              username = username_password.value.username
            }
          }
        }
      }
      connector_id = configuration.value.connector_id
      dynamic "endpoint" {
        for_each = configuration.value.endpoint != null ? [configuration.value.endpoint] : []
        content {
          host_port = endpoint.value.host_port
        }
      }
      dynamic "network" {
        for_each = configuration.value.network != null ? [configuration.value.network] : []
        content {
          dynamic "private_service_connect" {
            for_each = network.value.private_service_connect != null ? [network.value.private_service_connect] : []
            content {
              network_attachment = private_service_connect.value.network_attachment
            }
          }
        }
      }
    }
  }

  dynamic "spark" {
    for_each = each.value.spark != null ? [each.value.spark] : []
    content {
      dynamic "metastore_service_config" {
        for_each = spark.value.metastore_service_config != null ? [spark.value.metastore_service_config] : []
        content {
          metastore_service = metastore_service_config.value.metastore_service
        }
      }
      dynamic "spark_history_server_config" {
        for_each = spark.value.spark_history_server_config != null ? [spark.value.spark_history_server_config] : []
        content {
          dataproc_cluster = spark_history_server_config.value.dataproc_cluster
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

