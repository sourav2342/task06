location                       = "Central US"
name_prefix                    = "cmaz-64aed6d7-mod6"
runtime_stack                  = "DOTNETCORE|8.0"
allowed_ip_address             = "18.153.146.156"
sql_admin_username_secret_name = "sql-admin-name"
sql_admin_password_secret_name = "sql-admin-password"
existing_kv_name               = "cmaz-64aed6d7-mod6-kv"
existing_kv_rg                 = "cmaz-64aed6d7-mod6-kv-rg"
sql_sku                        = "S2"
app_service_plan_sku           = "P0v3"
tags = {
  Creator = "raavi_sourav@epam.com"
}