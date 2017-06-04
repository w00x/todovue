class Api::V1::TodosController < Api::V1::BaseController
  before_action :set_api_v1_todo, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/todos
  # GET /api/v1/todos.json
  def index
    @api_v1_todos = Todo.all
    render json: @api_v1_todos
  end

  # GET /api/v1/todos/1
  # GET /api/v1/todos/1.json
  def show
    render json: @api_v1_todo
  end

  # POST /api/v1/todos
  # POST /api/v1/todos.json
  def create
    @api_v1_todo = Todo.new(api_v1_todo_params)

    respond_to do |format|
      if @api_v1_todo.save
        format.json { render json: @api_v1_todo, status: :created }
      else
        format.json { render json: @api_v1_todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/todos/1
  # PATCH/PUT /api/v1/todos/1.json
  def update
    respond_to do |format|
      if @api_v1_todo.update(api_v1_todo_params)
        format.json { render json: @api_v1_todo, status: :ok }
      else
        format.json { render json: @api_v1_todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/todos/1
  # DELETE /api/v1/todos/1.json
  def destroy
    @api_v1_todo.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_todo
      @api_v1_todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_todo_params
      params.permit(:description, :success)
    end
end
