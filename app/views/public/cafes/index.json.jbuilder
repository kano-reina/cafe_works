json.data do
  json.items do
    json.array!(@cafes) do |cafe|
      json.id cafe.id
      json.name cafe.name
      json.introduction cafe.introduction
      json.address cafe.address
    end
  end
end
