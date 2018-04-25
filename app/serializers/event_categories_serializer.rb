class EventCategoriesSerializer < ActiveModel::Serializer
  attributes :name
  attributes :id

  def id
    object.id
  end

  def name
    object.name
  end
end
