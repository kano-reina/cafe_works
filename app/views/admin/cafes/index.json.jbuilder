json.data do
  json.items do
    json.array!(@cafes) do |cafe|
      json.id cafe.id
      json.user do
        json.name cafe.user.name
        json.image url_for(cafe.user.profile_image)
      end
      json.image url_for(cafe.image)
      json.shop_name cafe.shop_name
      json.caption cafe.caption
      json.address cafe.address
      json.latitude cafe.latitude
      json.longitude cafe.longitude
    end
  end
end
