connection: "joyent"

# include all the views
include: "*.view"
include: "*.dashboard.lookml"


  # sql_trigger: SELECT MAX(id) FROM etl_log;;
datagroup: network_operations_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: network_operations_default_datagroup

explore: Events {
  from:  events
  group_label: "Opennms Events"
  view_label: "Sorted Events"
  description: "All events broken down by datacenter"
  join: az{
    view_label: "RegionDetails"
    sql_on: ${Events.azid}=${az.azid} ;;
    type: left_outer
    relationship: many_to_one
    fields: [az.region]
  }
}

explore: Bandwidth {
  from:  bandwidth
  group_label: "ISP Bandwidth"
  view_label: "Timeseries"
  description: "Bandwidth Timseries 5min increments"

  join: metric {
    view_label: "MetricDetails"
    sql_on: ${Bandwidth.metricid}=${metric.metricid} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: az{
    view_label: "RegionDetails"
    sql_on: ${metric.azid}=${az.azid} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: isp {
    view_label: "ISPDetails"
    sql_on: ${metric.ispid}=${isp.ispid} ;;
    type: left_outer
    relationship: many_to_one
  }

}

explore: By_ISP{
  from: ispregiondata
  description: "ISP Bandwidth data by ISP"
  group_label: "ISP Bandwidth"
  view_label: "Bandwidth By ISP"
}
