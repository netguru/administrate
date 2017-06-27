require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :name,
    :price,
    :description,
    :image_url,
    :categories,
  ].freeze

  ATTRIBUTE_TYPES = {
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::Text,
    image_url: Field::Image,
    name: Field::String,
    price: Field::Number.with_options(prefix: "$", decimals: 2),
    categories: Field::CollectionSelect.with_options(
      collection: Category.all,
      value_method: :id,
      text_method: :name,
    ),
  }.freeze

  COLLECTION_ATTRIBUTES = ATTRIBUTES
  FORM_ATTRIBUTES = ATTRIBUTES
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTES

  def display_resource(resource)
    resource.name
  end
end
