class UserSongsController < ApplicationController
before_action :set_song, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!
# GET /songs
  # GET /songs.json
  def index
    @user = User.find(params[:user_id])
    @user_songs = @user.user_songs
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @user_song = UserSong.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @user_song = UserSong.new(user_song_params)

    respond_to do |format|
      if @user_song.save
        format.html { redirect_to @user_user_songs_path(current_user), notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @user_song }
      else
        format.html { render :new }
        format.json { render json: @user_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @user_song.update(user_song_params)
        format.html { redirect_to @user_song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_song }
      else
        format.html { render :edit }
        format.json { render json: @user_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @user_song.destroy
    respond_to do |format|
      format.html { redirect_to user_songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_song
      @user_song = UserSong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:user_song).permit(:name, :duration, :genre_id)
    end
end

