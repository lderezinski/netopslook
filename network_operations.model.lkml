connection: "joyent"

# include all the views
include: "*.view"


datagroup: network_operations_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: network_operations_default_datagroup

explore: bandwidth {
  description: "Circuit bandwidth"
  group_label: "Circuits"
  view_label: "bw"

}
explore: az {}

explore: isp {}

explore: metric {}
