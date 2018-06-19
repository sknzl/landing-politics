class Party < ApplicationRecord
 has_many :politicians
 has_many :subordinates

  def leader(year)
    politician_leader = self.politicians.find_by(leader: 1)
    leader_prison = Event.where("politician_id = #{politician_leader.id} AND action = 'prison' ")
    leader_free = Event.where("politician_id = #{politician_leader.id} AND action = 'free' ")

    politicians = self.politicians.where(" leader = false ")
    politician_select = []
    politicians.each do |politician|
      politician_prison = Event.where("politician_id = #{politician.id} AND action = 'prison' ")
      politician_free = Event.where("politician_id = #{politician.id} AND action = 'free' ")
      if politician_prison.exists? || politician_prison.exists?
        if year < politician_prison.first.year || year > politician_free.first.year
          politician_select << politician
        end
      end
    end
  if year < leader_prison.first.year || year > leader_free.first.year
    return self.politicians.find_by(leader: 1)
  elsif politician_select.any?
    return politician_select.first
  else
    return self.subordinates.first
  end

  end
end

 #   if self.politicians.exists?(leader: 1)
  #    self.politicians.find_by(leader: 1)

   # elsif self.politicians.where('leader: 0)'.order('birthyear asc').first
    #  self.politicians.where('leader: 0)'.order('birthyear asc').first

    #else
    #  self.subordinates.order('birthyear asc').first
    #end
  #end
#end



#&& Event.where("year = year AND politician_id = #{self.politicians.find_by(leader: 1).id} AND action = 'prison' ").empty? == true