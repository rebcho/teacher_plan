class ActionsController < ApplicationController
  def index
    @actions = Action.page(params[:page]).per(10)

    render("actions/index.html.erb")
  end

  def show
    @action = Action.find(params[:id])

    render("actions/show.html.erb")
  end

  def new
    @action = Action.new

    render("actions/new.html.erb")
  end

  def create
    @action = Action.new

    @action.goal_id = params[:goal_id]
    @action.description = params[:description]
    @action.target_date = params[:target_date]
    @action.lead_person = params[:lead_person]
    @action.resources_needed = params[:resources_needed]
    @action.imp_specifics = params[:imp_specifics]
    @action.success_measurement = params[:success_measurement]

    save_status = @action.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/actions/new", "/create_action"
        redirect_to("/actions")
      else
        redirect_back(:fallback_location => "/", :notice => "Action created successfully.")
      end
    else
      render("actions/new.html.erb")
    end
  end

  def edit
    @action = Action.find(params[:id])

    render("actions/edit.html.erb")
  end

  def update
    @action = Action.find(params[:id])

    @action.goal_id = params[:goal_id]
    @action.description = params[:description]
    @action.target_date = params[:target_date]
    @action.lead_person = params[:lead_person]
    @action.resources_needed = params[:resources_needed]
    @action.imp_specifics = params[:imp_specifics]
    @action.success_measurement = params[:success_measurement]

    save_status = @action.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/actions/#{@action.id}/edit", "/update_action"
        redirect_to("/actions/#{@action.id}", :notice => "Action updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Action updated successfully.")
      end
    else
      render("actions/edit.html.erb")
    end
  end

  def destroy
    @action = Action.find(params[:id])

    @action.destroy

    if URI(request.referer).path == "/actions/#{@action.id}"
      redirect_to("/", :notice => "Action deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Action deleted.")
    end
  end
end
