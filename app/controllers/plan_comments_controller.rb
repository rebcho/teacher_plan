class PlanCommentsController < ApplicationController
  def index
    @plan_comments = PlanComment.all

    render("plan_comments/index.html.erb")
  end

  def show
    @plan_comment = PlanComment.find(params[:id])

    render("plan_comments/show.html.erb")
  end

  def new
    @plan_comment = PlanComment.new

    render("plan_comments/new.html.erb")
  end

  def create
    @plan_comment = PlanComment.new

    @plan_comment.body = params[:body]
    @plan_comment.user_id = params[:user_id]
    @plan_comment.plan_id = params[:plan_id]

    save_status = @plan_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/plan_comments/new", "/create_plan_comment"
        redirect_to("/plan_comments")
      else
        redirect_back(:fallback_location => "/", :notice => "Plan comment created successfully.")
      end
    else
      render("plan_comments/new.html.erb")
    end
  end

  def edit
    @plan_comment = PlanComment.find(params[:id])

    render("plan_comments/edit.html.erb")
  end

  def update
    @plan_comment = PlanComment.find(params[:id])

    @plan_comment.body = params[:body]
    @plan_comment.user_id = params[:user_id]
    @plan_comment.plan_id = params[:plan_id]

    save_status = @plan_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/plan_comments/#{@plan_comment.id}/edit", "/update_plan_comment"
        redirect_to("/plan_comments/#{@plan_comment.id}", :notice => "Plan comment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Plan comment updated successfully.")
      end
    else
      render("plan_comments/edit.html.erb")
    end
  end

  def destroy
    @plan_comment = PlanComment.find(params[:id])

    @plan_comment.destroy

    if URI(request.referer).path == "/plan_comments/#{@plan_comment.id}"
      redirect_to("/", :notice => "Plan comment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Plan comment deleted.")
    end
  end
end