module ApplicationHelper
  def form_auth
    <<-HTML
      <input type="hidden" name="authenticity_token"
      value="#{ form_authenticity_token }">
    HTML
    .html_safe
  end

  def like_create(likeable_id, likeable_type)
    <<-HTML
      <form class="like-form" action="#{api_likes_url}" method="post">
        #{form_auth}

        <input type="hidden" name="like[user_id]" value="#{@current_user.id}">

        <input type="hidden" name="like[likeable_id]" value="#{likeable_id}">

        <input type="hidden" name="like[likeable_type]" value="#{likeable_type}">

        <button>Like!</button>
      </form>
    HTML
    .html_safe
  end

  def like_delete(likeable_id, likeable_type)
    <<-HTML
      <form class="like-form" action="#{api_likes_url}" method="post">
        #{form_auth}
        <input type="hidden" name="_method" value="delete">

        <input type="hidden" name="like[likeable_id]" value="#{likeable_id}">

        <input type="hidden" name="like[likeable_type]" value="#{likeable_type}">

        <button>Delete!</button>
      </form>
    HTML
    .html_safe
  end
end
