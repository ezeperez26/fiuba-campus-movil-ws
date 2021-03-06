class Api::Friends::FriendshipsController < Api::ApiController

  # GET /api/friends
  def index
    user = User.find_by_authentication_token(params[:user_token])
    logger.debug "[API] User sender: #{user.attributes.inspect}"

    @friends = user.friends
    logger.debug "[API] Friends: #{@friends.inspect}"

    @pending_friendship_requests = user.received_friendship_requests
    logger.debug "[API] Pending friendship requests: #{@pending_friendship_requests.inspect}"

    @sent_friendship_request = user.sent_friendship_requests
    logger.debug "[API] Sent friendship requests: #{@sent_friendship_requests.inspect}"

    render status: :ok
  end

end
