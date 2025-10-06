class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @q = policy_scope(User).ransack(params[:q])
    @users = @q.result(distinct: true)
              .order(employee_number: :asc)
              .page(params[:page])
              .per(params[:per_page] || 10)

    respond_to do |format|
      format.html
      format.csv do
        send_data Users::CsvExporter.call(@users),
                  filename: "users-#{Time.zone.today}.csv"
      end
    end
  end

  def show
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      redirect_to @user, notice: '社員を登録しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    if @user.update(user_params)
      redirect_to @user, notice: '社員情報を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_url, notice: '社員を削除しました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(policy(User).permitted_attributes_for_create)
  end
end
