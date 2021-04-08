module FarmDisplayHelper

    def soil_health_traffic_light score
        if score < 0.6667
            return ('<div class="red-traffic-light">Poor</div>').html_safe
        elsif score < 1.3334
            return ('<div class="yellow-traffic-light">Fair</div>').html_safe
        else
          return ('<div class="green-traffic-light">Good</div>').html_safe
        end
    end
end
