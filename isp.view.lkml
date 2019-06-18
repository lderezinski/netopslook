view: isp {
  sql_table_name: circuit.isp ;;

  dimension: ispid {
    primary_key: yes
    type: number
    sql: ${TABLE}."ispid" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  measure: count {
    type: count
    drill_fields: [ispid, name, metric.count]
  }
}
