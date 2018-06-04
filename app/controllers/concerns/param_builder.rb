module ParamBuilder
  def build_store_params(params)
    params_list = []
    params.each_pair { |k, v| params_list << { key: k, value: v } }
    params_list
  end
end