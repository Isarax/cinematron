history&&history.pushState&&$(function(){$(document).on("click","#movies .pagination a",function(t){$.getScript(this.href),history.pushState(null,document.title,this.href),t.preventDefault()}),$(window).bind("popstate",function(){$.getScript(location.href)})});