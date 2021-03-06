class Api::Users::Wall::CommentsController < Api::ApiController

  # GET /api/users/:id/wall/comments
  def show
    wallOwnerUser = User.find_by(id: params[:id].to_i)

    if wallOwnerUser.nil?
      render status: :error,
             json: { result: "error", message: "User does not exist" }
      return
    end

    if wallOwnerUser.wall.nil?
      wallOwnerUser.wall = Wall.create(user_id: params[:id].to_i)
    end

    if wallOwnerUser.wall.comments.nil?
      render status: :ok,
             json: {
                      result: "ok",
                      message: "No comments to show",
                      data: { wallComments: [] }
                   }
      return
    end

    @comments = wallOwnerUser.wall.comments
    render status: :ok
  end

  # POST /api/users/:id/wall/comments
  def create_wall_comment
    unless exists_create_comment_required_params?
      render_missing_required_params
      return
    end

    creatorUser = User.find_by_authentication_token(params[:user_token])

    if creatorUser.nil?
      render status: :error,
             json: { result: "error", message: "User does not exist" }
      return
    end

    wallOwnerUser = User.find_by(id: params[:id].to_i)
    wall = wallOwnerUser.wall

    if wall.nil?
      render status: :error,
             json: { result: "error", message: "Wall does not exist" }
      return
    end

    comment = Comment.create(text: params[:message])
    comment.date = params[:date]
    comment.post_type = params[:post_type]
    comment.user = creatorUser
    wall.comments << comment

    render status: :created,
           json: { result: "ok", message: "Create comment success" }
  end

  # POST /api/users/:id/wall/notifications
  def create_wall_notification
    unless exists_create_comment_required_params?
      render_missing_required_params
      return
    end

    wallOwnerUser = User.find_by(id: params[:id].to_i)
    wall = wallOwnerUser.wall

    if wall.nil?
      render status: :error,
             json: { result: "error", message: "Wall does not exist" }
      return
    end

    comment = Comment.create(text: params[:message])
    comment.date = params[:date]
    comment.post_type = params[:post_type]
    comment.user = wallOwnerUser
    wall.comments << comment

    render status: :created,
           json: { result: "ok", message: "Create comment success" }
  end

  private

    def exists_create_comment_required_params?
      if params[:message].nil?
        return false
      end
      return true
    end

end
