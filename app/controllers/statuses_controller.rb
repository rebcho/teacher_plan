class StatusesController < ApplicationController
  def index
    @statuses = Status.page(params[:page]).per(10)

    render("statuses/index.html.erb")
  end

  def show
    @improvement_plan = ImprovementPlan.new
    @status = Status.find(params[:id])

    render("statuses/show.html.erb")
  end

  def new
    @status = Status.new

    render("statuses/new.html.erb")
  end

  def create
    @status = Status.new

    @status.name = params[:name]

    save_status = @status.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/statuses/new", "/create_status"
        redirect_to("/statuses")
      else
        redirect_back(:fallback_location => "/", :notice => "Status created successfully.")
      end
    else
      render("statuses/new.html.erb")
    end
  end

  def edit
    @status = Status.find(params[:id])

    render("statuses/edit.html.erb")
  end

  def update
    @status = Status.find(params[:id])

    @status.name = params[:name]

    save_status = @status.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/statuses/#{@status.id}/edit", "/update_status"
        redirect_to("/statuses/#{@status.id}", :notice => "Status updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Status updated successfully.")
      end
    else
      render("statuses/edit.html.erb")
    end
  end

  def destroy
    @status = Status.find(params[:id])

    @status.destroy

    if URI(request.referer).path == "/statuses/#{@status.id}"
      redirect_to("/", :notice => "Status deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Status deleted.")
    end
  end
end
