view: ispazdata {
  derived_table: {
    sql:  select sum(b.value) as value,b.date,m.direction,a.region,a.name as az
      from circuit.bandwidth as b
      join circuit.metric as m on m.metricid=b.metricid
      join circuit.az as a on a.azid=m.azid
      join circuit.isp as i on i.ispid=m.ispid
      group by b.date,m.direction,a.region,a.name;;
    indexes: ["value","metricid"]
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
  dimension:  AZ{
    type: string
    description: "AZ within region"
    sql:  ${TABLE}.az ;;
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
    drill_fields: [Region,AZ]
  }
}
