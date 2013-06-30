if (history && history.pushState) {
  $(function() {
    $(document).on('click', '#movies .pagination a', function(e) {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      e.preventDefault();
    });
    
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });
  });
};
/*
$(function() {
  $(document).on('click', '#movies .pagination a', function() {
    history.pushState({ path: this.path }, '', this.href)
    $.get(this.href, function(data) {
      $('#movies pagination a').slideTo(data)      
    })
    return false  
  })

  $(window).bind('popstate', function() {
    $('#movies pagination a').slideTo(location.pathname)
  })
});*/