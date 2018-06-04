class StoresController < ApplicationController
  include ParamBuilder

  def index
    stores = if params[:keys].nil?
               Store.where('validity >= ?', Time.now)
             else
               filter_params = build_filter_params(params[:keys])
               puts filter_params
               Store.where(key: filter_params).where('validity >= ?', Time.now)
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
