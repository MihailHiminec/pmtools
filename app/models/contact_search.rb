class ContactSearch
  include SearchObject.module(:model, :enum, :sorting)

  scope { Contact.all }

  sort_by :created_at

  option :user_id

  option :name do |scope, value|
    scope.where 'name LIKE ?', escape_search_term(value)
  end

  private
  def escape_search_term(name)
    "%#{name.gsub(/\s+/, '%')}%"
  end
end

