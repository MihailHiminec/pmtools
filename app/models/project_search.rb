class ProjectSearch
  include SearchObject.module(:model, :enum, :sorting)

  scope { Project.all }

  sort_by :created_at

  option :user_id

  option :title do |scope, value|
    scope.where 'title LIKE ?', escape_search_term(value)
  end

  private
  def escape_search_term(title)
    "%#{title.gsub(/\s+/, '%')}%"
  end
end

