module ConversationsHelper

  def render_conversation_request(request_id)
    # TODO : this is ugly and have performance, fix later
    request = Request.find(request_id)
    link_to( request.title , request_conversations_path(request.token))
  end
end
