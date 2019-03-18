module UserHelper
  def user_status(user)
    if current_account.owner == user || user.invitation_accepted?
      content_tag(:span, 'Активный', class: 'badge badge-success')
    else
      content_tag(:span, 'Приглашение отправлено ', class: 'badge badge-light')
    end
  end
  def user_role(user)
    if current_account.owner == user || user.admin?
      content_tag(:span, 'Админ', class: 'badge badge-danger')
    else
    end
  end
end
