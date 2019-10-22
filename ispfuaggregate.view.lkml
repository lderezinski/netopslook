view: ispfuaggregate {

  derived_table: {
    sql:  select sum(b.invalue) as invalue,sum(b.outvalue) as outvalue,b.date,a.region,i.name as isp
      from circuit.bandwidthio as b
      join circuit.check as c on c.checkid=b.checkid
      join circuit.az as a on a.azid=c.azid
      join circuit.isp as i on i.ispid=c.ispid
      group by b.date,a.region,i.name;;
    indexes: ["invalue","outvalue"]
    persist_for: "24 hours"
  }

  dimension:  Region{
    type: string
    description: "Geographical Region for Data"
    sql:  ${TABLE}.region ;;
  }
  dimension:  Direction{
    type: string
    description: "Direction of data In or Out"
    sql:  ${TABLE}.direction ;;
  }
  dimension:  ISP{
    type: string
    description: "Vendor Providing the Circuit"
    sql:  ${TABLE}.isp ;;
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

  measure: cost {
    type: number
    value_format: "$0.00,,"
    sql: CASE
          WHEN ${TABLE}.isp = 'ntt' THEN (greatest(0,(${95th_percentile}-12000000000)))*1.97
          WHEN ${TABLE}.isp = 'dt' THEN (greatest(0,(${95th_percentile}-12000000000)))*1.50
          WHEN ${TABLE}.isp = 'level3' and ${TABLE}.region='eu-central' THEN (greatest(0,(${95th_percentile}-6000000000)))*.75
          WHEN ${TABLE}.isp = 'pccw' THEN (greatest(0,(${95th_percentile}-12000000000)))*2.80
          WHEN ${TABLE}.isp = 'singtel' THEN (greatest(0,(${95th_percentile}-12000000000)))*2.28
          WHEN ${TABLE}.isp = 'ntt' THEN (greatest(0,(${95th_percentile}-12000000000)))*1.97
          WHEN ${TABLE}.isp = 'att' THEN (greatest(0,(${95th_percentile}-30000000000)))*6.38
          WHEN ${TABLE}.isp = 'level3' and ${TABLE}.region='us-east' THEN (greatest(0,(${95th_percentile}-6000000000)))*1.03
          WHEN ${TABLE}.isp = 'zayo' THEN (greatest(0,(${95th_percentile}-20000000000)))*.50
          WHEN ${TABLE}.isp = 'telia' THEN (greatest(0,(${95th_percentile}-25000000000)))*.65
          WHEN ${TABLE}.isp = 'kt' THEN (greatest(0,(${95th_percentile}-6000000000)))*11.95
          WHEN ${TABLE}.isp = 'kinx' THEN (greatest(0,(${95th_percentile}-6000000000)))*5.31
          ELSE 0
          END;;
  }
  measure: average {
    type: average
    value_format: "0.000,,\" Mbps\""
    sql: ${TABLE}.value ;;
  }
  measure: count {
    type: count
    drill_fields: [Region,ISP]
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
