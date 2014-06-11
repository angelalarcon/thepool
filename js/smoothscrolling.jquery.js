/*
Plugin Name: smoothscrolling
Author: highercomve (Sergio Marin)
license: MIT
*/

// Load imageLoad Plugin
(function(c,q){var m="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";c.fn.imagesLoaded=function(f){function n(){var b=c(j),a=c(h);d&&(h.length?d.reject(e,b,a):d.resolve(e));c.isFunction(f)&&f.call(g,e,b,a)}function p(b){k(b.target,"error"===b.type)}function k(b,a){b.src===m||-1!==c.inArray(b,l)||(l.push(b),a?h.push(b):j.push(b),c.data(b,"imagesLoaded",{isBroken:a,src:b.src}),r&&d.notifyWith(c(b),[a,e,c(j),c(h)]),e.length===l.length&&(setTimeout(n),e.unbind(".imagesLoaded",p)))}var g=this,d=c.isFunction(c.Deferred)?c.Deferred():0,r=c.isFunction(d.notify),e=g.find("img").add(g.filter("img")),l=[],j=[],h=[];c.isPlainObject(f)&&c.each(f,function(b,a){if("callback"===b)f=a;else if(d)d[b](a)});e.length?e.bind("load.imagesLoaded error.imagesLoaded",p).each(function(b,a){var d=a.src,e=c.data(a,"imagesLoaded");if(e&&e.src===d)k(a,e.isBroken);else if(a.complete&&a.naturalWidth!==q)k(a,0===a.naturalWidth||0===a.naturalHeight);else if(a.readyState||a.complete)a.src=m,a.src=d}):n();return d?d.promise(g):g}})(jQuery);

//Load alice.js Plugin
"Alice.js v1.1.0 | git.io/iaG0wA";!function(a){"use strict";function b(a,b){a=a.replace(/\.alice/g,"").split(" ");for(var d=0,e=a.length;e>d;d++)c(a[d],b)}function c(b,c){if(a.addEventListener)a.addEventListener(b,c,!1);else{if(!a.attachEvent)throw"Your browser is too old, space monkey!";a.attachEvent("on"+b,c)}}var d=a.aliceShim;d||(d=a.aliceShim={});var e;e="pageYOffset"in a?function(){return a.pageYOffset}:function(){var b=a.document,c=b.documentElement;return c&&c.scrollTop||b.body.scrollTop},d.$=function(){return{scrollTop:e,on:b}}}(window),function(a){"use strict";function b(a,b){function c(){h=Date(),g=null,a.apply(f,d)}var d,e,f,g,h=0;return function(){var i=Date(),j=b-(i-h);return d=arguments,f=this,0>=j?(h=i,e=a.apply(f,d)):g||(g=setTimeout(c,j)),e}}var c=a.aliceShim;c||(c=a.aliceShim={}),c._={throttle:b}}(window),function(a,b){"use strict";function c(a){return function(b){return b-a}}var d=a.jQuery,e=a._,f=a.aliceShim,g=d;if(d==b&&(d=f&&f.$,g=a),e==b&&(e=f&&f._),d==b||e==b)throw"Batteries not included!";var h=d(a),i=[],j=0,k=e.throttle(function(){var a=h.scrollTop(),b=a>j;j=a;for(var c=0,d=i.length;d>c;c++)i[c].callback(i[c].check(a),b)},17);h.on("scroll.alice resize.alice",k),g.alice=function(a,b){return"number"==typeof b?b=c(b):"function"!=typeof b&&(b=function(a){return a}),i.push({check:b,callback:a})}}(window),function(a){"use strict";if(!a)throw"Alice is missing!";a.before=function(b,c,d){d=!!d;var e=!1;return a(function(a,c){(d||!e)&&0>a?(e=!0,b(a,c)):e=!1},Number(c))},a.after=function(b,c,d){d=!!d;var e=!1;return a(function(a,c){(d||!e)&&a>0?(e=!0,b(a,c)):e=!1},Number(c))},a.range=function(b,c,d,e){e=!!e;var f=!1,g=d-c;return a(function(a,c){(e||!f)&&a>=0&&g>=a?(f=!0,b(a,c)):f=!1},Number(c))},a.at=function(b,c){var d=!1,e=!1;return a(function(a,c){0===a?(b(a,c),d=e=!1):0>a?(d=!0,e&&(b(a,c),e=!1)):a>0&&(e=!0,d&&(b(a,c),d=!1))},Number(c))}}((window.jQuery||window).alice);

(function( $ , window, document, undefined){

  $.fn.smoothscrolling = function(options) {
    // Default settings
    var settings = $.extend( {
      'offsetTop' : 0,
      'speed'     : 800
    }, options);
    
    // Default varibles of plugin
    var locationPath = filterPath(location.pathname),
        scrollElem = scrollableElement('html', 'body'),
        windowsHeight = $(window).height(),
        allElements = this;
    
    function filterPath(string) {
      return string.replace(/^\//, '')
        .replace(/(index|default).[a-zA-Z]{3,4}$/, '')
        .replace(/\/$/, '');
    }
    // Function to select the element who has scroll
    function scrollableElement(els) {
      for (var i = 0, argLength = arguments.length; i < argLength; i++) {
        var el = arguments[i],
          $scrollElement = $(el);
        if ($scrollElement.scrollTop() > 0) {
          return el;
        } else {
          $scrollElement.scrollTop(1);
          var isScrollable = $scrollElement.scrollTop() > 0;
          $scrollElement.scrollTop(0);
          if (isScrollable) {
            return el;
          }
        }
      }
      return [];
    }

    return this.each(function () {
      // Filter the url path on anchor href
      var thisPath = filterPath(this.pathname) || locationPath,
          $elementOnFullHeight = $(".full-height"),
          $this = $(this); // this inside each referd to dom element thats why use $(this)

      if (locationPath == thisPath && (location.hostname == this.hostname || !this.hostname) && this.hash.replace(/#/, '')) {
        var $target = $(this.hash),
             target = this.hash;
        // If exist the target anchor on site.
        if (target) {
            var offsetTop = ($this.data('offsettop')) ? $this.data('offsettop'):settings.offsetTop ,
                targetOffset;
          // Wait until image are loaded
          $(scrollElem).imagesLoaded(function() {
            // Set every class="full-height" to windows height
            if($elementOnFullHeight.length !== 0) {
              console.log($target.height());
              if($target.height() < windowsHeight) {
                $(".full-height").height(windowsHeight);
              }
            }
            // Element to scroll
            if($target.offset()) {
              targetOffset = $target.offset().top - offsetTop;  
            }
            // Set event click on this element
            $this.on('click', function (event) {
              // Prevent the default behavior of a element
              event.preventDefault();
              
              /*allElements.removeClass("active")
              $this.addClass("active");*/

              // Animate scroll to target
              $(scrollElem).animate({
                scrollTop: targetOffset
              }, settings.speed);
            });

            // Set active from scroll
            targetOffset = targetOffset < 0 ? 0 :  targetOffset;

            $.alice.at(function() {
              allElements.removeClass("active");
              $this.addClass("active");
            }, targetOffset);

          });
        }
      }
    });
  };
})( jQuery, window, document);
