class GameThreadsController < ApplicationController
  before_action :set_game_thread, only: [:show, :edit, :update, :destroy]

  # GET /game_threads
  # GET /game_threads.json
  def index
    @game_threads = GameThread.all
  end

  # GET /game_threads/1
  # GET /game_threads/1.json
  def show
    @script = Script.new
    @scripts = Script.where(game_thread_id: @game_thread.id)
  end

  # GET /game_threads/new
  def new
    @game_thread = GameThread.new
  end

  # GET /game_threads/1/edit
  def edit
  end

  # POST /game_threads
  # POST /game_threads.json
  def create
    @game_thread = GameThread.new(game_thread_params)

    respond_to do |format|
      if @game_thread.save
        format.html { redirect_to @game_thread, notice: 'Game thread was successfully created.' }
        format.json { render :show, status: :created, location: @game_thread }
      else
        format.html { render :new }
        format.json { render json: @game_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_threads/1
  # PATCH/PUT /game_threads/1.json
  def update
    respond_to do |format|
      if @game_thread.update(game_thread_params)
        format.html { redirect_to @game_thread, notice: 'Game thread was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_thread }
      else
        format.html { render :edit }
        format.json { render json: @game_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_threads/1
  # DELETE /game_threads/1.json
  def destroy
    @game_thread.destroy
    respond_to do |format|
      format.html { redirect_to game_threads_url, notice: 'Game thread was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_thread
      @game_thread = GameThread.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_thread_params
      params.require(:game_thread).permit(:thread_name, :genre)
    end
end
