class StoresController < ApplicationController
  include ParamBuilder

  def index
    stores = Store.where("validity >= ?", Time.now)
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
