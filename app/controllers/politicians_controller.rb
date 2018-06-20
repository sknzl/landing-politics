class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show]

  def show
    if params[:year].present?
      @year = params[:year].to_i
    else
      @year = 1970
    end

    if @politician.class == Politician
      @leader = Politician.where("party_id = #{@politician.party_id} AND leader = true").first

      @year_free = Event.where("politician_id = #{@politician.id} AND action = 'free' ").first.year
      @year_prison = Event.where("politician_id = #{@politician.id} AND action = 'prison' ").first.year

      party= Party.find(@politician.party_id)
      @years_leader = []
      years = (1970..2018).to_a
      years.each do |year|
        if party.leader(year).id == @politician.id
          @years_leader << year

        end
      end
    end
  end


  private

  def set_politician
    if Politician.exists?(params[:id])
      @politician = Politician.find(params[:id])
    else
      @politician = Subordinate.find(params[:id])
    end
  end

  def politician_params
      params.require(:politician).permit(:year)
  end


end
