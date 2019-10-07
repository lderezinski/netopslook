view: check {
  sql_table_name: circuit.check ;;

  dimension: checkid {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}."checkid" ;;
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
