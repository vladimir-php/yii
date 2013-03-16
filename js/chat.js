// JavaScript Document
var Chat = {
	
	window_box	: null,
	switch_box	: null,
	content_box	: null,
	
	message_limit : 0,
	
	message_list_box	: null,
	message_field		: null,
	
	is_window_show : false,
	
	Init: function () {
		Chat.window_box		= $(".chat-window");
		Chat.switch_box		= Chat.window_box.find(".switch");
		Chat.content_box	= Chat.window_box.find(".content");
		
		Chat.message_list_box	= Chat.window_box.find(".messages");
		Chat.message_field		= Chat.window_box.find("[name=message]");
		
		// обработчик клика
		Chat.message_field.unbind("keydown");
		Chat.message_field.bind("keydown", function(event){							   
			switch (event.keyCode) {
				case 13:
					Chat.Add ();
					break;
			}
		});
		
		setInterval (Chat.LoadList, 5000);
	},
	
	switchView : function () {

		if (!Chat.is_window_show) {
			Chat.content_box.show();
			Chat.window_box.addClass ("open");
			Chat.is_window_show = true;
			
			// при открытии окна - обновляем данные (на всякий случай чтобы были актуальные записи)
			Chat.LoadList ();
		}
		else {
			Chat.content_box.hide();
			Chat.window_box.removeClass ("open");
			Chat.is_window_show = false;
		}
	},
	
	Add : function () {
			
		var message = Chat.message_field.val();
		if (!message) {
			alert ("Message is empty!");
		}
		else if (message.length > Chat.message_limit) {
			alert ("Message is too long! Maximum count of characters is "+ Chat.message_limit);
			return;
		}
		
		Chat.message_field.val('');
		
		$.ajax({                                
			url: "/index.php/chat/addmessage/",                         
			type: 'POST',
			data: {
				"message"	: message
			},
			timeout: 35000,                        
			
			error: function() {     
			},
			
			success: function (result) {
				Chat.message_list_box.html (result);
			}
		});
	},
	
	LoadList : function () {
		
		// если окно скрыто - не нужно и ajax'запускать
		if (!Chat.is_window_show) {
			return false;
		}
		
		$.ajax({                                
			url: "/index.php/chat/loadlist/",                         
			type: 'POST',
			data: {
			},
			timeout: 35000,                        
			
			error: function() {     
			},
			
			success: function (result) {
				Chat.message_list_box.html (result);
			}
		});
	}

}