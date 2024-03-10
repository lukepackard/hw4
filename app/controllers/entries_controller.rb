class EntriesController < ApplicationController

  def index
    @entry = Entry.all

    # alternative responses to requests other than HTML
    respond_to do |format|
      format.html # implicitly renders entries/index.html.erb
      format.json do
        render :json => @entries
      end
    end
  end

  def new
    @user = User.find_by({ "id" => session["user_id"] })
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry.uploaded_image.attach(params["uploaded_image"])
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  else
    flash["notice"] = "Login first."
  end
  redirect_to "/entries"
end

end

  
