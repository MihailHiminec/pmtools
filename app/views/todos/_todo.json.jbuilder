json.extract! todo, :id, :title, :discription, :user_id, :project_id, :deadline, :isCompleted, :time_spent, :cost, :time_to_complete, :priority, :implementer
json.url project_todo_url(todo, format: :json)
