class StoresController < ApplicationController
  include ParamBuilder
  include Serializer

  before_action :delete_invalid_stores
  before_action :set_stores, only: [:index, :update]

  def index
    stores = @stores
    unless params[:keys].nil?
      filter_params = build_filter_params(params[:keys])
      stores = @stores.where(key: filter_params)
    end
    stores.update_all(validity: Time.now + 5.minutes) unless stores.empty?
    json_response(stores_json(stores))
  end

  def create
    formatted_params = build_store_params(store_params)
    s = Store.create!(formatted_params)
    json_response({ message: 'created successfully.' })
  end

  def update
    formatted_params = build_store_params(store_params)
    formatted_params.each do |param|
      obj = @stores.find_by(key: param[:key])
      obj.update!(value: param[:value]) unless obj.nil?
    end
    json_response({message: 'update successfully.'})
  end

  private

  def delete_invalid_stores
    Store.where('validity < ?', Time.now).delete_all
  end

  def set_stores
    @stores = Store.where('validity >= ?', Time.now)
  end

  def store_params
    params.require(:store)
  end
end
