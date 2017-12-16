class EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :update, :destroy]

  # GET /encounters
  def index
    # @encounter = Encounter.all
    if params[:patientname]
      @encounterpatient = Encounter.where("patientname = ?",params[:patientname])
      render json: @encounterpatient
    elsif params[:workername]
      @encounterpatient = Encounter.where("workername = ?",params[:workername])
      render json: @encounterpatient
    elsif params[:meetdate]
      @encounterpatient = Encounter.where("meetdate = ?",params[:meetdate])
      render json: @encounterpatient
    else
      @encounter = Encounter.all
      render json: @encounter
    end
  end

  # GET /encounters/1
  def show
    render json: @encounter
  end

  # POST /encounters
  def create
    @encounter = Encounter.new(encounter_params)

    if @encounter.save
      render json: @encounter, status: :created, location: @encounter
    else
      render json: @encounter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /encounters/1
  def update
    if @encounter.update(encounter_params)
      render json: @encounter
    else
      render json: @encounter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /encounters/1
  def destroy
    @encounter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def encounter_params
      params.require(:encounter).permit(:patientname, :workername, :assessment, :meetdate)
    end
end
