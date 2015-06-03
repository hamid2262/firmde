json.array!(@view_statistics) do |view_statistic|
  json.extract! view_statistic, :id, :viewer_ip, :page, :section
  json.url view_statistic_url(view_statistic, format: :json)
end
