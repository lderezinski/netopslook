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
    label: "Device Label"
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

  measure: count {
    type:  sum
    sql: ${TABLE}."count" ;;
  }
  measure: maxdate {
    type: date
    sql: MAX(${TABLE}."maxdate") ;;
  }

  measure: mindate{
    type: date
    sql: MIN(${TABLE}."mindate") ;;
  }


}
