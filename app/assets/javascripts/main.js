$(document).ready(function() {
  var location;
  var map_canvas;
  var map_options;
  var map;
  var smooth;

  map_canvas = document.getElementById('map_canvas');
  if(map_canvas) {
    location = new google.maps.LatLng(19.430314,-99.20112);
    map_options = {
      center: location,
      zoom: 16,
      scrollwheel: false,
      navigationControl: false,
      mapTypeControl: false,
      scaleControl: false,
      draggable: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(map_canvas, map_options);
    new google.maps.Marker({
        position: location,
        map: map,
        title: 'ThePool - Club de Emprendimiento'
    });

  }

  //$(".btn_back").parent('li').addClass('pull-right');

  $(".btn_full").parent('li').css('', '');

  //rellenamos el nav para que siempre tenga 4 items
  var header_items = $('#cat_ul').children().length;
  
  var li_items = 0;
  var li_current_item;
  var $li_current_item;

  $('#carousel-hack').carousel({
    interval: false
  }).on('slid.bs.carousel', function(){
    //ITEMS
    var menu_developer =  $('#menu_developer').hasClass('active') ;
    var menu_home = $('#menu_home').hasClass('active');
    var menu_sponsor = $('#menu_sponsor').hasClass('active'); 


    if (menu_developer) {
        $('.menu_home_li').hide();
        $('.menu_developer_li').show();
        $('.menu_sponsor_li').hide();    
        $(".menu_developer_li a").smoothscrolling();
    }

    if (menu_home) {
        $('.menu_home_li').show();
        $('.menu_developer_li').hide();
        $('.menu_sponsor_li').hide();  
        $(".menu_home_li a").smoothscrolling();
  
    }

    if (menu_sponsor) {
        $('.menu_home_li').hide();
        $('.menu_developer_li').hide();
        $('.menu_sponsor_li').show();  
        $(".menu_sponsor_li a").smoothscrolling();
    }    
  });

  for (var i = 0; i < header_items; i++) {
    li_current_item = $('#cat_ul').children()[i];
    $li_current_item = $(li_current_item);

    if($li_current_item.is('li')) {
        li_items++;
    }  
  }

  for (var i = li_items; i < 4; i++) { 
    $('#cat_ul').append("<li><a href='#'></a><div class='caret_header'><span></span></div></li>");  
    console.log('insertando 1+'); 
  }


  $('#carousel-hack').carousel('pause');
  $('#circle-progress-bar').circliful();
  $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
  $('.nav_arrow').on('click', function() {
    var nav_to = "." + $(this).attr("data-ref");
    $(nav_to).click();
  });
  $('.scholarship').on('click',function(){ 
       if($(this).is(':checked')) {
        $('.why_scholarship').css({"display":"block"});
       } else {
        $('.why_scholarship').css({"display":"none"});
       }
  });

  var options = new primitives.orgdiagram.Config();
  var items = [
    new primitives.orgdiagram.ItemConfig({
        id: 0,
        parent: null,
        title: "Sherlock",
        description: "Buscar como un hacker!",
        image: "../assets/sherlock.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 1,
        parent: 0,
        title: "Sistemas",
        description: "Construye la estructura",
        image: "../assets/sistemas.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 2,
        parent: 0,
        title: "Backend",
        description: "Crea las reglas",
        image: "../assets/backend.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 3,
        parent: 0,
        title: "Frontend",
        description: "Muestra tu mejor cara",
        image: "../assets/frontend.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 4,
        parent: 3,
        title: "HTML",
        description: "Tags y mas tags",
        image: "../assets/html.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 5,
        parent: 3,
        title: "CSS",
        description: "Puro estilo...",
        image: "../assets/css.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 6,
        parent: 5,
        title: "Frameworks CSS",
        description: "Bootstrap",
        image: "../assets/bootstrap.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 7,
        parent: 4,
        title: "Frameworks HTML",
        description: "Preprocesadores",
        image: "../assets/cvs.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 8,
        parent: 1,
        title: "CVS",
        description: "Git Trabajando en equipo",
        image: "../assets/git.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 9,
        parent: 2,
        title: "Algoritmos",
        description: "Aprendiendo las bases",
        image: "../assets/sistemas.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 10,
        parent: 3,
        title: "Javascript",
        description: "Estatico no more",
        image: "../assets/java.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 11,
        parent: 1,
        title: "Linux",
        description: "Amor pinguino",
        image: "../assets/linux.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 12,
        parent: 11,
        title: "Redes",
        description: "4Dummies",
        image: "../assets/redes.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 13,
        parent: 12,
        title: "Intranet",
        description: "LAMP?",
        image: "../assets/intranet.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 14,
        parent: 12,
        title: "Cloud",
        description: "VM, Hosting, VPS",
        image: "../assets/cloud.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 15,
        parent: 8,
        title: "Ambientes",
        description: "Dev, QA, Produccion",
        image: "../assets/ambientes.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 16,
        parent: 2,
        title: "BD",
        description: "Bases de datos",
        image: "../assets/bd.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 17,
        parent: 16,
        title: "Modelado",
        description: "E/R",
        image: "../assets/modelado.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 18,
        parent: 16,
        title: "SQL",
        description: "Queries, SP, Triggers",
        image: "../assets/sql.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 19,
        parent: 9,
        title: "Ruby",
        description: "POO, Web?",
        image: "../assets/ruby.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 20,
        parent: 19,
        title: "Rails",
        description: "Frameworks desde el server",
        image: "../assets/rails.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 21,
        parent: 20,
        title: "Webservices",
        description: "Generando data",
        image: "../assets/networking.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 22,
        parent: 20,
        title: "Testing",
        description: "Refactoring y testing",
        image: "../assets/testing.png"
    }),
    new primitives.orgdiagram.ItemConfig({
        id: 23,
        parent: 10,
        title: "Angular",
        description: "Frameworks desde el cliente",
        image: "../assets/angular.png"
    }),
  ];

  options.items = items;
  /*options.cursorItem = 0;*/
  options.hasSelectorCheckbox = false;
  $("#basicdiagram").orgDiagram(options);

  if(typeof $(".navbar-nav a") !== 'undefined' && $(".navbar-nav a").length > 0) {
    $(".navbar-nav a").smoothscrolling();
  }

})



$(window).bind('scroll', function() {
     if ($(window).scrollTop() > 183) {
         $('#classmates').addClass('fixed');
     }
     else {
         $('#classmates').removeClass('fixed');
     }
});