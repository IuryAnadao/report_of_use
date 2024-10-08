class Api::V1::DatabasesController < ApiController
  def index
    @databases = Database.all
    render json: @databases
  end

  def show
    @database = Database.find_by(id: params[:id])
    return render json: { message: 'Database not found' } , status: :not_found unless @database

    render json: @database
  end

  def create
    @database = Database.new(database_params)
    if @database.save
      render json: @database, status: :created
    else
      render json: @database.errors, status: :unprocessable_entity
    end
  end

  def update
    @database = Database.find(params[:id])
    if @database.update(database_params)
      render json: @database, status: :ok
    else
      render json: @database.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @database = Database.find(params[:id])
    @database.destroy
    render json: { message: 'Database deleted' }, status: :ok
  end

  private

  def database_params
    params.require(:database).permit(:name, :host, :port, :database, :username, :password)
  end
end
