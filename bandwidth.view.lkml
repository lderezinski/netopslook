view: bandwidth {
  sql_table_name: ispstatus.bandwidth ;;

  dimension: az {
    type: string
    sql: ${TABLE}."az" ;;
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
    drill_fields: [circuit_name]
  }
}
