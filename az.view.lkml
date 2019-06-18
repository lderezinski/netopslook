view: az {
  sql_table_name: circuit.az ;;

  dimension: azid {
    primary_key: yes
    type: number
    sql: ${TABLE}."azid" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."region" ;;
  }

  measure: count {
    type: count
    drill_fields: [azid, name, metric.count]
  }
}
