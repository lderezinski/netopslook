- dashboard: monthly_isp_95_test
  title: Monthly ISP 95%
  layout: newspaper
  elements:
  #Singapore
  #PCCW
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
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    col: 0
    row: 0
    height: 6
    width: 8

  #NTT
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
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    col: 8
    row: 0
    height: 6
    width: 8
  #Singtel
  - title: SingTel Monthly
    name: SingTel Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: singtel
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    col: 16
    row: 0
    height: 6
    width: 8
#United States
#Telia
  - title: Telia Global Monthly
    name: Telia Global Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: telia
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    col: 0
    row: 6
    height: 6
    width: 8

#Level3
  - title: Level3 East Monthly
    name: Level3 East Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: level3
      By_ISP.Region: us-east
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    height: 6
    width: 8
    col: 8
    row: 6

#Zayo
  - title: Zayo Monthly
    name: Zayo Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: zayo
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    height: 6
    width: 8
    col: 16
    row: 6

#DTK
  - title: DTK Monthly
    name: DTK Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: dt
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    height: 6
    width: 8
    col: 0
    row: 12

#Level3 Central
  - title: Level3 Central Monthly
    name: Level3 Central Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: level3
      By_ISP.Region: eu-central
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    height: 6
    width: 8
    col: 8
    row: 16

#Kinx
  - title: Kinx Monthly
    name: Kinx Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: kinx
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    height: 6
    width: 8
    col: 16
    row: 16

#KT
  - title: Korea Telcom Monthly
    name: Korea Telcom Monthly
    model: network_operations
    explore: By_ISP
    type: looker_column
    fields: [By_ISP.Region, By_ISP.ISP, By_ISP.Direction, By_ISP.perMbpscost, By_ISP.cir,
      By_ISP.95th_percentile, By_ISP.cost]
    filters:
      By_ISP.date_date: this month
      By_ISP.ISP: kinx
    sorts: [By_ISP.95th_percentile desc]
    limit: 1
    query_timezone: UTC
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
        __FILE: network_operations/95Percentile.dashboard.lookml
        __LINE_NUM: 22
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: By_ISP.cir, id: By_ISP.cir,
            name: Cir, __FILE: network_operations/95Percentile.dashboard.lookml, __LINE_NUM: 32},
          {axisId: By_ISP.cost, id: By_ISP.cost, name: Cost, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 33}, {axisId: By_ISP.95th_percentile, id: By_ISP.95th_percentile,
            name: 95th Percentile, __FILE: network_operations/95Percentile.dashboard.lookml,
            __LINE_NUM: 34}], showLabels: true, showValues: true, valueFormat: '0.000,,',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 29}]
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
    font_size: ''
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
    label_color: ["#0000", white, black]
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: '', __FILE: network_operations/95Percentile.dashboard.lookml,
        __LINE_NUM: 69}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#F15922"
    down_color: "#068993"
    total_color: "#A85573"
    height: 6
    width: 8
    col: 0
    row: 24
