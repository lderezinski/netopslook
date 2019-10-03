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
    type:  max
    sql:  ${TABLE}."date" ;;
  }
  measure: mindate {
    type:  min
    sql:  ${TABLE}."date" ;;
  }
}
