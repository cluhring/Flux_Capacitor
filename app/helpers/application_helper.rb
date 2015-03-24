module ApplicationHelper

  def fuel_color_helper(fuel_type)
    case fuel_type
      when "BD"
      "#FFA500" #Orange
      when "CNG"
      "#FFFFFF" #White
      when "E85"
      "#000000" #Black
      when "ELEC"
      "#0000FF" #Blue
      when "HY"
      "#FFFF00" #Yellow
      when "LNG"
      "#008000" #Green
      else "LPG"
      "#FF0000" #Red
    end
  end

end
