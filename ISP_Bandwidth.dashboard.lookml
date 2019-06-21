- dashboard: isp_bandwidth
  title: ISP Bandwidth
  layout: tile
  tile_size: 100

  filters:
    - name: date
      title: 'Date Range'
      type: date_filter
      default_value: 1 month

  elements:
    - name: hello_world
      type: looker_column
