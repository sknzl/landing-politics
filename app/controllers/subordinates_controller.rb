class SubordinatesController < ApplicationController
    before_action :set_subordinate, only: [:show]

  def show
    if params[:year].present?
      @year = params[:year].to_i
    else
      @year = 1970
    end
     @leader = Politician.where("party_id = #{@subordinate.party_id} AND leader = true").first

  end


  private

  def set_subordinate
    @subordinate = Subordinate.find(params[:id])
  end

  def subordinate_params
      params.require(:subordinate).permit(:year)
  end

end
