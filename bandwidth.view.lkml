view: bandwidth {
  sql_table_name: circuit.bandwidth ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}."id" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
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
     hidden: yes
    sql: ${TABLE}."metricid" ;;
  }

  dimension: ispid {
    type: number
    value_format_name: id
     hidden: yes
    sql: ${TABLE}."ispid" ;;
  }

  dimension: value {
    type: number
    hidden: yes
    sql: ${TABLE}."value" ;;
  }

  measure: sum {
    type: sum
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [metric.circuit_name, metric.name]
  }

  measure: 95th_percentile {
    type: percentile
    percentile: 95
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.value ;;
  }

  measure: max95th {
    type: number
    sql: MAX(${95th_percentile}) ;;
  }

  measure: average {
    type: average
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.value ;;
  }

  measure: maxdate {
    type: date
    sql: MAX(${TABLE}."date") ;;
  }

  measure: mindate{
    type: date
    sql: MIN(${TABLE}."date") ;;
  }
}
