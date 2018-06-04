module Serializer
  def stores_json(stores)
    json = {}
    stores.each do |store|
      json[store.key.to_sym] = store.value
    end
    json
  end
end