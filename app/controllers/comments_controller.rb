# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy]

  def create
    save_comment comment_params
  end

  def destroy
    @comment.destroy
    set_flash_notice 'notice', 'Comment deleted'
    redirect_to back_with_anchored_resource anchor: @comment.id
  end

  private

  def save_comment(comment_params)
    @comment = current_user.add_new_comment(comment_params)
    if @comment.errors.any?
      set_flash_notice 'alert', 'Comment could not be saved. Did you forget to write something?'
    else
      set_flash_notice 'notice', 'Comment added successfully'
    end

    redirect_back fallback_location: root_path
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
