view: bandwidth {
  sql_table_name: ispstatus.bandwidth ;;

  dimension: az {
    type: string
    sql: ${TABLE}."az" ;;
  }
  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."date" || ${TABLE}."isp" || ${TABLE}."region" || ${TABLE}."type" || ${TABLE}."circuit_name"|| ${TABLE}."direction";;
  }

  dimension: circuit_name {
    type: string
    sql: ${TABLE}."circuit_name" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."date" ;;
  }

  dimension: direction {
    type: string
    sql: ${TABLE}."direction" ;;
  }

  dimension: isp {
    type: string
    sql: ${TABLE}."isp" ;;
  }

  dimension: metric {
    type: string
    sql: ${TABLE}."metric" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."region" ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}."value" ;;
  }

  measure: count {
    type: count
    drill_fields: [circuit_name,date_time,direction,isp,region,value]
  }
  measure: value_sum {
    type: sum
    sql: ${TABLE}."value" ;;
  }
  measure: value_avg {
    type: average
    sql: ${TABLE}."value" ;;
  }
}
