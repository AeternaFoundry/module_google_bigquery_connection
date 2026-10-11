variable "bigquery_connections" {
  description = <<EOT
Map of bigquery_connections, attributes below
Optional:
    - connection_id
    - deletion_policy
    - description
    - friendly_name
    - kms_key_name
    - location
    - project
    - aws (block):
        - access_role (required, block):
            - iam_role_id (required)
    - azure (block):
        - customer_tenant_id (required)
        - federated_application_client_id (optional)
    - cloud_resource (block):
    - cloud_spanner (block):
        - database (required)
        - database_role (optional)
        - max_parallelism (optional)
        - use_data_boost (optional)
        - use_parallelism (optional)
        - use_serverless_analytics (optional)
    - cloud_sql (block):
        - credential (required, block):
            - password (optional)
            - password_wo (optional)
            - password_wo_version (optional)
            - username (required)
        - database (required)
        - instance_id (required)
        - type (required)
    - configuration (block):
        - asset (required, block):
            - database (optional)
            - google_cloud_resource (optional)
        - authentication (optional, block):
            - username_password (optional, block):
                - password (required, block):
                    - plaintext (required)
                - username (required)
        - connector_id (required)
        - endpoint (optional, block):
            - host_port (optional)
        - network (optional, block):
            - private_service_connect (optional, block):
                - network_attachment (required)
    - spark (block):
        - metastore_service_config (optional, block):
            - metastore_service (optional)
        - spark_history_server_config (optional, block):
            - dataproc_cluster (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    connection_id   = optional(string)
    deletion_policy = optional(string)
    description     = optional(string)
    friendly_name   = optional(string)
    kms_key_name    = optional(string)
    location        = optional(string)
    project         = optional(string)
    aws = optional(object({
      access_role = object({
        iam_role_id = string
      })
    }))
    azure = optional(object({
      customer_tenant_id              = string
      federated_application_client_id = optional(string)
    }))
    cloud_resource = optional(object({
    }))
    cloud_spanner = optional(object({
      database                 = string
      database_role            = optional(string)
      max_parallelism          = optional(number)
      use_data_boost           = optional(bool)
      use_parallelism          = optional(bool)
      use_serverless_analytics = optional(bool)
    }))
    cloud_sql = optional(object({
      credential = object({
        password            = optional(string)
        password_wo         = optional(string)
        password_wo_version = optional(string)
        username            = string
      })
      database    = string
      instance_id = string
      type        = string
    }))
    configuration = optional(object({
      asset = object({
        database              = optional(string)
        google_cloud_resource = optional(string)
      })
      authentication = optional(object({
        username_password = optional(object({
          password = object({
            plaintext = string
          })
          username = string
        }))
      }))
      connector_id = string
      endpoint = optional(object({
        host_port = optional(string)
      }))
      network = optional(object({
        private_service_connect = optional(object({
          network_attachment = string
        }))
      }))
    }))
    spark = optional(object({
      metastore_service_config = optional(object({
        metastore_service = optional(string)
      }))
      spark_history_server_config = optional(object({
        dataproc_cluster = optional(string)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

