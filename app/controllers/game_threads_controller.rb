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

    @total_rounds = @game_thread.round
    @top_voted_scripts = []

    (1..@total_rounds-1).each do |round|
      @scripts_in_round = @scripts.where(round: round)
      @most_votes = @scripts_in_round.first

      @scripts_in_round.each do |script|
        if script.votes_for.size > @most_votes.votes_for.size
          @most_votes = script
        end
      end
      @top_voted_scripts << @most_votes
    end

    @round_end_time = @game_thread.round_end_time

  end

  # GET /game_threads/new
  def new
    @game_thread = GameThread.new
  end

  # GET /game_threads/1/edit
  def edit
  end

  def add_writer
    @game_thread = GameThread.find(params[:game_thread_id])
    if !(@game_thread.users.include? current_user)
      @game_thread.users.push current_user
    end

    if (@game_thread.users.count >= @game_thread.min_writer) && (@game_thread.start_time == nil)
      @game_thread.round_end_time = Time.now + (@game_thread.preparation_phase_length / 1000)
      @game_thread.start_time = Time.now
      @game_thread.phase = "preparation"
    end

    respond_to do |format|
      if @game_thread.save
        format.html { redirect_to :back, notice: 'You have joined as a writer!' }
        format.json { render :show, status: :created, location: @game_thread }
      else
        format.html { render :new }
        format.json { render json: @game_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_writer
    @game_thread = GameThread.find(params[:game_thread_id])
    @game_thread.users.delete current_user

    respond_to do |format|
      if @game_thread.save
        format.html { redirect_to :back, notice: 'You have left the game as a writer' }
        format.json { render :show, status: :created, location: @game_thread }
      else
        format.html { render :new }
        format.json { render json: @game_thread.errors, status: :unprocessable_entity }
      end
    end
  end


  def switch_phase
    @game_thread = GameThread.find(params[:game_thread_id])
    # @game_thread.phase = "voting"
    if @game_thread.phase == "preparation"
      @game_thread.round_end_time = Time.now + (@game_thread.writing_phase_length / 1000)
      @game_thread.phase = "writing"
    elsif @game_thread.phase == "writing"
      @game_thread.round_end_time = Time.now + (@game_thread.voting_phase_length / 1000)
      @game_thread.phase = "voting"
    end

    respond_to do |format|
      if @game_thread.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @game_thread }
      else
        format.html { render :new }
        format.json { render json: @game_thread.errors, status: :unprocessable_entity }
      end
    end

  end


  def move_to_next_round
    @game_thread = GameThread.find(params[:game_thread_id])
    @game_thread.phase = "preparation"

    @game_thread.round_end_time = Time.now + (@game_thread.preparation_phase_length / 1000)
    @game_thread.round = @game_thread.round + 1
    @game_thread.save

    respond_to do |format|
      if @game_thread.save
        format.html { redirect_to :back, notice: "Commence round #{@game_thread.round}" }
        format.json { render :show, status: :created, location: @game_thread }
      else
        format.html { render :new }
        format.json { render json: @game_thread.errors, status: :unprocessable_entity }
      end
    end

  end


  # POST /game_threads
  # POST /game_threads.json
  def create
    @game_thread = GameThread.new(game_thread_params)
    @game_thread.users.push current_user

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
      params.require(:game_thread).permit(:thread_name, :genre, :intro, :user_id, :round, :phase, :max_writer, :min_writer)
    end
end
