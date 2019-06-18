view: percentiles {
  derived_table: {
    sql:  drop table IF EXISTS sumvalues;
    select sum(b.value) as value,b.date,m.direction,a.region,i.name as isp,date_part('month',b.date) as mth
    into TEMP TABLE sumvalues
    from circuit.bandwidth as b
    join circuit.metric as m on m.metricid=b.metricid
    join circuit.az as a on a.azid=m.azid
    join circuit.isp as i on i.ispid=m.ispid
    where date_part('month',b.date)=6
    group by b.date,m.direction,a.region,i.name;
    select
    direction,
    region,
    isp,
    mth,
    (percentile_cont(0.95) within group ( order by value))/1000000 as percentile,
    (avg(value)/1000000) as average,
    count(value) as datapoints
    from
    sumvalues
    group by direction,region,isp,mth;;
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
    description: "95th Percentile of this Data over a given period of time"
    sql:  ${TABLE}.percentile ;;
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
