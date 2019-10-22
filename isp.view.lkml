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

  dimension: perMbpscost {
    type:  number
    value_format: "$0.00 \"per Mbps\""
    sql: CASE
          WHEN ${TABLE}.name = 'ntt' THEN 1.97
          WHEN ${TABLE}.name = 'dt' THEN 1.50
          WHEN ${TABLE}.name = 'telia' THEN .65
          WHEN ${TABLE}.name = 'level3' and ${az.region}='eu-central' THEN .75
          WHEN ${TABLE}.name = 'pccw' THEN 2.80
          WHEN ${TABLE}.name = 'singtel' THEN 2.28
          WHEN ${TABLE}.name = 'ntt' THEN 1.97
          WHEN ${TABLE}.name = 'att' THEN 6.38
          WHEN ${TABLE}.name = 'level3' and ${az.region}='us-east' THEN 1.03
          WHEN ${TABLE}.name = 'zayo' THEN .50
          WHEN ${TABLE}.name = 'kt' THEN 11.95
          WHEN ${TABLE}.name = 'kinx' THEN 5.31
          ELSE 0
          END;;
  }

  measure: cir {
    type:  number
    value_format: "0.000,,\" Mbps\""
    sql: CASE
          WHEN ${TABLE}.name = 'ntt' THEN 12000000000
          WHEN ${TABLE}.name = 'dt' THEN 12000000000
          WHEN ${TABLE}.name = 'telia' THEN 25000000000
          WHEN ${TABLE}.name = 'level3' and ${az.region}='us-east' THEN 6000000000
          WHEN ${TABLE}.name = 'pccw' THEN 12000000000
          WHEN ${TABLE}.name = 'singtel' THEN 12000000000
          WHEN ${TABLE}.name = 'ntt' THEN 12000000000
          WHEN ${TABLE}.name = 'att' THEN 30000000000
          WHEN ${TABLE}.name = 'level3' and ${az.region}='eu-central' THEN 6000000000
          WHEN ${TABLE}.name = 'zayo' THEN 20000000000
          WHEN ${TABLE}.name = 'kt' THEN 6000000000
          WHEN ${TABLE}.name = 'kinx' THEN 6000000000
          ELSE 0
          END;;
  }
}
