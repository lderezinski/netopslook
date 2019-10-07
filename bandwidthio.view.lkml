view: bandwidthio {
  sql_table_name: circuit.bandwidthio ;;

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

  dimension: checkid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}."checkid" ;;
  }

  dimension: ispid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}."ispid" ;;
  }

  dimension: invalue {
    type: number
    hidden: yes
    sql: ${TABLE}."invalue" ;;
  }

  dimension: fuvalue {
    type: number
    hidden: yes
    sql: CASE
      WHEN ${TABLE}.invalue>${TABLE}.outvalue THEN ${TABLE}.invalue
      ELSE ${TABLE}.outvalue
      END;;
  }

  dimension: outvalue {
    type: number
    hidden: yes
    sql: ${TABLE}."outvalue" ;;
  }

  measure: count {
    type: count
    drill_fields: [check.circuit_name, check.name]
  }

  measure: fu95th_percentile {
    type: percentile
    percentile: 95
    value_format: "0.000,,\" Mbps\""
    sql: ${fuvalue};;
  }

  measure: 95th_percentile {
    type: percentile
    percentile: 95
    value_format: "0.000,,\" Mbps\""
    sql: CASE
      WHEN ${TABLE}.invalue>${TABLE}.outvalue THEN ${TABLE}.invalue
      ELSE ${TABLE}.outvalue
      END;;
  }

  measure: 95th_percentile_in {
    type: percentile
    percentile: 95
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.invalue ;;
  }

  measure: 95th_percentile_out {
    type: percentile
    percentile: 95
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.outvalue ;;
  }


  measure: average_out {
    type: average
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.outvalue ;;
  }

  measure: average_in {
    type: average
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.invalue ;;
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
