class ScriptsController < ApplicationController
  before_action :set_script, only: [:show, :edit, :update, :destroy]

  # GET /scripts
  # GET /scripts.json
  def index
    @scripts = Script.all
  end

  # GET /scripts/1
  # GET /scripts/1.json
  def show
    @game_thread = GameThread.all
  end

  # GET /scripts/new
  def new
    @script = Script.new
  end

  # GET /scripts/1/edit
  def edit
  end

  def upvote
    @script = Script.find(params[:script_id])

    respond_to do |format|
      if !user_signed_in?
        format.html { redirect_to new_user_session_path }
      else
        @script.liked_by current_user
        @script.save
        format.html { redirect_to :back, notice: 'Successfully upvoted!' }
        format.json { render :show, status: :created, location: @script }
      end
    end
  end

  def unvote
    @script = Script.find(params[:script_id])

    respond_to do |format|
      if !user_signed_in?
        format.html { redirect_to new_user_session_path }
      else
        @script.unliked_by current_user
        @script.save
        format.html { redirect_to :back, notice: 'Successfully unvoted!' }
        format.json { render :show, status: :created, location: @script }
      end
    end
  end


  # POST /scripts
  # POST /scripts.json
  def create
    @script = Script.new(script_params)

    respond_to do |format|
      if @script.save
        format.html { redirect_to :back, notice: 'Script was successfully created.' }
        format.json { render :show, status: :created, location: @script }
      else
        format.html { render :new }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scripts/1
  # PATCH/PUT /scripts/1.json
  def update
    respond_to do |format|
      if @script.update(script_params)
        format.html { redirect_to @script, notice: 'Script was successfully updated.' }
        format.json { render :show, status: :ok, location: @script }
      else
        format.html { render :edit }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scripts/1
  # DELETE /scripts/1.json
  def destroy
    @script.destroy
    respond_to do |format|
      format.html { redirect_to scripts_url, notice: 'Script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script
      @script = Script.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def script_params
      params.require(:script).permit(:content, :game_thread_id, :user_id, :round)
    end
end
