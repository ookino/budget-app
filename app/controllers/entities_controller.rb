class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /entities or /entities.json
  def index
    @entities = current_user.entities.where(group_id: params[:group_id]).order(created_at: :desc)
    @group = Group.find(params[:group_id])
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    @entity.group = Group.find(params[:group_id])

    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_entities_path, notice: 'Entity was successfully created.' }

      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to group_entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
