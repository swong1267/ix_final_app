module AuthorizationHelper 
  def can_crud_event?(event)
    event.user == current_user
  end
end