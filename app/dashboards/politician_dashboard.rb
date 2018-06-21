require "administrate/base_dashboard"

class PoliticianDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    party: Field::HasOne,
    events: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    birthyear: Field::Number,
    leader: Field::Boolean,
    party_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :party,
    :events,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :party,
    :events,
    :id,
    :name,
    :birthyear,
    :leader,
    :party_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :party,
    :events,
    :name,
    :birthyear,
    :leader,
    :party_id,
  ].freeze

  # Overwrite this method to customize how politicians are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(politician)
  #   "Politician ##{politician.id}"
  # end
end
