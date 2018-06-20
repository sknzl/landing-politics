module ApplicationHelper
  def position_helper(politician, leader)
    html = ""
    if politician.class == Politician
      if politician.leader
        html = "Leader"
        return html.html_safe
      else
        html = "Politician. The superior is "
        html += link_to(leader.name, politician_path(leader))
        return html.html_safe
      end
    else
      html = "Subordinate"
      return html.html_safe
    end
  end


  def chart_helper(year_leader_start, year_leader_end, year_prison_start, year_prison_end)
    if year_prison_start != nil && year_leader_start !=nil
      if year_prison_start > year_leader_end || year_leader_start > year_prison_end
        return [
          ["Leader", "#{year_leader_start}-01-01", "#{year_leader_end}-01-01"],
          ["Prison", "#{year_prison_start}-01-01", "#{year_prison_end}-01-01"]
        ]
      else
        return [
          ["Leader",  "#{year_leader_start}-01-01", "#{year_prison_start}-01-01"],
          ["Leader",  "#{year_prison_end}-01-01", "#{year_leader_end}-01-01"],
          ["Prison", "#{year_prison_start}-01-01", "#{year_prison_end}-01-01"]
        ]
      end
    elsif year_leader_start == nil
      return [
        ["Prison", "#{year_prison_start}-01-01", "#{year_prison_end}-01-01"]
      ]

    elsif year_prison_start == nil
      return [
        ["Leader", "#{year_leader_start}-01-01", "#{year_leader_end}-01-01"]
      ]
    end
  end
end
