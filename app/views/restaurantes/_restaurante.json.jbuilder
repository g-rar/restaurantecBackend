json.extract! restaurante, :id, :nombrerest, :latitudrest, :longitudrest, :tiporest, :calificacionrest, :preciorest, :numtelefono, :created_at, :updated_at
json.url restaurante_url(restaurante, format: :json)
