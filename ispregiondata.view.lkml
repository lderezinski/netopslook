view: ispregiondata {

  derived_table: {
    sql:  select sum(b.value) as value,b.date,m.direction,a.region,i.name as isp
from circuit.bandwidth as b
join circuit.metric as m on m.metricid=b.metricid
join circuit.az as a on a.azid=m.azid
join circuit.isp as i on i.ispid=m.ispid
group by b.date,m.direction,a.region,i.name;;
    indexes: ["value"]
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
    sql: ${TABLE}.value ;;
  }

  dimension: perMbpscost {
    type:  number
    value_format: "$0.00 \"per Mbps\""
    sql: CASE
    WHEN ${TABLE}.isp = 'ntt' THEN 1.97
    WHEN ${TABLE}.isp = 'dt' THEN 1.50
    WHEN ${TABLE}.isp = 'telia' THEN .65
    WHEN ${TABLE}.isp = 'level3' and ${TABLE}.region='eu-central' THEN .75
    WHEN ${TABLE}.isp = 'pccw' THEN 2.80
    WHEN ${TABLE}.isp = 'singtel' THEN 2.28
    WHEN ${TABLE}.isp = 'ntt' THEN 1.97
    WHEN ${TABLE}.isp = 'att' THEN 6.38
    WHEN ${TABLE}.isp = 'level3' and ${TABLE}.region='us-east' THEN 1.03
    WHEN ${TABLE}.isp = 'zayo' THEN 1.75
    WHEN ${TABLE}.isp = 'kt' THEN 11.95
    WHEN ${TABLE}.isp = 'kinx' THEN 5.31
    ELSE 0
    END;;
  }

  measure: cir {
    type:  number
    value_format: "0.000,,\" Mbps\""
    sql: CASE
          WHEN ${TABLE}.isp = 'ntt' THEN 12000000000
          WHEN ${TABLE}.isp = 'dt' THEN 12000000000
          WHEN ${TABLE}.isp = 'telia' THEN 25000000000
          WHEN ${TABLE}.isp = 'level3' and ${TABLE}.region='us-east' THEN 6000000000
          WHEN ${TABLE}.isp = 'pccw' THEN 12000000000
          WHEN ${TABLE}.isp = 'singtel' THEN 12000000000
          WHEN ${TABLE}.isp = 'ntt' THEN 12000000000
          WHEN ${TABLE}.isp = 'att' THEN 30000000000
          WHEN ${TABLE}.isp = 'level3' and ${TABLE}.region='eu-central' THEN 6000000000
          WHEN ${TABLE}.isp = 'zayo' THEN 20000000000
          WHEN ${TABLE}.isp = 'kt' THEN 6000000000
          WHEN ${TABLE}.isp = 'kinx' THEN 6000000000
          ELSE 0
          END;;
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
    WHEN ${TABLE}.isp = 'zayo' THEN (greatest(0,(${95th_percentile}-20000000000)))*1.75
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
