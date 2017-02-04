(function($) {
  $.fn.writeText = function(content, callback) {
    var contentArray = content.split(""), current = 0, elem = this;

    let interval = setInterval(function() {
      if(current < contentArray.length) {
        elem.text(elem.text() + contentArray[current++]);
      } else {
        clearInterval(interval)
        callback(elem)
    }}, 50);
  };
})(jQuery);

(function($) {
  $.fn.addBlinkingLine = function() {
    var elem = this;

    let interval = setInterval(function() {
      if(elem.text().slice(-1) === '_'){
        elem.text(elem.text().slice(0, -1));
      } else {
        elem.text(elem.text() + ' _')
    }}, 500);
  };
})(jQuery);
