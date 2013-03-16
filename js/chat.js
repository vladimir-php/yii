// JavaScript Document
var Chat = {
	
	window_box	: null,
	switch_box	: null,
	content_box	: null,
	
	is_window_show : false,
	
	Init: function () {
		Chat.window_box		= $(".chat-window");
		Chat.switch_box		= Chat.window_box.find(".switch");
		Chat.content_box	= Chat.window_box.find(".content");
	},
	
	switchView : function () {

		if (!Chat.is_window_show) {
			Chat.content_box.show();
			Chat.window_box.addClass ("open");
		}
		else {
			Chat.content_box.hide();
			Chat.window_box.removeClass ("open");
		}
		
		Chat.is_window_show = !Chat.is_window_show;
	}

}