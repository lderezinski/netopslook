- dashboard: ISP_TEST
  title: ISP TEST
  layout: newspaper
  elements:
  - name: 95thSummedNTT
    title: NTT Bandwidth
    model: network_operations
    explore: TimeSeries
    type: looker_column
    fields: [az.region, TimeSeries.circuit_name, isp.name, isp.perMbpscost, isp.cir, bandwidthio.95th_percentile]
    filters:
      isp.name: ntt
      bandwidthio.date_date: 2019/09/01 to 2019/10/01
    sorts: [bandwidthio.95th_percentile desc]
    limit: 500
    dynamic_fields:
    - table_calculation: 95th_percentile
      label: 95th Percentile
      expression: sum(${bandwidthio.95th_percentile})
      value_format: 0.00,, "Mbps"
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost
      label: Cost
      expression: |-
        if(
        (
          sum(${bandwidthio.95th_percentile})-${isp.cir}
          )>0,
        (sum(${bandwidthio.95th_percentile})-${isp.cir})*${isp.perMbpscost}
        ,
        0
        )
      value_format: "$0.00,,"
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    legend_position: center
    series_types:
      isp.cir: scatter
    point_style: circle
    series_colors:
      isp.cir: "#068993"
    series_point_styles:
      isp.cir: triangle
    show_value_labels: true
    label_density: 25
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [bandwidthio.95th_percentile, TimeSeries.circuit_name]
