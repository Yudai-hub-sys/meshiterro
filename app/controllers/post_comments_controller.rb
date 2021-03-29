class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: %i[ show edit update destroy ]

  # POST /post_comments or /post_comments.json
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  # PATCH/PUT /post_comments/1 or /post_comments/1.json
  def update
  end

  # DELETE /post_comments/1 or /post_comments/1.json
  def destroy
    PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
