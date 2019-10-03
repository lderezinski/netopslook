view: isp {
  sql_table_name: circuit.isp ;;

  dimension: ispid {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}."ispid" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
}
