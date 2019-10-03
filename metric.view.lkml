view: metric {
  sql_table_name: circuit.metric ;;

  dimension: metricid {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}."metricid" ;;
  }

  dimension: direction {
    type: string
    sql: ${TABLE}."direction" ;;
  }

  dimension: circuit_name {
    type: string
    sql: ${TABLE}."circuit_name" ;;
  }
  dimension: azid {
    type: number
    hidden: yes
    sql: ${TABLE}."azid" ;;
  }
  dimension: ispid {
    type: number
    hidden: yes
    sql: ${TABLE}."ispid" ;;
  }

}
