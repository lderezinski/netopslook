view: ispglobal {

  derived_table: {
    sql:  select sum(b.invalue) as invalue,sum(b.outvalue) as outvalue,b.date,i.name as isp
      from circuit.bandwidthio as b
      join circuit.check as c on c.checkid=b.checkid
      join circuit.isp as i on i.ispid=c.ispid
      where i.name='telia'
      group by b.date,i.name;;
    indexes: ["invalue","outvalue"]
    persist_for: "24 hours"
  }

  dimension: ISP {
    type:  string
    sql: ${TABLE}.isp ;;

  }

  dimension_group: date {
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
    sql: ${TABLE}."date" ;;
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
    sql: ${TABLE}.invalue;;
  }

  measure: 95th_percentile_out {
    type: percentile
    percentile: 95
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.outvalue;;
  }

  dimension: perMbpscost {
    type:  number
    value_format: "$0.00 \"per Mbps\""
    sql: CASE
          WHEN ${TABLE}.isp = 'telia' THEN .65
          ELSE 0
          END;;
  }

  measure: cir {
    type:  number
    value_format: "0.000,,\" Mbps\""
    sql: CASE
          WHEN ${TABLE}.isp = 'telia' THEN 25000000000
          ELSE 0
          END;;
  }

  measure: cost {
    type: number
    value_format: "$0.00,,"
    sql: CASE
          WHEN ${TABLE}.isp = 'telia' THEN (greatest(0,(${95th_percentile}-25000000000)))*.65
          ELSE 0
          END;;
  }
  measure: average_in {
    type: average
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.invalue ;;
  }

  measure: average_out {
    type: average
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.outvalue ;;
  }

  measure: count {
    type: count
    drill_fields: [ISP]
  }

  measure: maxdate {
    type:  date
    sql:  MAX(${TABLE}."date");;
  }
  measure: mindate {
    type:  date
    sql:  MIN(${TABLE}."date");;
  }
}
