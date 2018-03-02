class GoalCommentsController < ApplicationController
  def index
    @goal_comments = GoalComment.page(params[:page]).per(10)

    render("goal_comments/index.html.erb")
  end

  def show
    @goal_comment = GoalComment.find(params[:id])

    render("goal_comments/show.html.erb")
  end

  def new
    @goal_comment = GoalComment.new

    render("goal_comments/new.html.erb")
  end

  def create
    @goal_comment = GoalComment.new

    @goal_comment.body = params[:body]
    @goal_comment.user_id = params[:user_id]
    @goal_comment.goal_id = params[:goal_id]

    save_status = @goal_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/goal_comments/new", "/create_goal_comment"
        redirect_to("/goal_comments")
      else
        redirect_back(:fallback_location => "/", :notice => "Goal comment created successfully.")
      end
    else
      render("goal_comments/new.html.erb")
    end
  end

  def edit
    @goal_comment = GoalComment.find(params[:id])

    render("goal_comments/edit.html.erb")
  end

  def update
    @goal_comment = GoalComment.find(params[:id])

    @goal_comment.body = params[:body]
    @goal_comment.user_id = params[:user_id]
    @goal_comment.goal_id = params[:goal_id]

    save_status = @goal_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/goal_comments/#{@goal_comment.id}/edit", "/update_goal_comment"
        redirect_to("/goal_comments/#{@goal_comment.id}", :notice => "Goal comment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Goal comment updated successfully.")
      end
    else
      render("goal_comments/edit.html.erb")
    end
  end

  def destroy
    @goal_comment = GoalComment.find(params[:id])

    @goal_comment.destroy

    if URI(request.referer).path == "/goal_comments/#{@goal_comment.id}"
      redirect_to("/", :notice => "Goal comment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Goal comment deleted.")
    end
  end
end
