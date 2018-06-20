class PartiesController < ApplicationController
  def index
    if params[:year].present?
      @year = params[:year].to_i
    else
      @year = 1970
    end

    @parties = []
    Party.all.each do |party|
      @parties << {
        name: party.name,
        leader: party.leader(@year),
        politicians: party.politicians_free(@year),
        subordinates: party.subordinates.where("birthyear <= #{@year}")
      }
    end
  end



  private

  def party_params
    params.require(:party).permit(:year)
  end

end

