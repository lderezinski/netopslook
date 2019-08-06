view: events {
  sql_table_name: circuit.events ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."metricid" ;;
  }

  dimension: azid {
    type: number
    value_format_name: id
     hidden: yes
    sql: ${TABLE}."azid" ;;
  }

  dimension: message {
    type:  string
    sql: ${TABLE}."message" ;;
  }

  dimension: label {
    type:  string
    sql: ${TABLE}."label" ;;
  }

  dimension: eventid {
    type:  number
    sql:  ${TABLE}."maxeventid" ;;
  }

  dimension: uei {
    type:  string
    sql: ${TABLE}."uei" ;;
  }
  dimension_group: maxdate {
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
    sql: ${TABLE}."maxdate" ;;
  }

  dimension_group: mindate {
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
    sql: ${TABLE}."mindate" ;;
  }

  measure: count {
    type:  sum
    sql: ${TABLE}."count" ;;
  }


}
