view: percentiles {
  derived_table: {
    sql:  select
direction,
region,
isp,
date_part('month',date) as month,
percentile_cont(0.95) within group ( order by value) as percentile,
avg(value) as average,
count(value) as datapoints
from
circuit.ispsumvalues
group by direction,region,isp,date_part('month',date);;
  }

  dimension:  Region{
    type: string
    description: "Geographical Region for Data"
    sql:  ${TABLE}.region ;;
  }
  dimension:  Direction{
    type: string
    description: "Direction of data In or Out"
    sql:  ${TABLE}.direction ;;
  }
  dimension:  ISP{
    type: string
    description: "Vendor Providing the Circuit"
    sql:  ${TABLE}.isp ;;
  }
  dimension: Percentile {
    type: number
    value_format: "0.000,,\" Mbps\""
    description: "95th Percentile of this Data over a given period of time"
    sql:  ${TABLE}.percentile;;
  }
  dimension: Average {
    type: number
    value_format: "0.000,,\" Mbps\""
    description: "Average of this Data over a given period of time"
    sql:  ${TABLE}.average;;

  }
}

# view: percentiles {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
