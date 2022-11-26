var colorPicker = new Shiny.InputBinding();

$.extend(colorPicker, {
  
  find: function(scope) {
    return $(scope).find(".htmlColorPicker");
  },

  getValue: function(el) {
    return $(el).val();
  },
  
  setValue: function(el, value) {
    return $(el).val(value);
  },
  
  subscribe: function(el, callback) {
    $(el).on('change', function(event) {
      callback(false);
    });
  }
  
});

Shiny.inputBindings.register(colorPicker);
