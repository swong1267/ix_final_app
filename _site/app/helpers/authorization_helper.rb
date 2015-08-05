module AuthorizationHelper 
  def can_crud_event?(event)
    event.user == current_user
  end

  def can_crud_space?(space)
    space.user == current_user
  end

  def owns_space?(space)
    space.user == current_user
  end

end