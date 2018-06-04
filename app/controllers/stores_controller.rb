class StoresController < ApplicationController
  include ParamBuilder

  def index
    stores = Store.where('validity >= ?', Time.now)
    unless params[:keys].nil?
      filter_params = build_filter_params(params[:keys])
      stores = stores.where(key: filter_params)
      stores.update_all(validity: Time.now + 5.minutes)
    end
    render json: stores
  end

  def create
    formatted_params = build_store_params(store_params)
    Store.create(formatted_params)
    render json: params
  end

  def update
    formatted_params = build_store_params(store_params)

  end

  def store_params
    params.require(:store)
  end
end
