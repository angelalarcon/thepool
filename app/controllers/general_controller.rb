class GeneralController < ApplicationController
  before_filter :allow_iframe_requests

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
  
  def single_page
    @menu_home = [   
              {"link" => "#que_es", "label" => "¿Qué es hack?", "class" => "nav_caracteristicas active", "data" => {"offsettop" => "60"} },
              {"link" => "#como_funciona", "label" => "¿Cómo funciona?", "class" => "nav_comofunciona",  "data" => {"offsettop" => "60"}},
              {"link" => "#speed_dating", "label" => "Speed dating", "class" => "nav_speed_dating", "data" => {"offsettop" => "60"}},
              {"link" => "#campus", "label" => "Campus", "class" => "nav_campus",  "data" => {"offsettop" => "60"}}
            ]
    @menu_developer = [   
              {"link" => "#main_developer", "label" => "Developers", "class" => "nav_main_developer active", "data" => {"offsettop" => "60"}}, 
              {"link" => "#planificacion_developer", "label" => "Planificación", "class" => "nav_planificacion", "data" => {"offsettop" => "60"}},
              {"link" => "#programacion", "label" => "Programación", "class" => "nav_detalle", "data" => {"offsettop" => "60"}},
              {"link" => "#precio", "label" => "Precio", "class" => "nav_precio_developer", "data" => {"offsettop" => "60"}}
            ]
    @menu_sponsor = [   
              {"link" => "#main_sponsor", "label" => "Sponsors", "class" => "nav_main_sponsor active", "data" => {"offsettop" => "60"}}, 
              {"link" => "#planificacion_sponsor", "label" => "¿Cómo funciona?", "class" => "nav_comofunciona_sponsor", "data" => {"offsettop" => "60"}},
              {"link" => "#inversion", "label" => "Inversión", "class" => "nav_precio_sponsor", "data" => {"offsettop" => "60"}}
            ]
    render layout: "single_page"
  end
  
  def index
    @menu = [   
              {"link" => "#main", "label" => "Inicio", "class" => "nav_main active", "data" => {"offsettop" => "60"} },
              {"link" => "#caracteristicas", "label" => "¿Qué es hack?", "class" => "nav_caracteristicas", "data" => {"offsettop" => "60"} },
              {"link" => "#comofunciona", "label" => "¿Cómo funciona?", "class" => "nav_comofunciona",  "data" => {"offsettop" => "60"}},
              {"link" => "#speed_dating", "label" => "Speed dating", "class" => "nav_speed_dating", "data" => {"offsettop" => "60"}},
              {"link" => "#campus", "label" => "Campus", "class" => "nav_campus",  "data" => {"offsettop" => "60"}}
            ]
    @btn_back = {"exist" => false, "text" => "", "link" => ""};
  end

  def soon
    @menu = [   

            ]
            @btn_back = {"exist" => true, "text" => "INICIO", "link" => "../"};
  end

  def want_to_be_developer
    @menu = [   
              {"link" => "#main", "label" => "Developers", "class" => "nav_main_developer active", "data" => {"offsettop" => "60"}}, 
              {"link" => "#planificacion", "label" => "Planificación", "class" => "nav_planificacion", "data" => {"offsettop" => "60"}},
              {"link" => "#programacion", "label" => "Programación", "class" => "nav_detalle", "data" => {"offsettop" => "60"}},
              {"link" => "#precio", "label" => "Precio", "class" => "nav_precio_developer", "data" => {"offsettop" => "60"}},
            ]
    @btn_back = {"exist" => true, "text" => "SPONSOR", "link" => "/want_to_be_sponsor"};            
  end

  def want_to_be_sponsor
    @menu = [   
              {"link" => "#main", "label" => "Sponsors", "class" => "nav_main_sponsor active", "data" => {"offsettop" => "60"}}, 
              {"link" => "#planificacion", "label" => "¿Cómo funciona?", "class" => "nav_comofunciona_sponsor", "data" => {"offsettop" => "60"}},
              {"link" => "#inversion", "label" => "Inversión", "class" => "nav_precio_sponsor", "data" => {"offsettop" => "60"}},
            ]
    @btn_back = {"exist" => true, "text" => "DEVELOPER", "link" => "/want_to_be_developer"};
  end
  
  def want_to_be_mentor
    @menu = [   
              {"link" => "#main", "label" => "Mentores", "class" => "nav_main_sponsor active", "data" => {"offsettop" => "60"}}, 
              {"link" => "#horarios", "label" => "Horarios", "class" => "nav_horarios", "data" => {"offsettop" => "60"}},
              {"link" => "#requisitos", "label" => "Requisitos", "class" => "nav_requisitos", "data" => {"offsettop" => "60"}},
              {"link" => "#inversion", "label" => "Sueldo", "class" => "nav_precio_sponsor", "data" => {"offsettop" => "60"}},
            ]
    @btn_back = {"exist" => true, "text" => "INICIO", "link" => "../"};
  end
end
