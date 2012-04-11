module ApplicationHelper
  def display_notice
    return unless flash[:notice].present?
    return ('<div id="error"> <p>' + flash[:notice] + '</p> </div>').html_safe 
  end

  def display_footer  
    '<a rel="license" href="http://creativecommons.org/licenses/by/3.0/de/" style="float:left; margin-right:10px;"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/de/88x31.png" /></a><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type">Bowling</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.regedor.com/" property="cc:attributionName" rel="cc:attributionURL">Miguel Regedor</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/de/">Creative Commons Attribution 3.0 Germany License</a>. Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/regedor/bowling" rel="dct:source">github.com</a>.'.html_safe
  end
  
  def display_game_duration(game)
    return "Rolling..." unless game.finished?
    ((game.updated_at - game.created_at) / 1.minute).round.to_s + "minutes"
  end
  
  def display_roll_results(result)
    "Nice played!"
  end
  
  def display_ball(ball_name,frame_number, ball, bonus, bonus_char)
    out = "<div class='#{ball_name}'><span id='#{ball_name}Pins#{frame_number}' class='pinsKnockedDown'>"
    out += if bonus
      bonus_char
    elsif ball.present?
      ball.to_s
    else
      "&nbsp;"
    end
    (out + "</span></div>").html_safe
  end  
  
  def link_to_icon(icon_name, url_or_object, options={})
    options.merge!({ :class => "icon #{icon_name}" })

    link_to(image_tag("icons/#{icon_name}.png", { :title => icon_name }),
    url_or_object,
    options)
  end
end
