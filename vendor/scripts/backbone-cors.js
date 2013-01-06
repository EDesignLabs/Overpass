//Ted Naleid
//http://naleid.com/blog/2012/10/29/overriding-backbone-js-sync-to-allow-cross-origin-resource-sharing-cors/

(function() {
 
  var proxiedSync = Backbone.sync;
 
  Backbone.sync = function (method, model, options) {
    options || (options = {});
 
    if (!options.crossDomain) {
      options.crossDomain = true;
    }
 
    if (!options.xhrFields) {
      options.xhrFields = {withCredentials:true};
    }
 
    return proxiedSync(method, model, options);
  };
})();