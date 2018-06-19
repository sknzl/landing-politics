class Party < ApplicationRecord
 has_many :politicians
 has_many :subordinates

  def leader(year)
    if year < leader_year_prison || year > leader_year_free
      return self.politicians.find_by(leader: 1)
    elsif politicians_free(year).any?
      return politicians_free(year).first
    else
      return self.subordinates.first
    end
  end

  def leader_year_prison
    politician_leader = self.politicians.find_by(leader: 1)
    leader_prison = Event.where("politician_id = #{politician_leader.id} AND action = 'prison' ").first.year
  end

  def leader_year_free
    politician_leader = self.politicians.find_by(leader: 1)
    leader_free = Event.where("politician_id = #{politician_leader.id} AND action = 'free' ").first.year
  end

  def politicians_free(year)
    politicians_selected = []
    self.politicians.where(" leader = false ").each do |politician|
      politician_prison = Event.where("politician_id = #{politician.id} AND action = 'prison' ")
      politician_free = Event.where("politician_id = #{politician.id} AND action = 'free' ")
      if year < politician_prison.first.year || year > politician_free.first.year
        politicians_selected << politician
      end
    end
    return politicians_selected
  end

end


