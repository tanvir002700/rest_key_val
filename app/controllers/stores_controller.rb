class StoresController < ApplicationController
  include ParamBuilder

  def index
    stores = Store.where('validity >= ?', Time.now)
    unless params[:keys].nil?
      filter_params = build_filter_params(params[:keys])
      stores = stores.where(key: filter_params)
    end
    stores.update_all(validity: Time.now + 5.minutes)
    render json: stores
  end

  def create
    formatted_params = build_store_params(store_params)
    Store.create(formatted_params)
    render json: params
  end

  def update
    formatted_params = build_store_params(store_params)
    formatted_params.each do |param|
      obj = Store.find_by(key: param[:key])
      obj.update(value: param[:value])
    end
  end

  def store_params
    params.require(:store)
  end
end
