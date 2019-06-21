view: bandwidth {
  sql_table_name: circuit.bandwidth ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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

  dimension: metricid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."metricid" ;;
  }

  dimension: ispid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."ispid" ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}."value" ;;
  }
  measure: sum {
    type: sum
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id, metric.metricid, metric.circuit_name, metric.name]
  }
}
