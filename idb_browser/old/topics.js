var topics = [
{"topic": "AppComponent-APPCOMPONENT_TO_APPLICATION-Application", "default_columns": ["source_appcomponent_name", "destination_application_name"], "topic_type": "relations", "columns": ["source_appcomponent_name", "destination_application_name"]}
,
{"topic": "AppComponent", "default_columns": ["appcomponent", "appcomponent_name", "application_name"], "topic_type": "nodes", "columns": ["appcomponent", "appcomponent_name", "application_name"]}
,
{"topic": "Application-APLLICATION_TO_COSMOS_TRANSACTION-CosmosTransaction", "default_columns": ["source_application_name", "destination_cosmos_transaction_name"], "topic_type": "relations", "columns": ["source_application_name", "destination_cosmos_transaction_name"]}
,
{"topic": "Application-APLLICATION_TO_FILE-File", "default_columns": ["source_application_name", "destination_file_name"], "topic_type": "relations", "columns": ["source_application_name", "destination_file_name"]}
,
{"topic": "Application-APLLICATION_TO_KSZ_FLUX-KszFlux", "default_columns": ["source_application_name", "destination_ksz_flux_name"], "topic_type": "relations", "columns": ["source_application_name", "destination_ksz_flux_name"]}
,
{"topic": "Application-APLLICATION_TO_LETTER-Letter", "default_columns": ["source_application_name", "destination_letter_name"], "topic_type": "relations", "columns": ["source_application_name", "destination_letter_name"]}
,
{"topic": "Application-APPLICATION_TO_DATABASESCHEMA-DatabaseSchema", "default_columns": ["source_application_name", "destination_schema_name"], "topic_type": "relations", "columns": ["source_application_name", "destination_schema_name"]}
,
{"topic": "Application", "default_columns": ["application", "application_name", "application_version", "env"], "topic_type": "nodes", "columns": ["application", "application_name", "application_version", "env"]}
,
{"topic": "ApplicationParameter", "default_columns": ["application_name", "array_position", "is_array", "mandatory", "parameter_data_type", "parameter_desc", "parameter_key", "valid_date_from", "value_list"], "topic_type": "nodes", "columns": ["application_name", "array_position", "is_array", "mandatory", "parameter_data_type", "parameter_desc", "parameter_key", "valid_date_from", "value_list"]}
,
{"topic": "CosmosTransaction", "default_columns": ["application_name", "cosmos_program", "cosmos_transaction", "cosmos_transaction_fr", "cosmos_transaction_name", "description", "env"], "topic_type": "nodes", "columns": ["application_name", "cosmos_program", "cosmos_transaction", "cosmos_transaction_fr", "cosmos_transaction_name", "description", "env"]}
,
{"topic": "DatabaseConnectstring", "default_columns": ["connect_string", "ldapentry", "ldapentry_name"], "topic_type": "nodes", "columns": ["connect_string", "ldapentry", "ldapentry_name"]}
,
{"topic": "DatabaseConnectstring-LDAP_TO_DATABASE_SERVICE-DatabaseService", "default_columns": ["source_ldapentry_name", "destination_database_service"], "topic_type": "relations", "columns": ["source_ldapentry_name", "destination_database_service"]}
,
{"topic": "Database-DATABASE_ON_HOST-Host", "default_columns": ["source_database", "destination_host", "instance_name"], "topic_type": "relations", "columns": ["source_database", "destination_host", "instance_name"]}
,
{"topic": "Database-DB_LINK-DbLink", "default_columns": ["source_database", "destination_db_link_name"], "topic_type": "relations", "columns": ["source_database", "destination_db_link_name"]}
,
{"topic": "database_instances", "default_columns": ["host", "database", "instance_name"], "topic_type": "reports", "columns": ["host", "database", "instance_name"]}
,
{"topic": "Database", "default_columns": ["database", "database_name", "db_type", "domain", "instances", "nodes", "oracle_home", "port", "sg_pkg"], "topic_type": "nodes", "columns": ["database", "database_name", "db_type", "domain", "grid_home", "instances", "interconnects", "nodes", "oracle_home", "port", "scan_vip", "sg_cluster", "sg_pkg", "standby_config", "vips"]}
,
{"topic": "DatabaseMviewRemote", "default_columns": ["database", "database_mview_name", "db_link", "mview_name", "owner"], "topic_type": "nodes", "columns": ["database", "database_mview_name", "db_link", "mview_name", "owner"]}
,
{"topic": "DatabaseMviewRemote-MVIEW_MASTER-DbLink", "default_columns": ["source_database_mview_name", "destination_db_link_name"], "topic_type": "relations", "columns": ["source_database_mview_name", "destination_db_link_name"]}
,
{"topic": "DatabaseMviewRemote-MVIEW_ON_DATABASE-Database", "default_columns": ["source_database_mview_name", "destination_database"], "topic_type": "relations", "columns": ["source_database_mview_name", "destination_database"]}
,
{"topic": "database_mviews_remote", "default_columns": ["database", "owner", "mview_name", "db_link", "destination_service_name", "destination_database"], "topic_type": "reports", "columns": ["database", "owner", "mview_name", "db_link", "destination_service_name", "destination_database"]}
,
{"topic": "DatabaseQueue", "default_columns": ["database", "database_queue_name", "owner", "queue_name", "queue_table"], "topic_type": "nodes", "columns": ["database", "database_queue_name", "owner", "queue_name", "queue_table"]}
,
{"topic": "DatabaseQueue-QUEUE_ON_DATABASE-Database", "default_columns": ["source_database_queue_name", "destination_database"], "topic_type": "relations", "columns": ["source_database_queue_name", "destination_database"]}
,
{"topic": "DatabaseQueue-QUEUE_SCHEDULE-DbLink", "default_columns": ["source_database_queue_name", "destination_db_link_name", "destination_queue_name", "destination_schema"], "topic_type": "relations", "columns": ["source_database_queue_name", "destination_db_link_name", "destination_queue_name", "destination_schema"]}
,
{"topic": "database_queues", "default_columns": ["database", "owner", "queue_name", "queue_table"], "topic_type": "reports", "columns": ["database", "owner", "queue_name", "queue_table", "db_link", "destination_service_name", "destination_database", "destination_schema", "destination_queue_name"]}
,
{"topic": "DatabaseSchema", "default_columns": ["schema_name", "database", "owner", "size_gb", "tablespaces"], "topic_type": "nodes", "columns": ["database", "owner", "schema_name", "size_gb", "tablespaces"]}
,
{"topic": "DatabaseSchema-SCHEMA_ON_DATABASE-Database", "default_columns": ["source_schema_name", "destination_database"], "topic_type": "relations", "columns": ["source_schema_name", "destination_database"]}
,
{"topic": "databases_db_links", "default_columns": ["database", "db_link", "connect_string", "service_name", "destination_database"], "topic_type": "reports", "columns": ["database", "db_link", "connect_string", "service_name", "destination_database"]}
,
{"topic": "DatabaseService", "default_columns": ["database_service", "service_name", "service", "database"], "topic_type": "nodes", "columns": ["available_instance", "database", "database_service", "preferred_instance", "service", "service_name"]}
,
{"topic": "DatabaseService-SERVICE_ON_DATABASE-Database", "default_columns": ["source_database_service", "destination_database"], "topic_type": "relations", "columns": ["source_database_service", "destination_database"]}
,
{"topic": "datasources_databases", "default_columns": ["wls_domain_name", "wls_datasource", "ldapentry_name", "service_name", "database"], "topic_type": "reports", "columns": ["wls_domain_name", "wls_datasource", "ldapentry_name", "service_name", "database"]}
,
{"topic": "DbLink-DBLINK_TO_DATABASE_SERVICE-DatabaseService", "default_columns": ["source_db_link_name", "destination_database_service"], "topic_type": "relations", "columns": ["source_db_link_name", "destination_database_service"]}
,
{"topic": "DbLink", "default_columns": ["db_link_name", "db_link", "database", "owner", "destination_schema", "connect_string"], "topic_type": "nodes", "columns": ["connect_string", "database", "db_link", "db_link_name", "destination_schema", "owner"]}
,
{"topic": "DnsARecord-DNS_A_RECORD_TO_DNS_FORWARD_ZONE-DnsForwardZone", "default_columns": ["source_dns_a_record_name", "destination_dns_forward_zone_name"], "topic_type": "relations", "columns": ["source_dns_a_record_name", "destination_dns_forward_zone_name"]}
,
{"topic": "DnsARecord", "default_columns": ["dns_a_record_name", "domain", "host", "ip_address", "type"], "topic_type": "nodes", "columns": ["dns_a_record_name", "domain", "host", "ip_address", "type"]}
,
{"topic": "DnsCnameRecord-DNS_CNAME_RECORD_TO_DNS_A_RECORD-DnsARecord", "default_columns": ["source_dns_cname_record_name", "destination_dns_a_record_name"], "topic_type": "relations", "columns": ["source_dns_cname_record_name", "destination_dns_a_record_name"]}
,
{"topic": "DnsCnameRecord", "default_columns": ["alias", "dns_cname_record_name", "domain", "hostname", "type"], "topic_type": "nodes", "columns": ["alias", "dns_cname_record_name", "domain", "hostname", "type"]}
,
{"topic": "DnsConditionalForwarder-DNS_CONDITIONAL_FORWARDER_TO_DNS_SERVICE-DnsService", "default_columns": ["source_dns_conditional_forwarder_name", "destination_dns_service_name"], "topic_type": "relations", "columns": ["source_dns_conditional_forwarder_name", "destination_dns_service_name"]}
,
{"topic": "DnsConditionalForwarder", "default_columns": ["ad_integration", "dns_conditional_forwarder_name", "env", "forwarder_zone", "master_servers"], "topic_type": "nodes", "columns": ["ad_integration", "dns_conditional_forwarder_name", "env", "forwarder_zone", "master_servers"]}
,
{"topic": "DnsForwardZone-DNS_FORWARD_ZONE_TO_DNS_SERVICE-DnsService", "default_columns": ["source_dns_forward_zone_name", "destination_dns_service_name"], "topic_type": "relations", "columns": ["source_dns_forward_zone_name", "destination_dns_service_name"]}
,
{"topic": "DnsForwardZone", "default_columns": ["ad_integration", "dns_forward_zone_name", "env", "forward_zone", "type"], "topic_type": "nodes", "columns": ["ad_integration", "dns_forward_zone_name", "env", "forward_zone", "type"]}
,
{"topic": "DnsPtrRecord-DNS_PTR_RECORD_TO_DNS_REVERSE_ZONE-DnsReverseZone", "default_columns": ["source_dns_ptr_record_name", "destination_dns_reverse_zone_name"], "topic_type": "relations", "columns": ["source_dns_ptr_record_name", "destination_dns_reverse_zone_name"]}
,
{"topic": "DnsPtrRecord", "default_columns": ["dns_ptr_record_name", "hostname_reverse", "ip_reverse_prefix", "reverse_zone", "type"], "topic_type": "nodes", "columns": ["dns_ptr_record_name", "hostname_reverse", "ip_reverse_prefix", "reverse_zone", "type"]}
,
{"topic": "DnsReverseZone-DNS_REVERSE_ZONE_TO_DNS_SERVICE-DnsService", "default_columns": ["source_dns_reverse_zone_name", "destination_dns_service_name"], "topic_type": "relations", "columns": ["source_dns_reverse_zone_name", "destination_dns_service_name"]}
,
{"topic": "DnsReverseZone", "default_columns": ["ad_integration", "dns_reverse_zone_name", "env", "reverse_zone", "type"], "topic_type": "nodes", "columns": ["ad_integration", "dns_reverse_zone_name", "env", "reverse_zone", "type"]}
,
{"topic": "DnsService-DNS_SERVICE_ON_HOST-Host", "default_columns": ["source_dns_service_name", "destination_host"], "topic_type": "relations", "columns": ["source_dns_service_name", "destination_host"]}
,
{"topic": "DnsService", "default_columns": ["dns_servers", "dns_service_name", "env"], "topic_type": "nodes", "columns": ["dns_servers", "dns_service_name", "env"]}
,
{"topic": "File", "default_columns": ["actions", "application_name", "direction", "file_name", "frequenty", "location"], "topic_type": "nodes", "columns": ["actions", "application_name", "direction", "file_name", "frequenty", "location"]}
,
{"topic": "Host-HOST_IN_VMCLUSTER-VmCluster", "default_columns": ["source_host", "destination_vm_cluster"], "topic_type": "relations", "columns": ["source_host", "destination_vm_cluster"]}
,
{"topic": "Host-HOST_IN_WLS_DOMAIN-WlsDomain", "default_columns": ["source_host", "destination_wls_domain_name"], "topic_type": "relations", "columns": ["source_host", "destination_wls_domain_name"]}
,
{"topic": "Host", "default_columns": ["hostname", "host", "domain", "os_name", "os_version", "datacenter", "vm_application", "vm_component", "vm_project", "vm_remarks", "hpux_description", "env", "subenv", "as_env"], "topic_type": "nodes", "columns": ["architecture_name", "as_component", "as_domain", "as_env", "as_platform", "as_servers", "as_users", "as_webtier", "as_wm_compid", "as_wm_component", "as_wm_platform", "as_xrm_options", "cpu_cores", "datacenter", "db_instances", "deviceswap", "disks", "domain", "env", "host", "hostname", "hpux_description", "memory", "memory_gb", "memory_swapable", "model_name", "operatingsystem_name", "os_name", "os_version", "sd_partition", "storage_provisioned_gb", "storage_used_gb", "subenv", "type", "vm_application", "vm_cluster", "vm_component", "vm_organization", "vm_project", "vm_remarks"]}
,
{"topic": "hosts_packages_a-d", "default_columns": ["host", "package_name", "package"], "topic_type": "reports", "columns": ["host", "package_name", "package"]}
,
{"topic": "hosts_packages_e-h", "default_columns": ["host", "package_name", "package"], "topic_type": "reports", "columns": ["host", "package_name", "package"]}
,
{"topic": "hosts_packages_i-l", "default_columns": ["host", "package_name", "package"], "topic_type": "reports", "columns": ["host", "package_name", "package"]}
,
{"topic": "hosts_packages_m-p", "default_columns": ["host", "package_name", "package"], "topic_type": "reports", "columns": ["host", "package_name", "package"]}
,
{"topic": "hosts_packages_q-z", "default_columns": ["host", "package_name", "package"], "topic_type": "reports", "columns": ["host", "package_name", "package"]}
,
{"topic": "hosts_summary", "default_columns": ["domain", "os_name", "os_version", "datacenter", "host_count"], "topic_type": "reports", "columns": ["domain", "os_name", "os_version", "datacenter", "host_count"]}
,
{"topic": "KszFlux", "default_columns": ["application_name", "description", "env", "ksz_flux", "ksz_flux_name", "sending_online", "used_by"], "topic_type": "nodes", "columns": ["application_name", "description", "env", "ksz_flux", "ksz_flux_name", "sending_online", "used_by"]}
,
{"topic": "Letter", "default_columns": ["addressee", "application_name", "letter", "letter_name"], "topic_type": "nodes", "columns": ["addressee", "application_name", "letter", "letter_name"]}
,
{"topic": "MsSqlServerDatabase", "default_columns": ["host", "ms_sql_server_database", "ms_sql_server_database_name"], "topic_type": "nodes", "columns": ["host", "ms_sql_server_database", "ms_sql_server_database_name"]}
,
{"topic": "MsSqlServerDatabase-MS_SQL_SERVER_DATABASE_ON_MS_SQL_SERVER-MsSqlServer", "default_columns": ["source_ms_sql_server_database_name", "destination_ms_sql_server_name"], "topic_type": "relations", "columns": ["source_ms_sql_server_database_name", "destination_ms_sql_server_name"]}
,
{"topic": "MsSqlServer", "default_columns": ["domain", "host", "ms_sql_server_name", "product_level", "version"], "topic_type": "nodes", "columns": ["domain", "host", "ms_sql_server_name", "product_level", "version"]}
,
{"topic": "MsSqlServer-MS_SQL_SERVER_ON_HOST-Host", "default_columns": ["source_ms_sql_server_name", "destination_host"], "topic_type": "relations", "columns": ["source_ms_sql_server_name", "destination_host"]}
,
{"topic": "NexusArtifact", "default_columns": ["created_by", "created_date", "last_downloaded_date", "maven_artifact_id", "maven_extension", "maven_group_id", "maven_version", "nexus_path"], "topic_type": "nodes", "columns": ["created_by", "created_date", "last_downloaded_date", "maven_artifact_id", "maven_extension", "maven_group_id", "maven_version", "nexus_path"]}
,
{"topic": "NsCsAction", "default_columns": ["ns_cs_action_name", "ns_lb_vip_name"], "topic_type": "nodes", "columns": ["ns_cs_action_name", "ns_lb_vip_name"]}
,
{"topic": "NsCsAction-NS_CS_ACTION_TO_NS_LB_VIP-NsLbVip", "default_columns": ["source_ns_cs_action_name", "destination_ns_lb_vip_name"], "topic_type": "relations", "columns": ["source_ns_cs_action_name", "destination_ns_lb_vip_name"]}
,
{"topic": "NsCsPolicy", "default_columns": ["ns_cs_action_name", "ns_cs_policy_name", "rule"], "topic_type": "nodes", "columns": ["ns_cs_action_name", "ns_cs_policy_name", "rule"]}
,
{"topic": "NsCsPolicy-NS_CS_POLICY_TO_NS_CS_ACTION-NsCsAction", "default_columns": ["source_ns_cs_policy_name", "destination_ns_cs_action_name"], "topic_type": "relations", "columns": ["source_ns_cs_policy_name", "destination_ns_cs_action_name"]}
,
{"topic": "NsCsVip", "default_columns": ["ip_address", "netprofile", "ns_cs_vip_name", "port", "protocol"], "topic_type": "nodes", "columns": ["ip_address", "netprofile", "ns_cs_vip_name", "port", "protocol"]}
,
{"topic": "NsCsVip-NS_CS_VIP_TO_NS_CS_POLICY-NsCsPolicy", "default_columns": ["source_ns_cs_vip_name", "destination_ns_cs_policy_name"], "topic_type": "relations", "columns": ["source_ns_cs_vip_name", "destination_ns_cs_policy_name"]}
,
{"topic": "NsLbVip", "default_columns": ["ip_address", "lb_method", "netprofile", "ns_lb_vip_name", "persistence_type", "port", "protocol", "redirect_url"], "topic_type": "nodes", "columns": ["ip_address", "lb_method", "netprofile", "ns_lb_vip_name", "persistence_type", "port", "protocol", "redirect_url"]}
,
{"topic": "NsLbVip-NS_LB_VIP_TO_NS_SERVICEGROUP-NsServiceGroup", "default_columns": ["source_ns_lb_vip_name", "destination_ns_servicegroup_name"], "topic_type": "relations", "columns": ["source_ns_lb_vip_name", "destination_ns_servicegroup_name"]}
,
{"topic": "NsLbVip-NS_LB_VIP_TO_NS_SERVICE-NsService", "default_columns": ["source_ns_lb_vip_name", "destination_ns_service_name"], "topic_type": "relations", "columns": ["source_ns_lb_vip_name", "destination_ns_service_name"]}
,
{"topic": "NsServer", "default_columns": ["comment", "ip_address", "ns_server_name"], "topic_type": "nodes", "columns": ["comment", "ip_address", "ns_server_name"]}
,
{"topic": "NsServer-NS_SERVER_TO_HOST-Host", "default_columns": ["source_ns_server_name", "destination_host"], "topic_type": "relations", "columns": ["source_ns_server_name", "destination_host"]}
,
{"topic": "NsServiceGroup", "default_columns": ["netprofile", "ns_servicegroup_name", "protocol"], "topic_type": "nodes", "columns": ["netprofile", "ns_servicegroup_name", "protocol"]}
,
{"topic": "NsServiceGroup-NS_SERVICEGROUP_TO_NS_SERVER-NsServer", "default_columns": ["source_ns_servicegroup_name", "destination_ns_server_name", "port", "state"], "topic_type": "relations", "columns": ["source_ns_servicegroup_name", "destination_ns_server_name", "port", "state"]}
,
{"topic": "NsService", "default_columns": ["netprofile", "ns_server_name", "ns_service_name", "port", "protocol"], "topic_type": "nodes", "columns": ["netprofile", "ns_server_name", "ns_service_name", "port", "protocol"]}
,
{"topic": "NsService-NS_SERVICE_TO_NS_SERVER-NsServer", "default_columns": ["source_ns_service_name", "destination_ns_server_name"], "topic_type": "relations", "columns": ["source_ns_service_name", "destination_ns_server_name"]}
,
{"topic": "OsbBusinessService", "default_columns": ["osb_businessservice_name", "type", "url"], "topic_type": "nodes", "columns": ["osb_businessservice_name", "type", "url"]}
,
{"topic": "OsbBusinessService-OSB_DEPENDENCY-OsbProxyService", "default_columns": ["source_osb_businessservice_name", "destination_osb_proxyservice_name"], "topic_type": "relations", "columns": ["source_osb_businessservice_name", "destination_osb_proxyservice_name"]}
,
{"topic": "OsbProxyService", "default_columns": ["osb_proxyservice_name", "type", "osb_project_name", "url"], "topic_type": "nodes", "columns": ["osb_canonical_name", "osb_project_name", "osb_proxyservice_name", "type", "url"]}
,
{"topic": "OsbProxyService-OSB_DEPENDENCY-OsbProxyService", "default_columns": ["source_osb_proxyservice_name", "destination_osb_proxyservice_name"], "topic_type": "relations", "columns": ["source_osb_proxyservice_name", "destination_osb_proxyservice_name"]}
,
{"topic": "Package", "default_columns": ["package", "package_name"], "topic_type": "nodes", "columns": ["package", "package_name"]}
,
{"topic": "VmCluster", "default_columns": ["vm_cluster", "datacenter", "env", "vm_host_type"], "topic_type": "nodes", "columns": ["datacenter", "env", "vm_cluster", "vm_host_type"]}
,
{"topic": "vmclusters_hosts", "default_columns": ["vm_cluster", "datacenter", "env", "vm_host_type", "hostname", "os_name", "os_version"], "topic_type": "reports", "columns": ["vm_cluster", "datacenter", "vm_host_type", "env", "hostname", "os_name", "os_version"]}
,
{"topic": "WlsCluster", "default_columns": ["env", "wls_cluster", "wls_cluster_name", "wls_domain_name"], "topic_type": "nodes", "columns": ["env", "wls_cluster", "wls_cluster_name", "wls_domain_name"]}
,
{"topic": "WlsCluster-WLS_CLUSTER_IN_WLS_DOMAIN-WlsDomain", "default_columns": ["source_wls_cluster_name", "destination_wls_domain_name"], "topic_type": "relations", "columns": ["source_wls_cluster_name", "destination_wls_domain_name"]}
,
{"topic": "WlsDatasource", "default_columns": ["wls_datasource_name", "wls_domain_name", "wls_datasource", "db_user", "jndi_name", "connect_string"], "topic_type": "nodes", "columns": ["connect_string", "db_user", "driver", "global_tx_protocol", "jndi_name", "ons_nodes", "wls_datasource", "wls_datasource_name", "wls_domain_name", "wls_targets"]}
,
{"topic": "WlsDatasource-WLS_DATASOURCE_IN_WLS_DOMAIN-WlsDomain", "default_columns": ["source_wls_datasource_name", "destination_wls_domain_name"], "topic_type": "relations", "columns": ["source_wls_datasource_name", "destination_wls_domain_name"]}
,
{"topic": "WlsDatasource-WLS_DATASOURCE_TO_DATABASE_CONNECTSTRING-DatabaseConnectstring", "default_columns": ["source_wls_datasource_name", "destination_ldapentry_name"], "topic_type": "relations", "columns": ["source_wls_datasource_name", "destination_ldapentry_name"]}
,
{"topic": "WlsDatasource-WLS_DATASOURCE_TO_DATABASE_SERVICE-DatabaseService", "default_columns": ["source_wls_datasource_name", "destination_database_service"], "topic_type": "relations", "columns": ["source_wls_datasource_name", "destination_database_service"]}
,
{"topic": "WlsDatasource-WLS_DATASOURCE_TO_WLS_CLUSTER-WlsCluster", "default_columns": ["source_wls_datasource_name", "destination_wls_cluster_name"], "topic_type": "relations", "columns": ["source_wls_datasource_name", "destination_wls_cluster_name"]}
,
{"topic": "WlsDatasource-WLS_DATASOURCE_TO_WLS_SERVER-WlsServer", "default_columns": ["source_wls_datasource_name", "destination_wls_server_name"], "topic_type": "relations", "columns": ["source_wls_datasource_name", "destination_wls_server_name"]}
,
{"topic": "WlsDeployedApplication", "default_columns": ["version", "wls_deployed_application", "wls_deployed_application_name", "wls_domain_name", "wls_target"], "topic_type": "nodes", "columns": ["version", "wls_deployed_application", "wls_deployed_application_name", "wls_domain_name", "wls_target"]}
,
{"topic": "WlsDeployedApplication-WLS_DEPLOYED_APPLICATION_ON_WLS_CLUSTER-WlsCluster", "default_columns": ["source_wls_deployed_application_name", "destination_wls_cluster_name"], "topic_type": "relations", "columns": ["source_wls_deployed_application_name", "destination_wls_cluster_name"]}
,
{"topic": "WlsDeployedApplication-WLS_DEPLOYED_APPLICATION_ON_WLS_SERVER-WlsServer", "default_columns": ["source_wls_deployed_application_name", "destination_wls_server_name"], "topic_type": "relations", "columns": ["source_wls_deployed_application_name", "destination_wls_server_name"]}
,
{"topic": "WlsDeployedApplication-WLS_DEPLOYED_APPLICATION_TO_NEXUS_ARTIFACT-NexusArtifact", "default_columns": ["source_wls_deployed_application_name", "destination_nexus_path"], "topic_type": "relations", "columns": ["source_wls_deployed_application_name", "destination_nexus_path"]}
,
{"topic": "WlsDomain", "default_columns": ["wls_domain_name", "wls_version"], "topic_type": "nodes", "columns": ["env", "wls_domain_name", "wls_version"]}
,
{"topic": "wlsdomains_hosts", "default_columns": ["wls_domain_name", "wls_version", "wls_hosts"], "topic_type": "reports", "columns": ["wls_domain_name", "wls_version", "wls_hosts"]}
,
{"topic": "WlsServer", "default_columns": ["env", "machine", "wls_domain_name", "wls_server", "wls_server_name", "wls_version"], "topic_type": "nodes", "columns": ["env", "machine", "wls_domain_name", "wls_server", "wls_server_name", "wls_version"]}
,
{"topic": "WlsServer-WLS_SERVER_IN_WLS_CLUSTER-WlsCluster", "default_columns": ["source_wls_server_name", "destination_wls_cluster_name"], "topic_type": "relations", "columns": ["source_wls_server_name", "destination_wls_cluster_name"]}
,
{"topic": "WlsServer-WLS_SERVER_IN_WLS_DOMAIN-WlsDomain", "default_columns": ["source_wls_server_name", "destination_wls_domain_name"], "topic_type": "relations", "columns": ["source_wls_server_name", "destination_wls_domain_name"]}
,
{"topic": "WlsServer-WLS_SERVER_ON_HOST-Host", "default_columns": ["source_wls_server_name", "destination_host"], "topic_type": "relations", "columns": ["source_wls_server_name", "destination_host"]}
];
