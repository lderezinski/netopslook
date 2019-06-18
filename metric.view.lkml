view: metric {
  sql_table_name: circuit.metric ;;

  dimension: metricid {
    primary_key: yes
    type: number
    sql: ${TABLE}."metricid" ;;
  }

  dimension: azid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."azid" ;;
  }

  dimension: circuit_name {
    type: string
    sql: ${TABLE}."circuit_name" ;;
  }

  dimension: direction {
    type: string
    sql: ${TABLE}."direction" ;;
  }

  dimension: ispid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."ispid" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      metricid,
      circuit_name,
      name,
      az.name,
      az.azid,
      isp.ispid,
      isp.name,
      bandwidth.count
    ]
  }
}
