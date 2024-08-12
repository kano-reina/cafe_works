json.data do
  json.items do
    json.array!(@cafes) do |cafe|
      json.id cafe.id
      json.name cafe.name
      json.introduction cafe.introduction
      json.address cafe.address
      json.latitude cafe.latitude
      json.longitude cafe.longitude
    end
  end
end
