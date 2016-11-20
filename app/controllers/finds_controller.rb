class FindsController < ApplicationController
  def new
    @find = Find.new
  end

  def create
    @find = Find.create(find_params)
    redirect_to @find
  end

  def show
    @find = Find.find(params[:id])
  end

  def find_params
    params.require(:find).permit(:first_name,:last_name)
  end
end
