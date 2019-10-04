- dashboard: 95Percentile
  title: 95Percentile
  layout: newspaper
  elements:
  - title: PCCW Monthly
    name: PCCW Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: pccw
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [
      {
        label: '',
        orientation: left,
        series: [
          {axisId: By_ISP.cir, id: By_ISP.cir, name: Cir},
          {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile, name: 95th Percentile},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost}
        ],
        showLabels: true,
        showValues: true,
        valueFormat: '0.000,,',
        unpinAxis: true,
        tickDensity: default,
        tickDensityCustom: 5,
        type: linear
      }
    ]
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
    limit_displayed_rows: false
    legend_position: center
    label_value_format: ''
    series_types:
      By_ISP.cir: scatter
    point_style: circle
    series_colors:
      By_ISP.cir: "#068993"
    series_point_styles:
      By_ISP.cir: triangle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [
      {
        reference_type: line,
        line_value: max,
        range_start: max,
        range_end: min,
        margin_top: deviation,
        margin_value: mean,
        margin_bottom: deviation,
        label_position: right,
        color: "#000000",
        label: ''
      }
    ]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    listen: {}
    row: 30
    col: 0
    width: 8
    height: 6
  - title: NTT Monthly
    name: NTT Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: ntt
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile}, {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost}],
        showLabels: true, showValues: true, valueFormat: '0.000,,', unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    limit_displayed_rows: false
    legend_position: center
    label_value_format: ''
    series_types:
      By_ISP.cir: scatter
    point_style: circle
    series_colors:
      By_ISP.cir: "#068993"
    series_point_styles:
      By_ISP.cir: triangle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: ''}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    row: 0
    col: 8
    width: 8
    height: 6
